<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="model.MemberDataBean"%>
<%@page import="dao.MybatisMemberDao"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${check==1}">

<c:set var="deptno" value="${c.deptno}">
</c:set>

<c:set var="c2" value="${manager.getDept(deptno)}">
</c:set>

<c:set var="name" value="${c.ename}">
</c:set>

<c:set var="dname" value="${c2.dname}">
</c:set>

<c:set var="memID" value="${name}" scope="session"  />
<c:set var="memEmpno" value="${empno}" scope="session"  />
<c:set var="memDname" value="${dname}" scope="session"  />

<script>
alert("${name}님 환영합니다.");
</script>

<%response.sendRedirect("/JSPPro/view/index.jsp"); %>
</c:if>


<c:if test="${check==0}">

<script>
alert("비밀번호가 틀렸습니다. 다시 입력하세요");
history.go(-1);
</script>
</c:if>
<c:if test="${check!=1 && check!= 0}">

<script>
alert("존재하지 않는 사번입니다. 다시 입력하세요");
history.go(-1);
</script>
</c:if>


	
</body>
</html>