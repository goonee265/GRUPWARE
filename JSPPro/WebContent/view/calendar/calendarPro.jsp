<%@page import="dao.MybatisCalendarDao"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>일정 추가</title>
</head>
<body>
	<%-- request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="article" class="model.CalendarDataBean">
		<jsp:setProperty name="article" property="*" />
	</jsp:useBean>
	
	CalendarDao service=CalendarDao.getInstance();
	service.addSchd(article); --%>
<% 
	response.sendRedirect(request.getContextPath()+"/calendar/calendar"); 
%>