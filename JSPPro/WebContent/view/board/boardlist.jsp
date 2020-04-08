<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.BoardDataBean"%>
<%@ page import="java.util.List"%>
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
	background-color: #ADD8E6;
	color: #FFFFFF
}

.table4_9, .table4_9 th, .table4_9 td {
	font-size: 1.05em;
	padding: 4px;
	text-align: center;
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

a{
	color:#666666;
	hover: none;
}




</style>

</head>


<body>
	

	<c:if test="${count==0}"> <!-- 글이 없을 때 -->
	
		<div>
			<br>
		</div>
		<div align="center">
			<table class="table4_9">
				<tr>
					<th align="center">게시판에 저장된 글이 없습니다.</th>
				</tr>
			</table>

			<c:if test="${memID != null}"> <!-- 로그인했을 때 -->
			

				<div class="heading-section heading-right">
					<div class="table4_10">
						<a href="writeUploadForm" style="color: white" class="myButton">글쓰기</a>
					</div>
				</div>
				</td>
				</tr>
			</c:if>
		</div>
	
	</c:if><c:if test="${count!=0}">

	
		<div>
			<br>
		</div>
		<div align="center">
			<table class="table4_9" style="width: 75%;">
				<c:if test="${memID != null}">
				<tr style="border: 0">
					<td colspan=6 style="border: 0">
							

							<div class="heading-section heading-right">
								<div class="table4_10">
									<a href="writeUploadForm" style="color: white" class="myButton">글쓰기</a>
								</div>
							</div></td>
				</tr>
				</c:if>

				<tr>
					<th align="center">글번호</th>
					<th align="center">카테고리</th>
					<th style="text-align: center">제목</th>
					<!-- <th align="center">작성자</th> -->
					<th align="center">작성일</th>
					<th align="center">조회수</th>
				</tr>
				<c:forEach  var="article" items="${li}">
				

					<tr>
					
					
						<td align="center" width="8%">${number}
           				<c:set var="number" value="${number-1}" />
            			</td>
						<td align="center" width="10%">${article.header}</td>
						<td width="40%"><c:set var="wid" value="${0}" />
						<c:if test="${article.re_level > 0 }">
							
								<c:set var="wid" value="${20*article.re_level }" />
				
								<img src="<%=request.getContextPath()%>/images/level.gif"
									width="${0}" height="16">
								<img src="<%=request.getContextPath()%>/images/re.png"
									width="20">

							</c:if><c:if test="${memID == null}">
								<!-- } else { -->

								<img src="<%=request.getContextPath()%>/images/level.gif"
									width="${0}" height="16">
								
							</c:if>  
							<a href="${pageContext.request.contextPath}/board/content?num=${article.num}" style="color: grey">${article.subject}</a></td>

						
						<%-- <td align="center" width="8%">${article.name}</td> --%>
						<td align="center" width="10%"><fmt:formatDate value="${article.reg_date}" type="date"/></td>
						<td align="center" width="8%">${article.readcount}</td>
					</tr>
					</c:forEach>

					<%-- <%
				}
			%> --%>
			</table>
		</div>
		<div>
			<br>
		</div>
		<div class="col text-center">
			<div class="block-27">
				<ul>
					<%-- <%
					int bottomLine = 3;
						int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
						int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
						int endPage = startPage + bottomLine - 1;
						if (endPage > pageCount)
							endPage = pageCount; --%>

					<c:if test="${startPage > bottomLine}">
						<li><a href="boardlist?pageNum=${startPage - bottomLine}" style="color: grey">&lt;</a></li>
					</c:if>

					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li><a href="boardlist?pageNum=${i}" style="color: grey">${i}</a></li>
					</c:forEach>
					<c:if test="${endPage < pageCount}">
						<li><a href="boardlist?pageNum=${startPage + bottomLine}" style="color: grey">&gt;</a></li>
					</c:if>

				</ul>

			</div>
			
		</div>
		
		</c:if>
		</div>
		
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
</div>
<%-- <%} %> --%>




</html>