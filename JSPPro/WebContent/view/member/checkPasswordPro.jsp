<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.MybatisMemberDao" %>
<%@ page import="model.MemberDataBean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if  test="${check==1}">

<%-- <%session.setAttribute("password",);%> --%>
<c:set var="password" value="${password}" scope="session"  />

<c:redirect url="mypage">
</c:redirect>

</c:if>

<c:if test="${check==0}">
	
<script>
alert("비밀번호가 틀렸습니다. 다시 입력하세요");
history.go(-1);
</script>

</c:if>
</body>
</html>