<%@page import="java.sql.Timestamp"%>
<%@page import="dao.MybatisWorkDayCheckDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.WorkDayCheckDataBean"%>

<html>
<head>
<title>TIME</title>
</head>
<body>
	<br><br><br><br><br><br><br><br><br>
	
	<div align=center>
		<%-- <%
		Timestamp workdate = new Timestamp(System.currentTimeMillis());

			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String today = sf.format(workdate);
	%> --%>
		${today} <br />

		<%-- <%
		request.setCharacterEncoding("UTF-8");

			String empno = request.getParameter("empno");
			WorkDayCheckDao employeeDao = WorkDayCheckDao.getInstance();
			employeeDao.insertTime(Integer.parseInt(empno), workdate);
			response.sendRedirect(request.getContextPath() + "/view/workDayCheck/workDayCheckForm.jsp");
	%> --%>

		<%
			response.sendRedirect(request.getContextPath() + "/workDayCheck/workDayCheckForm");
		%>
	</div>
</body>

</html>