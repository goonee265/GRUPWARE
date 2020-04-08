<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.DownloadDataBean"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page contentType="text/html; charset=UTF-8"%>
<title>downloadList</title>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/animate.css">

<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/magnific-popup.css">

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/aos.css">

<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/ionicons.min.css">

<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/jquery.timepicker.css">


<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/flaticon.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/icomoon.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/style.css">

<style>
.table4_11 table {
	width: 100%;
	margin: 15px 0;
	border: 0;
}

.table4_11 th {
	background-color: #ADD8E6;
	color: #FFFFFF
}

.table4_11, .table4_11 th, .table4_11 td {
	font-size: 1.05em;
	text-align: center;
	padding: 4px;
	border-collapse: collapse;
}

.table4_11 th, .table4_11 td {
	border: 1px solid #ADD8E6;
	border-width: 1px 0 1px 0
}

.table4_11 tr {
	border: 1px solid #ADD8E6;
}

.table4_11 tr:nth-child(odd) {
	background-color: #fdfdfd;
}

.table4_11 tr:nth-child(even) {
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
	<c:if test="${count==0}">
		<div align="center">
			<table class="table4_11" width="700">
				<tr>
					<th align="center">게시판에 저장된 글이 없습니다.</th>
			</table>
		</div>

		<c:if test="${memEmpno == 0}">
			<div align="center">
				<a href="writeUploadForm" style="color: white" class="myButton">글쓰기</a>
			</div>
		</c:if>
		<div>
			<br> <br>
		</div>
	</c:if>
	<c:if test="${count!=0}">
		<div>
			<br>
		</div>
		<div align="center">
			<table class="table4_11" style="width: 75%;">
				<tr style="border: 0">
					<td colspan=6 style="border: 0">
		<c:if test="${memEmpno == 0}">
			<div class="heading-section heading-right">
				<div class="table4_11">
					<a href="writeUploadForm" style="color: white" class="myButton">글쓰기</a>
				</div>
			</div>
		</c:if>
				<tr class="w3-grey">
					<th align="center">번호</th>
					<th align="center">제목</th>
					<th align="center">작성일</th>
					<th align="center">Filename</th>
					<th align="center">Filesize</th>
				</tr>


				<c:forEach var="article" items="${li}">
					<tr>
						<td align="center">${article.num +1}</td>
						<td align="center" width="50%"><a
							href="${pageContext.request.contextPath}/download/content?num=${article.num}" style="color: grey">${article.subject}</a></td>
						<td align="center"><fmt:formatDate
								value="${article.reg_date}" type="date" /></td>
						<td align="center">${article.filename }</td>
						<td align="center">${article.filesize }</td>
					</tr>
				</c:forEach>
			</table>
			</div>
			
			<div>
				<br>
			</div>
			<div class="col text-center">
				<div class="block-27">
					<ul>
						<c:if test="${startPage > bottomLine}">
							<!-- if (startPage > bottomLine) { %> -->
							<li><a href="noticelist?pageNum=${startPage - bottomLine}" style="color: grey">&lt;</a></li>
							<%-- } --%>
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<!-- for (int i = startPage; i <= endPage; i++) { %> -->
							<li><a href="noticelist?pageNum=${i}" style="color: grey">${i}</a></li>
							<%-- <% } --%>
						</c:forEach>
						<c:if test="${endPage < pageCount}">
							<!-- if (endPage < pageCount) { %> -->
							<li><a href="noticelist?pageNum=${startPage + bottomLine}" style="color: grey">&gt;</a></li>
							<%-- <% } %> --%>
						</c:if>

					</ul>

				</div>
			</div>
		</div>
	</c:if>
	<script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath() %>/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/popper.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/jquery.easing.1.3.js"></script>
	<script src="<%=request.getContextPath() %>/js/jquery.waypoints.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/jquery.stellar.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/owl.carousel.min.js"></script>
	<script
		src="<%=request.getContextPath() %>/js/jquery.magnific-popup.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/aos.js"></script>
	<script
		src="<%=request.getContextPath() %>/js/jquery.animateNumber.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="<%=request.getContextPath() %>/js/google-map.js"></script>
	<script src="<%=request.getContextPath() %>/js/main.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.js"
		type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap-datepicker.js"
		type="text/javascript"></script>
</body>
</html>