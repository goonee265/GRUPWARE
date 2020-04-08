package controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import anno.ActionAnnotation;
import anno.RequestMapping;
import anno.RequestMapping.RequestMethod;
import dao.MybatisBoardDao;
import model.BoardDataBean;

@SuppressWarnings("serial")
public class BoardController extends ActionAnnotation {

	@Override
	public void initProcess(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
	}

	/*
	 * // index
	 * 
	 * @RequestMapping(value = "index", method = RequestMethod.GET) public
	 * String board_index(HttpServletRequest request, HttpServletResponse
	 * response) { request.setAttribute("hello", "안녕하세요!"); return
	 * "/view/hello.jsp"; }
	 */

	// writeUploadForm 새글쓰기
	@RequestMapping(value = "writeUploadForm", method = RequestMethod.GET)
	public String board_writeUploadForm(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int num = 0, ref = 1, re_step = 0, re_level = 0;
		if (request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
			ref = Integer.parseInt(request.getParameter("ref"));
			re_step = Integer.parseInt(request.getParameter("re_step"));
			re_level = Integer.parseInt(request.getParameter("re_level"));
		}

		request.setAttribute("num", num);
		request.setAttribute("ref", ref);
		request.setAttribute("re_step", re_step);
		request.setAttribute("re_level", re_level);

		return "/view/board/writeUploadForm.jsp";
	}

	// writeUploadPro
	@RequestMapping(value = "writeUploadPro", method = RequestMethod.POST)
	public String board_writeUploadPro(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		BoardDataBean article = new BoardDataBean();

		article.setEmpno(Integer.parseInt(request.getParameter("empno")));
		article.setNum(Integer.parseInt(request.getParameter("num")));
		article.setHeader(request.getParameter("header"));
		article.setSubject(request.getParameter("subject"));
		article.setContent(request.getParameter("content"));
		article.setRef(Integer.parseInt(request.getParameter("ref")));
		article.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		article.setRe_level(Integer.parseInt(request.getParameter("re_level")));

		MybatisBoardDao service = MybatisBoardDao.getInstance();
		service.insertArticle(article);

		request.setAttribute("article", article);

		return "redirect:/board/boardlist";

	}

	// writeForm(답글)
	@RequestMapping(value = "writeForm", method = RequestMethod.GET)
	public String board_writeForm(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int num = 0, ref = 1, re_step = 0, re_level = 0;
		if (request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
			ref = Integer.parseInt(request.getParameter("ref"));
			re_step = Integer.parseInt(request.getParameter("re_step"));
			re_level = Integer.parseInt(request.getParameter("re_level"));
		}

		request.setAttribute("num", num);
		request.setAttribute("ref", ref);
		request.setAttribute("re_step", re_step);
		request.setAttribute("re_level", re_level);
		return "/view/board/writeForm.jsp";
	}

	// writePro(답글)
	@RequestMapping(value = "writePro", method = RequestMethod.POST)
	public String board_writePro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		BoardDataBean article = new BoardDataBean();

		article.setEmpno(Integer.parseInt(request.getParameter("empno")));
		article.setNum(Integer.parseInt(request.getParameter("num")));
		article.setHeader(request.getParameter("header"));
		article.setSubject(request.getParameter("subject"));
		article.setContent(request.getParameter("content"));
		article.setRef(Integer.parseInt(request.getParameter("ref")));
		article.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		article.setRe_level(Integer.parseInt(request.getParameter("re_level")));
		article.setName(request.getParameter("name"));

		MybatisBoardDao service = MybatisBoardDao.getInstance();
		service.insertArticle(article);

		request.setAttribute("article", article);

		return "redirect:/board/boardlist";

	}

	// boardlist
	@RequestMapping(value="boardlist", method = RequestMethod.GET)
	public String board_boardlist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		int pageSize = 7;
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
		int endRow = (startRow + pageSize) - 1;

		MybatisBoardDao service = MybatisBoardDao.getInstance();
		int count = service.getArticleCount();//페이지의 글 갯수 가져옴
		List<BoardDataBean> li = service.getArticles(startRow, endRow);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		int number = count - (currentPage - 1) * pageSize;
		
		int bottomLine = 3;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		
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
	
		
		return "/view/board/boardlist.jsp?pageNum=1";

	}

	// updateForm
	@RequestMapping(value = "updateForm", method = RequestMethod.GET)
	public String board_updateForm(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		MybatisBoardDao dpPro = MybatisBoardDao.getInstance();
		BoardDataBean article = dpPro.getUpdateArticle(num);

		request.setAttribute("article", article);

		return "/view/board/updateForm.jsp";
	}

	// updatePro
	@RequestMapping(value = "updatePro", method = RequestMethod.POST)
	public String board_updatePro(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		BoardDataBean article = new BoardDataBean();

		article.setNum(Integer.parseInt(request.getParameter("num")));
		article.setSubject(request.getParameter("subject"));
		article.setContent(request.getParameter("content"));

		MybatisBoardDao dbPro = MybatisBoardDao.getInstance();
		dbPro.updateArticle(article);

		request.setAttribute("article", article);

		return "redirect:/board/boardlist";

	}

	// deleteForm
	@RequestMapping(value = "deleteForm", method = RequestMethod.GET)
	public String board_deleteForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		request.setAttribute("num", request.getParameter("num"));

		return "/view/board/deleteForm.jsp";
	}

	// deletePro
	@RequestMapping(value="deletePro", method = RequestMethod.POST)
	public String board_deletePro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		BoardDataBean article = new BoardDataBean();

		int num = Integer.parseInt(request.getParameter("num"));
		MybatisBoardDao dbPro = MybatisBoardDao.getInstance();
		dbPro.deleteArticle(num);

		request.setAttribute("article", article);

		return "redirect:/board/boardlist";
	}

	// content
	@RequestMapping(value="content", method = RequestMethod.GET)
	public String board_content(HttpServletRequest request, HttpServletResponse response) {
	
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		
		MybatisBoardDao dbPro = MybatisBoardDao.getInstance();
		BoardDataBean article = dbPro.getArticle(num);
		
		HttpSession session = request.getSession();
		String empno = (String) session.getAttribute("memEmpno");
		int empno2 = article.getEmpno();
		
		request.setAttribute("article", article);
		request.setAttribute("empno", empno);
		request.setAttribute("empno2", empno2);
		
		return "/view/board/content.jsp";
	}
}
