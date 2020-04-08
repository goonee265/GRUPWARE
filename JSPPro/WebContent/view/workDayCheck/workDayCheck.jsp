<%@page import="model.WorkDayCheckDataBean"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<br> <br> <br> <br>
	</div>
	<div class="form-group form-inline">
		<!-- 출퇴근 관리 -->
		<form action="workDayCheckPro" method="post">
			<input type="hidden" name="empno"
				value="<%=session.getAttribute("memEmpno")%>"> <input
				type="submit" value="출결" />
		</form>
	</div>
</body>
</html>