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
import dao.MybatisMemberDao;
import model.BoardDataBean;
import model.MemberDataBean;

public class MemberController extends ActionAnnotation {

	@Override
	public void initProcess(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
	}

	// checkPassword
	@RequestMapping(value = "checkPassword")
	public String member_checkPass(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		return "/view/member/checkPassword.jsp";
	}
	
	
	// checkPasswordPro
	@RequestMapping(value = "checkPasswordPro")
	public String member_checkPassword(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		request.setCharacterEncoding("UTF-8");
		String empno = (String)session.getAttribute("memEmpno");
		String password = request.getParameter("password");

		MybatisMemberDao manager = MybatisMemberDao.getInstance();
		int check = manager.confirmLogin(Integer.parseInt(empno),password);
		MemberDataBean c = manager.getMember(empno);
		
		request.setAttribute("empno", empno);
		request.setAttribute("password", password);
		request.setAttribute("check", check);
		
		return "/view/member/checkPasswordPro.jsp";
	}
	
	
	// deletePro
	@RequestMapping(value = "deletePro", method=RequestMethod.POST)
	public String member_deletePro(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		request.setCharacterEncoding("UTF-8");
		
		String empno = request.getParameter("empno");

		MybatisMemberDao manager = MybatisMemberDao.getInstance();
		MemberDataBean c = manager.getMember(empno);
		manager.deleteMember(Integer.parseInt(empno));

		return "redirect:/view/index.jsp";

	}
	
	@RequestMapping(value = "inputPro", method=RequestMethod.POST)
	public String member_inputPro(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		MemberDataBean member = new MemberDataBean();
		
		member.setEmpno(Integer.parseInt(request.getParameter("empno")));
		member.setPassword(request.getParameter("password"));
		member.setDeptno(request.getParameter("deptno"));
		member.setEname(request.getParameter("ename"));
		member.setBirthy(request.getParameter("birthy"));
		member.setBirthm(request.getParameter("birthm"));
		member.setBirthd(request.getParameter("birthd"));
		member.setPhone(request.getParameter("phone"));
		member.setEmail(request.getParameter("email"));
		member.setAddress(request.getParameter("address"));
		member.setPosition(request.getParameter("position"));
		member.setSuperior(Integer.parseInt(request.getParameter("superior")));
		
		MybatisMemberDao manager = MybatisMemberDao.getInstance();
		manager.insertMember(member);

		return "redirect:/view/index.jsp";

	}
	
	@RequestMapping(value = "modifyPro", method=RequestMethod.POST)
	public String member_modifyPro(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

/*		<jsp:useBean id="member" class="member.MemberDataBean">
		<jsp:setProperty name="member" property="*"/>
		</jsp:useBean>*/

		request.setCharacterEncoding("utf-8");
		MemberDataBean member = new MemberDataBean();
		
		member.setEmpno(Integer.parseInt(request.getParameter("empno")));
		member.setPassword(request.getParameter("password"));
		member.setDeptno(request.getParameter("deptno"));
		member.setEname(request.getParameter("ename"));
		member.setBirthy(request.getParameter("birthy"));
		member.setBirthm(request.getParameter("birthm"));
		member.setBirthd(request.getParameter("birthd"));
		member.setPhone(request.getParameter("phone"));
		member.setEmail(request.getParameter("email"));
		member.setAddress(request.getParameter("address"));
		member.setPosition(request.getParameter("position"));
		member.setSuperior(Integer.parseInt(request.getParameter("superior")));
		
		MybatisMemberDao manager = MybatisMemberDao.getInstance();
		manager.updateMember(member);

		return "redirect:/view/index.jsp";

	}
	
	
	
	@RequestMapping(value = "mypage")
	public String member_mypage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		request.setCharacterEncoding("utf-8");
		

		String empno =(String)session.getAttribute("memEmpno");
		MybatisMemberDao manager = MybatisMemberDao.getInstance();
		MemberDataBean c = manager.getMember(empno);
		
		
		request.setAttribute("empno", empno);
		request.setAttribute("c", c);
		
		return "/view/member/mypage.jsp";
	}
	
	@RequestMapping(value = "mypageUpdatePro", method=RequestMethod.POST)
	public String member_mypageUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		request.setCharacterEncoding("UTF-8");
		String empno = request.getParameter("empno");
		String password = request.getParameter("password");
		
		MemberDataBean member = new MemberDataBean();
		
		member.setEmpno(Integer.parseInt(empno));
		member.setPassword(password);
		member.setDeptno(request.getParameter("deptno"));
		member.setBirthy(request.getParameter("birthy"));
		member.setBirthm(request.getParameter("birthm"));
		member.setBirthd(request.getParameter("birthd"));
		member.setPhone(request.getParameter("phone"));
		member.setEmail(request.getParameter("email"));
		member.setAddress(request.getParameter("address"));
		
		MybatisMemberDao Service = MybatisMemberDao.getInstance();
		Service.updateMember(member);
		
		return "/view/member/mypageUpdatePro.jsp";
	}
	
	
	@RequestMapping(value = "confirmEmpno")
	public String nohead_confirmEmpno(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		request.setCharacterEncoding("UTF-8");
		String empno = request.getParameter("empno");

		MybatisMemberDao manager = MybatisMemberDao.getInstance();
		int check = manager.confirmEmpno(Integer.parseInt(empno));
		MemberDataBean c = manager.getMember(empno);
		
		request.setAttribute("empno", empno);
		request.setAttribute("check", check);
		request.setAttribute("c", c);
		
		return "/nohead/confirmEmpno.jsp";
	}
	
	@RequestMapping(value = "confirmPassword")
	public String nohead_confirmPassword(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		
		request.setCharacterEncoding("UTF-8");
		String empno = request.getParameter("empno");
		String pwqno = request.getParameter("pwqno");
		String pwqanstext = request.getParameter("pwqanstext");
		String pw = "";
		String pwq = "";
		String pwa = "";

		MybatisMemberDao manager = MybatisMemberDao.getInstance();
		int check = manager.confirmEmpno(Integer.parseInt(empno));
		MemberDataBean c = manager.confirmPasswd(Integer.parseInt(empno));
		
		request.setAttribute("empno", empno);
		request.setAttribute("pwqno", pwqno);
		request.setAttribute("pwqanstext", pwqanstext);
		request.setAttribute("pw", pw);
		request.setAttribute("pwq", pwq);
		request.setAttribute("pwa", pwa);
		request.setAttribute("check", check);
		request.setAttribute("c", c);
		
		return "/nohead/confirmPassword.jsp";
	}
	
	@RequestMapping(value = "loginPro")
	public String member_loginPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		request.setCharacterEncoding("UTF-8");
		String empno = request.getParameter("empno");
		String password = request.getParameter("password");


		MybatisMemberDao manager = MybatisMemberDao.getInstance();
		int check = manager.confirmLogin(Integer.parseInt(empno),password);
		MemberDataBean c = manager.getMember(empno);

		request.setAttribute("empno", empno);
		request.setAttribute("password", password);
		request.setAttribute("check", check);
		request.setAttribute("manager", manager);
		request.setAttribute("c", c);
		
		return "/view/member/loginPro.jsp";
	}
	
	@RequestMapping(value = "logoutPro")
	public String member_logoutPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		session.removeAttribute("memID");
		session.removeAttribute("password");
		session.removeAttribute("memEmpno");

		
		return "redirect:/view/member/loginForm.jsp";
	}
	
	@RequestMapping(value = "mylist")
	public String member_mylist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		
		   int pageSize=10;
		   String pageNum=request.getParameter("pageNum");
		   if(pageNum==null||pageNum.equals("")){
		      pageNum="1";
		   }
		   
		   int currentPage=0;
		   try{
		      currentPage=Integer.parseInt(request.getParameter("pageNum"));
		      session.setAttribute("pageNum", currentPage);
		   }catch(Exception e){
		      if(session.getAttribute("pageNum")==null){
		         session.setAttribute("pageNum", 1);
		      }
		   }
		   
		   currentPage=(int)session.getAttribute("pageNum");
		   
		   
		   int startRow=(currentPage-1)*pageSize+1;
		   int endRow=(startRow+pageSize)-1;
		   
		   String empno = (String)session.getAttribute("memEmpno");
		   MybatisBoardDao service = MybatisBoardDao.getInstance();
		   MybatisMemberDao manager = MybatisMemberDao.getInstance();
		   int count=service.getmyArticleCount(Integer.parseInt(empno));//페이지의 글 갯수 가져옴
		   List<BoardDataBean> li= manager.getArticles(startRow-1, pageSize, Integer.parseInt(empno));
		   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		   int number=count-(currentPage-1)*pageSize;
		   
		   
		   int bottomLine=3;
		      int pageCount=count/pageSize+(count%pageSize==0 ? 0 :1);
		      int startPage=1+(currentPage-1)/bottomLine*bottomLine;
		      int endPage=startPage+bottomLine-1;
		      if(endPage>pageCount)
		         endPage=pageCount;          

		    request.setAttribute("currentPage", currentPage);
		  	request.setAttribute("startRow", startRow);
		  	request.setAttribute("endRow", endRow);
		  	request.setAttribute("count", count);
		  	request.setAttribute("pageSize", pageSize);
		  	request.setAttribute("number", number);
		  	request.setAttribute("bottomLine", bottomLine);
		  	request.setAttribute("startPage", startPage);
		  	request.setAttribute("endPage", endPage);
		  	request.setAttribute("pageCount", pageCount);
		  

		  	request.setAttribute("li", li);
		      
		      
		return "/view/member/mylist.jsp";
	}
	

	
	
	
	
	
	

}
