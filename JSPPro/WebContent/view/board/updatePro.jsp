<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head><title>게시판 수정 Pro</title></head>
<body>
<%-- <% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="article" class="model.BoardDataBean">
	<jsp:setProperty name="article" property="*"/>
</jsp:useBean> --%>

<%-- <%
	BoardDao dbPro=BoardDao.getInstance();
	dbPro.updateArticle(article);
	
%>  --%>
<meta http-equiv="Refresh" content="0;url=boardlist?pageNum=">
</body>
</html>