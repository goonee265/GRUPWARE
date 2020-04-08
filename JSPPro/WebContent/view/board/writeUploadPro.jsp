<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>writeUploadPro</title>
</head>
<body>

<%-- <% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="article" class="model.BoardDataBean">
	<jsp:setProperty name="article" property="*"/>
</jsp:useBean>
<%
	BoardDao service=BoardDao.getInstance();
	service.insertArticle(article);
	
	response.sendRedirect(request.getContextPath()+"/view/board/boardlist.jsp");
%> --%>
</body>
</html>