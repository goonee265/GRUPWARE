package controller;

import java.io.File;
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
import dao.MybatisNoticeDao;
import model.NoticeDataBean;

@SuppressWarnings("serial")
public class NoticeController extends ActionAnnotation {

	@Override
	public void initProcess(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
	}

	@RequestMapping(value = "noticelist", method = RequestMethod.GET)
	public String notice_noticelist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		int pageSize = 3;

		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}

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

		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;

		MybatisNoticeDao service = MybatisNoticeDao.getInstance();
		int count = service.getArticleCount();
		List li = service.getArticles(startRow, endRow);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		int number = count - (currentPage - 1) * pageSize;

		int bottomLine = 3;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;
		if (endPage > pageCount)
			endPage = pageCount;

		String empno = "";
		if (session.getAttribute("memEmpno") != null) {
			empno = (String) session.getAttribute("memEmpno");
		}
		System.out.println("empno : " + empno);
		// request.setAttribute("memEmpno", empno);
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

		return "/view/notice/noticelist.jsp";
	}

	// content
	@RequestMapping(value = "content", method = RequestMethod.GET)
	public String notice_content(HttpServletRequest request, HttpServletResponse response) {

		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}

		MybatisNoticeDao dbPro = MybatisNoticeDao.getInstance();
		NoticeDataBean article = dbPro.getArticle(num);

		HttpSession session = request.getSession();
		String empno = (String) session.getAttribute("memEmpno");
		int empno2 = article.getEmpno();

		request.setAttribute("article", article);
		request.setAttribute("empno", empno);
		request.setAttribute("empno2", empno2);

		return "/view/notice/content.jsp";
	}

	// writeUploadForm 새글쓰기
	@RequestMapping(value = "writeUploadForm", method = RequestMethod.GET)
	public String notice_writeUploadForm(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int num = 0;
		if (request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
		}

		request.setAttribute("num", num);

		return "/view/notice/writeUploadForm.jsp";
	}

	// writeUploadPro
	@RequestMapping(value = "writeUploadPro", method = RequestMethod.POST)
	public String notice_writeUploadPro(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String realFolder = "";
		String saveFolder = "uploadFile";
		String encType = "UTF-8";
		int maxSize = 10 * 1024 * 1024;// 10M
		ServletContext context = getServletContext();
		realFolder = context.getRealPath(saveFolder);
		try {
			MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
					new DefaultFileRenamePolicy());
			NoticeDataBean article = new NoticeDataBean();
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
			System.out.println("2" + multi);
			article.setNum(Integer.parseInt(multi.getParameter("num")));
			article.setContent(multi.getParameter("content"));
			article.setSubject(multi.getParameter("subject"));

			System.out.println("3");
			MybatisNoticeDao service = MybatisNoticeDao.getInstance();
			service.insertArticle(article);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/notice/noticelist";

	}

	// deleteForm
	@RequestMapping(value = "deleteForm", method = RequestMethod.GET)
	public String notice_deleteForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		request.setAttribute("num", request.getParameter("num"));

		return "/view/notice/deleteForm.jsp";
	}

	// deletePro
	@RequestMapping(value = "deletePro", method = RequestMethod.POST)
	public String notice_deletePro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		NoticeDataBean article = new NoticeDataBean();

		int num = Integer.parseInt(request.getParameter("num"));
		MybatisNoticeDao dbPro = MybatisNoticeDao.getInstance();
		dbPro.deleteArticle(num);

		request.setAttribute("article", article);

		return "redirect:/notice/noticelist";
	}
}