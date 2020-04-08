<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head><title>deletePro</title></head>
<body>

<div><br><br><br> <h1>&nbsp;&nbsp;자유게시판</h1><br></div>
<%-- <% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="article" class="model.BoardDataBean">
	<jsp:setProperty name="article" property="*"/>
</jsp:useBean> --%>

<%-- <%
	int num=Integer.parseInt(request.getParameter("num"));
	BoardDao dbPro=BoardDao.getInstance();
	dbPro.deleteArticle(num);
%> --%>
<meta http-equiv="Refresh" content="0;url=boardlist">
</body>
</html>