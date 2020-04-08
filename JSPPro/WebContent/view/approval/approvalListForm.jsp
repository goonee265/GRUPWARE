<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.ApprovalDataBean"%>
<%@ page import="java.util.List"%>
<%@ page import="dao.MybatisApprovalDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/animate.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/magnific-popup.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/aos.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/ionicons.min.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/jquery.timepicker.css">


<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/flaticon.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/icomoon.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
<title>Insert title here</title>

<style>
.table4_9 table {
	width: 100%;
	margin: 15px 0;
	border: 0;
}

.table4_9 th {
	background-color: #B0C4DE;
	color: #FFFFFF
}

.table4_9, .table4_9 th, .table4_9 td {
	font-size: 1.05em;
	padding: 4px;
	text-align: center;
	border-collapse: collapse;
}

.table4_9 th, .table4_9 td {
	border: 1px solid #B0C4DE;
	border-width: 1px 0 1px 0
}

.table4_9 tr {
	border: 1px solid #B0C4DE;
}

.table4_9 tr:nth-child(odd) {
	/* background-color:#b0ece0; */
	background-color: #fdfdfd;
}

.table4_9 tr:nth-child(even) {
	background-color: #fdfdfd;
}

.myButton {
	
	
	background-color: #B0C4DE;
	border-radius: 5px;
	border: 1px solid #B0C4DE;
	
	
	
	font-family: Arial;
	font-size: 17px;
	font-weight: bold;
	padding: 4px 20px;
	hover: none;
}
</style>

</head>
<body>
	<c:if test="${count==0 || li==null }">
		<div>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
		</div>
		<div align="center">
			<table class="table4_10">
				<tr>
					<th align="center">기안하거나 기안된 문서가 없습니다.</th>
				</tr>
				<tr>
					<td align="center">
						<div>
							<div class="table4_9">
								<a href="${pageContext.request.contextPath}/approval/draft" class="myButton" style="color: white">기안하기</a>
							</div>
						</div>
					</td>
				</tr>
			</table>
			<div>
				<br>
				<br>
				<br>
			</div>
		</div>
	</c:if>
	
	<c:if test="${li != null }">
		<div>
			<br> <br> <br> <br> <br> <br>
		</div>
		<div align="center">
			<table class="table4_9" style="width: 75%">
				<tr style="border: 0">
					<td colspan=6 style="border: 0">
						<div class="heading-section heading-right">
							<div class="table4_10">
								<a href="${pageContext.request.contextPath}/approval/draft" class="myButton" style="color: white">글쓰기</a>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th align="center">카테고리</th>
					<th align="center">제목</th>
					<th align="center">기안자</th>
					<th align="center">진행상황</th>
					<th align="center">작성일</th>
				</tr>
				
				
				<c:forEach var="article" items="${li}">
					<tr>
						<td align="center" width="10%">${article.header}</td>
						<td width="30%"><a
							href="${pageContext.request.contextPath}/approval/draftcontent?num=${article.num}" style="color: grey">${article.subject}</a>
						</td>
						<td align="center" width="8%">${article.name}</td>
				
			<c:if test="${article.confirmer ne 'X'}">
            	<c:choose>
            	<c:when test="${article.confirmer eq 'O' }">
    
            <td align="center" width="8%">
               <button class="btn btn-warning btn-xs" data-title="Delete"
                  data-toggle="modal" data-target="#delete">
                  <div class="icon" style="color:white">반려</div>
               </button>
            </td>
            	</c:when>
            	<c:otherwise>
            	<td align="center" width="8%">
               <button class="btn btn-danger btn-xs" data-title="Delete"
                  data-toggle="modal" data-target="#delete">
                  <div class="icon"
                     onclick="location.href='<%=request.getContextPath()%>/approval/checkConfirm?number=${article.num}'">미결</div>
               </button>
            </td>
            	</c:otherwise>
            	</c:choose>
            </c:if>
            

            
            <c:if test="${article.confirmer eq 'X'}">
            <br>
            <td align="center" width="8%">
               <button class="btn btn-success btn-xs" data-title="Delete"
                  data-toggle="modal" data-target="#delete">
                  <div class="icon" onclick="location.href='<%=request.getContextPath()%>/approval/checkConfirm?number=${article.num}'">결재완료</div>
               </button>
            </td>
			</c:if>

						<td align="center" width="8%">
            <fmt:formatDate value="${article.reg_date}" type="date" /></td>
					</tr>
				</c:forEach>
				
				
								
			</table>
			
			<div class="col text-center">
					<div class="block-27">
						<ul>
							<p align="center">
								<c:if test="${startPage > bottomLine}">
									<a href="list?pageNum=${startPage - bottomLine}">[이전]</a>
								</c:if>

								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<a href="list?pageNum=${i}">${i}</a>
								</c:forEach>


								<c:if test="${endPage < pageCount}">
									<a href="list?pageNum=${startPage + bottomLine}">[다음]</a>
								</c:if>
							</p>
						</ul>
					</div>
				</div>
		</div>

	</c:if>



		<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/js/jquery-migrate-3.0.1.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/popper.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/jquery.easing.1.3.js"></script>
		<script src="<%=request.getContextPath()%>/js/jquery.waypoints.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/jquery.stellar.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/owl.carousel.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/js/jquery.magnific-popup.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/aos.js"></script>
		<script
			src="<%=request.getContextPath()%>/js/jquery.animateNumber.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/scrollax.min.js"></script>
		<script
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
		<script src="<%=request.getContextPath()%>/js/google-map.js"></script>
		<script src="<%=request.getContextPath()%>/js/main.js"></script>
		<script src="<%=request.getContextPath()%>/js/bootstrap.js"
			type="text/javascript"></script>
		<script src="<%=request.getContextPath()%>/js/bootstrap-datepicker.js"
			type="text/javascript"></script>


</body>
</html>