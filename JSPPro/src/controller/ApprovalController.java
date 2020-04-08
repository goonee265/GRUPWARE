package controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import anno.ActionAnnotation;
import anno.RequestMapping;
import anno.RequestMapping.RequestMethod;
import dao.MybatisApprovalDao;
import dao.MybatisMemberDao;
import model.ApprovalDataBean;
import model.MemberDataBean;

public class ApprovalController extends ActionAnnotation {
	@Override
	public void initProcess(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

	}

	// approvalList 가져오는 메소드
	@RequestMapping(value = "approvalListForm", method = RequestMethod.GET)
	public String approvalListForm(HttpServletRequest request, HttpServletResponse res) throws Exception {
		HttpSession session = request.getSession();

		int pageSize = 7;
		int currentPage = 0;

		try {
			currentPage = Integer.parseInt(request.getParameter("pageNum"));
			session.setAttribute("pageNum", currentPage);
		} catch (Exception e) {
			if (session.getAttribute("pageNum") == null) {
				session.setAttribute("pageNum", 1);
			}
		}

		currentPage = (int) session.getAttribute("pageNum");

		MybatisApprovalDao service = MybatisApprovalDao.getInstance();
		String empno = (String) session.getAttribute("memEmpno");
		List confirmer = service.getNextConfirm1(Integer.parseInt(empno));

		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = (startRow + pageSize) - 1;
		int count = service.getArticleCount(empno);// 페이지의 글 갯수 가져옴

		if (count != 0) {
			List<ApprovalDataBean> li = service.getArticles(startRow - 1, pageSize, empno);

			if (li != null) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				int number = count - (currentPage - 1) * pageSize;

				int bottomLine = 3; // 밑에 1, 2, 3 나오는 거
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				// 전체 페이지 카운트 대비 실제 페이지 카운트
				// 나눈 나머지가 0이 아니면 1을 더한다. 따라서 7개의 게시물을 3페이지씩으로 나누면 페이지는 총 3개가
				// 나온다.
				int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
				// 해당되는 페이지의 맨 앞의 값
				// 맨 앞 페이지, 현재 페이지, 다음 페이지
				int endPage = startPage + bottomLine - 1;

				if (endPage > pageCount)
					endPage = pageCount;

				for (int i = 0; i < li.size(); i++) {
					ApprovalDataBean article = li.get(i);
					int passcheck = article.getEmpno();
					int draftnum = article.getNum();
					article.setName(service.getArticleName(article.getEmpno()));
					String eno = (String) session.getAttribute("memEmpno");
					int enuma = Integer.parseInt(eno);
					String confirm = service.getNextConfirm2(article.getEmpno(), article.getNum());
					article.setConfirmer(confirm);
				}

				request.setAttribute("currentPage", currentPage);
				request.setAttribute("startRow", startRow);
				request.setAttribute("endRow", endRow);
				request.setAttribute("count", count);
				request.setAttribute("pageSize", pageSize);
				request.setAttribute("number", number);
				request.setAttribute("li", li);
				request.setAttribute("bottomLine", bottomLine);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("confirmer", confirmer);

				return "/view/approval/approvalListForm.jsp";

			} else {
				li = null;
				return "/view/approval/approvalListForm.jsp";
			}

		} else {
			return "/view/approval/approvalListForm.jsp";
		}
	}

	// content handler
	@RequestMapping(value = "draftcontent", method = RequestMethod.GET)
	public String approval_content(HttpServletRequest request, HttpServletResponse res) throws Exception {
		HttpSession session = request.getSession();

		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}

		MybatisApprovalDao dbPro = MybatisApprovalDao.getInstance();
		ApprovalDataBean article = dbPro.getArticle(num);
		article.getEmpno();
		String superior = dbPro.getSuperiorempno(Integer.toString(article.getEmpno()));
		String confirm = dbPro.getNextConfirm2(article.getEmpno(), article.getNum());

		String empno = (String) session.getAttribute("memEmpno");
		// 로그인 한 사람의 사원번호

		int empno2 = article.getEmpno();
		// 글작성자의 사원번호

		request.setAttribute("superior", superior);
		request.setAttribute("confirm", confirm);
		request.setAttribute("article", article);
		request.setAttribute("empno", empno);
		request.setAttribute("empno2", empno2);

		return "/view/approval/draftContent.jsp";
	}

	// draftForm handler
	@RequestMapping(value = "draft", method = RequestMethod.GET)
	public String draft(HttpServletRequest request, HttpServletResponse res) throws Exception {
		HttpSession session = request.getSession();

		String name = (String) session.getAttribute("memID");
		request.setAttribute("name", name);

		return "/view/approval/draft.jsp";
	}

	// draftPro handler
	@RequestMapping(value = "draftPro", method = RequestMethod.POST)
	public String draftPro(HttpServletRequest request, HttpServletResponse res) throws Exception {
		HttpSession session = request.getSession();

		String empno = (String) session.getAttribute("memEmpno");

		String realFolder = "";
		String saveFolder = "uploadapprovalFile";
		String encType = "UTF-8";
		int maxSize = 10 * 1024 * 1024;// 10M
		ServletContext context = getServletContext();
		realFolder = context.getRealPath(saveFolder);

		try {
			MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
					new DefaultFileRenamePolicy());
			ApprovalDataBean article = new ApprovalDataBean();

			Enumeration files = multi.getFileNames();

			if (files.hasMoreElements()) {
				String name = (String) files.nextElement();
				File file = multi.getFile(name);
				if (file != null) {
					article.setFilename(file.getName());
					article.setFilesize((int) file.length());
				} else {
					article.setFilename("");
					article.setFilesize(0);
				}
			}

			MybatisMemberDao service2 = MybatisMemberDao.getInstance();
			int superior = 0;
			superior = service2.getSuperior(Integer.parseInt(empno));
			article.setEmpno(Integer.parseInt(empno));
			article.setHeader(multi.getParameter("header"));
			article.setContent(multi.getParameter("content"));
			article.setSubject(multi.getParameter("subject"));
			article.setConfirm(Integer.toString(superior));
			MybatisApprovalDao service = MybatisApprovalDao.getInstance();
			service.insertArticle(article);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/approval/approvalListForm";
	}

	// updateForm handler
	@RequestMapping(value = "draftContentupdateForm", method = RequestMethod.GET)
	public String draftContentupdateForm(HttpServletRequest request, HttpServletResponse res) throws Exception {

		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		MybatisApprovalDao dbPro = MybatisApprovalDao.getInstance();
		ApprovalDataBean article = dbPro.getUpdateArticle(num);

		request.setAttribute("article", article);

		return "/view/approval/draftContentupdateForm.jsp";
	}

	// updatePro handler
	@RequestMapping(value = "draftContentUpdatePro", method = RequestMethod.POST)
	public String draftContentUpdatePro(HttpServletRequest request, HttpServletResponse res) throws Exception {
		HttpSession session = request.getSession();

		String empno = (String) session.getAttribute("memEmpno");
		String realFolder = "";
		String saveFolder = "uploadapprovalFile";
		String encType = "UTF-8";
		int maxSize = 10 * 1024 * 1024;// 10M
		ServletContext context = getServletContext();
		realFolder = context.getRealPath(saveFolder);

		try {
			MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
					new DefaultFileRenamePolicy());
			ApprovalDataBean article = new ApprovalDataBean();

			Enumeration files = multi.getFileNames();

			if (files.hasMoreElements()) {
				String name = (String) files.nextElement();
				File file = multi.getFile(name);
				if (file != null) {
					article.setFilename(file.getName());
					article.setFilesize((int) file.length());
				} else {
					article.setFilename("");
					article.setFilesize(0);
				}
			}

			MybatisMemberDao service2 = MybatisMemberDao.getInstance();
			int superior = 0;
			superior = service2.getSuperior(Integer.parseInt(empno));
			article.setNum(Integer.parseInt(multi.getParameter("num")));
			article.setEmpno(Integer.parseInt(empno));
			article.setHeader(multi.getParameter("header"));
			article.setContent(multi.getParameter("content"));
			article.setSubject(multi.getParameter("subject"));
			article.setConfirm(Integer.toString(superior));
			MybatisApprovalDao service = MybatisApprovalDao.getInstance();
			service.draftUpdateArticle(article);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/approval/approvalListForm";
	}

	// deleteForm handler
	@RequestMapping(value = "draftContentdeleteForm", method = RequestMethod.GET)
	public String draftContentdeleteForm(HttpServletRequest request, HttpServletResponse res) throws Exception {

		request.setAttribute("num", request.getParameter("num"));

		return "/view/approval/draftContentdeleteForm.jsp";
	}

	// deletePro handler
	@RequestMapping(value = "draftContentdeletePro", method = RequestMethod.POST)
	public String draftContentdeletePro(HttpServletRequest request, HttpServletResponse res) throws Exception {

		int num = Integer.parseInt(request.getParameter("num"));

		MybatisApprovalDao dbPro = MybatisApprovalDao.getInstance();
		dbPro.deleteArticle(num);

		return "redirect:/approval/approvalListForm";
	}

	@RequestMapping(value = "approvalCheckPro")
	public String approvalCheckPro(HttpServletRequest request, HttpServletResponse res) throws Exception {
		HttpSession session = request.getSession();
		String empno = (String) session.getAttribute("memEmpno");
		int num = Integer.parseInt(request.getParameter("num"));
		ApprovalDataBean article = new ApprovalDataBean();
		MybatisApprovalDao dbPro = MybatisApprovalDao.getInstance();
		article = dbPro.getArticle(num);
		article.setCheckEmpno(empno);
		article.setNum(num);
		dbPro.checkArticle(article);

		return "redirect:/approval/approvalListForm";
	}

	@RequestMapping(value = "approvalCheckEndPro")
	public String approvalCheckEndPro(HttpServletRequest request, HttpServletResponse res) throws Exception {
		HttpSession session = request.getSession();

		String empno = (String) session.getAttribute("memEmpno");
		int num = Integer.parseInt(request.getParameter("num"));
		ApprovalDataBean article = new ApprovalDataBean();
		MybatisApprovalDao dbPro = MybatisApprovalDao.getInstance();
		article = dbPro.getArticle(num);
		article.setCheckEmpno(empno);
		article.setNum(num);
		// 세션에서 로그인 정보(사원번호)를 가져와서 다시 setCheckEmpno로 저장하는 이유는 String 타입으로 저장해서
		// 가져오기 위함이다.
		dbPro.checkEndArticle(article);

		return "redirect:/approval/approvalListForm";
	}

	@RequestMapping(value = "checkConfirm")
	public String nohead_checkConfirm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		
		int num = Integer.parseInt(request.getParameter("number"));
		ApprovalDataBean article = new ApprovalDataBean();
		MybatisApprovalDao service = MybatisApprovalDao.getInstance();
		MemberDataBean c = new MemberDataBean();
		MybatisMemberDao manager = MybatisMemberDao.getInstance();
		
		String empno = (String) session.getAttribute("memEmpno");
		String ename = "";
		
		article=service.getArticle(num);
		System.out.println("글번호 :  "+num);		
		
		
		//service.getConfirmers2(empno, num);
		System.out.println(service.getConfirmers2(empno, num));		
		String[] confirmers = service.getConfirmers2(empno, num);		
		request.setAttribute("confirmers", confirmers);
		
		String firstconfirmer = service.getFirstConfirm(num);
		String confirmer = service.getNextConfirm2(Integer.parseInt(empno), num);
		
		if(confirmer==null){
			confirmer="";
		}
		else if(!confirmer.equals("X") || confirmer.equals("O")){
			c = manager.getMember(confirmer);
		}
		
		
		
		ename = c.getEname(); 
		request.setAttribute("empno", empno);
		request.setAttribute("confirmer", confirmer);
		request.setAttribute("ename", ename); 
		request.setAttribute("c", c);
		request.setAttribute("manager", manager);
		request.setAttribute("firstconfirmer", firstconfirmer);
		/*//String[] confirmers = service.getConfirmers(confirmer, num);
		String firstconfirmer = service.getFirstConfirm(num);

		c = manager.getMember(confirmer);
		 ename = c.getEname(); 

		request.setAttribute("empno", empno);
		request.setAttribute("confirmer", confirmer);
		//request.setAttribute("confirmers", confirmers);
		 request.setAttribute("ename", ename); 
		request.setAttribute("c", c);
		request.setAttribute("manager", manager);
		request.setAttribute("firstconfirmer", firstconfirmer);*/

		return "/nohead/checkConfirm.jsp";
	}

	@RequestMapping(value = "approvalReturnPro")
	public String approvalReturnPro(HttpServletRequest request, HttpServletResponse res) throws Exception {
		HttpSession session = request.getSession();

		String empno = (String) session.getAttribute("memEmpno");
		int num = Integer.parseInt(request.getParameter("num"));
		ApprovalDataBean article = new ApprovalDataBean();
		MybatisApprovalDao dbPro = MybatisApprovalDao.getInstance();
		article=dbPro.getArticle(num);
		article.setCheckEmpno(empno);
		article.setNum(num);
		// 세션에서 로그인 정보(사원번호)를 가져와서 다시 setCheckEmpno로 저장하는 이유는 String 타입으로 저장해서
		// 가져오기 위함이다.
		// dbPro.checkEndArticle(article);
		dbPro.returnArticle(article);

		return "redirect:/approval/approvalListForm";
	}

}
