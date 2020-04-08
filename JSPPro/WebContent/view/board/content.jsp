<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="model.BoardDataBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>내용</title>
<style>
.table4_10 table {
	border: 0;
	align: center;
}

.table4_10 th {
	background-color: #ADD8E6;
	color: #FFFFFF
}

.table4_10, .table4_10 th, .table4_10 td {
	font-size: 0.95em;
	text-align: center;
	padding: 4px;
	border-collapse: collapse;
}

.table4_10 th, .table4_10 td {
	border: 1px solid #ADD8E6;
	border-width: 1px 0 1px 0
}

.table4_10 tr {
	border: 1px solid #ADD8E6;
}

.table4_10 tr:nth-child(odd) {
	background-color: #ADD8E6;
}

.table4_10 tr:nth-child(even) {
	background-color: #ADD8E6;
}

.table4_9 table {
	width: 100%;
	margin: 15px 0;
	border: 0;
}

.table4_9 th {
	background-color: #ADD8E6;
	color: #FFFFFF
}

.table4_9, .table4_9 th, .table4_9 td {
	font-size: 1.1em;
	text-align: center;
	padding: 4px;
	border-collapse: collapse;
}

.table4_9 th, .table4_9 td {
	border: 1px solid #ADD8E6;
	border-width: 1px 0 1px 0
}

.table4_9 tr {
	border: 1px solid #ADD8E6;
}

.table4_9 tr:nth-child(odd) {
	/* background-color:#b0ece0; */
	background-color: #fdfdfd;
}

.table4_9 tr:nth-child(even) {
	background-color: #fdfdfd;
}

.myButton {
	
	
	background-color: #ADD8E6;
	border-radius: 5px;
	border: 1px solid #ADD8E6;
	
	
	
	font-family: Arial;
	font-size: 17px;
	font-weight: bold;
	padding: 4px 20px;
	hover: none;
}

</style>

</head>
<body>

	<%-- <%
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}

		BoardDao dbPro = BoardDao.getInstance();
		BoardDataBean article = dbPro.getArticle(num);

		if (session.getAttribute("memEmpno") == null) {
	%> --%>
	<c:if test="${memEmpno == null}">
	<script>
		alert("게시판을 볼 권한이 없습니다.");
		history.go(-1);
	</script>
	</c:if>
	<c:if test="${memEmpno != null}">
	 <%-- <%
		} else { --%>
			<!-- String empno = (String) session.getAttribute("memEmpno");
			int empno2 = article.getEmpno(); -->
	<!-- %> -->

	<div align="center">
		<br>
		<br>
		<p align="center"></p>
		<table class="table4_9" width="60%" height="80%">
			<th>${article.header}</th>
			<tr height="30">

				<td align="center" colspan="6" style="font-size: 20px">${article.subject}</td>

			</tr>
			<tr height="30">
				<!-- <td>작성자</td> -->
				
				<%-- <td align="center">${article.name}</td> --%>
				<td>작성일</td>
				<td align="center">${article.reg_date}</td>
				<td></td><td></td>
				<td align="center">조회수</td>
				<td align="center">${article.readcount}</td>
			</tr>
			<tr height="60">
				<td align="center">글내용</td>
				<td width="330"align="left" colspan="5">${article.content}</td>
			</tr>

			<c:if test="${empno == empno2}">
			<%-- <%
				if (Integer.parseInt(empno) == empno2) {
			%> --%>

			<tr height="30" style="border: 0">
				<td colspan="6" style="border: 0"><a
					href="<%=request.getContextPath()%>/board/updateForm?num=${article.num}"
					class="myButton" style="color: white">수정</a> <a
					href="<%=request.getContextPath()%>/board/deleteForm?num=${article.num}"
					class="myButton" style="color: white">삭제</a> <a
					href="<%=request.getContextPath()%>/board/writeForm?num=${article.num}&ref=${article.ref}&re_level=${article.re_level}&re_step=${article.re_step}"
					class="myButton" style="color: white">답글쓰기</a> <a
					href="<%=request.getContextPath()%>/board/boardlist"
					class="myButton" style="color: white">목록</a></td>
			</tr>
			</c:if>
			<c:if test="${empno != empno2}">
			<%-- <%
				} else {
			%> --%>
			<tr height="30" style="border: 0">
				<td colspan="6" style="border: 0"><a
					href="${pageContext.request.contextPath}/board/boardlist" style="color: white"
					class="myButton">목록</a></td>
			</tr>

			<%-- <% }
			 } %> --%>
			
			 </c:if>
			 </table></div>
			</c:if>

		

	<div>
		<br>
		<br>
	</div>

</body>
</html>