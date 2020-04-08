<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.MybatisApprovalDao"%>
<%@ page import="dao.MybatisMemberDao"%>
<%@ page import="model.MemberDataBean"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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


	<div align="center">
		<table class="table4_9" style="width: 30%;">

			<tr>
				<th align="center">결재자</th>
				<th align="center">진행상황</th>
			</tr>
			
	<!-- 출력부분 -->		
	
	<!--  기안자(무조건 결재완료) -->		
	<c:if test="${firstconfirmer eq empno}">
			<tr>
				<td align="center" width="10%"><%=session.getAttribute("memID")%></td>
				<td align="center" width="8%">
					<button class="btn btn-success btn-xs" data-title="Delete"
						data-target="#delete">
						<div class="icon" style="display: block; margin: auto;">결재완료</div>
					</button>
				</td>
			</tr>
	</c:if>
	
	
	<!--  기안자가 아닐경우(기안자의 다음 결재자를 확인. 만약 그 다음 결재자가 본인일 경우 미결,
	아닐 경우 결재완료, 이 기안문의 결재자들을 불러와서 세션 번호와 결재자가 일치할때까지 확인 후
	끝까지 일치하지 않으면 전부 미결, 일치하면   -->

	<c:if test="${firstconfirmer ne empno}">
	<c:set var="doneLoop" value="false" />
	<c:forEach var="i" begin="0" end="${fn:length(confirmers)-2}">
	<c:set var="c" value="${manager.getMember(confirmers[i])}" />
	<c:set var="ename" value="${c.getEname()}" />

	<c:if test="${firstconfirmer eq confirmers[i]}">
	<tr>
				<td align="center" width="10%">${ename}</td>
				<td align="center" width="8%">
					<button class="btn btn-success btn-xs" data-title="Delete"
						data-target="#delete">
						<div class="icon" style="display: block; margin: auto;">결재완료</div>
					</button>
				</td>
			</tr>
	</c:if>
	<c:if test="${(confirmers[i+1] ne empno)}">
	<c:set var="c" value="${manager.getMember(confirmers[i+1])}" />
	<c:set var="ename" value="${c.getEname()}" />
		
	<tr>
				<td align="center" width="10%">${ename}</td>
				<td align="center" width="8%">
					<button class="btn btn-success btn-xs" data-title="Delete"
						data-target="#delete">
						<div class="icon" style="display: block; margin: auto;">결재완료</div>
					</button>
				</td>
			</tr>
	
	</c:if>
	
	
	<c:if test="${(confirmers[i+1] eq empno)}">
	<c:set var="c" value="${manager.getMember(confirmers[i+1])}" />
	<c:set var="ename" value="${c.getEname()}" />	
		<tr>
						<td align="center" width="10%">${ename}</td>
						<br>
						<td align="center" width="8%">
							<button class="btn btn-danger btn-xs" data-title="Delete"
								data-toggle="modal" data-target="#delete">
								<div class="icon"></div>
								<span>미결</span>
							</button>
						</td>
					</tr>
	<c:set var="doneLoop" value="true" />		
	</c:if>	

	</c:forEach>
	</c:if>
	
	<c:set var="doneLoop" value="false" />
	<c:forEach var="i" begin="0" end="${fn:length(confirmers)-2}">

		
			<c:if test="${(confirmers[i+1] eq confirmer) && (confirmer eq 'X')}">
				
				<c:set var="c" value="${manager.getMember(confirmers[i+1])}" />
				
				<c:set var="ename" value="${c.getEname()}" />
				
					<c:if test="${ename!=null}">
					<tr>

						<td align="center" width="10%">${ename}</td>
						<br>
						<td align="center" width="8%">
							<button class="btn btn-success btn-xs" data-title="Delete"
								data-target="#delete">
								<div class="icon" style="display: block; margin: auto;">결재완료</div>
							</button>
						</td>
						</td>
					</tr>
					</c:if>
					<c:if test="${ename==null}">
					</c:if>
					<c:set var="doneLoop" value="true" />
				</c:if>

				<c:if test="${(confirmers[i+1] ne confirmer) && (confirmer eq 'X')}">
					
				<c:set var="c" value="${manager.getMember(confirmers[i+1])}" />
				
					<c:set var="ename" value="${c.getEname()}" />
					<tr>
						<td align="center" width="10%">${ename}</td>
						<br>
						<td align="center" width="8%">
							<button class="btn btn-success btn-xs" data-title="Delete"
								data-target="#delete">
								<div class="icon" style="display: block; margin: auto;">결재완료</div>
							</button>
						</td>
						</td>
					</tr>
					<c:set var="doneLoop" value="true" />
				</c:if>

				<c:if test="${(confirmers[i+1] ne confirmer) && (confirmer ne 'X')}">
					<c:if test="${(confirmers[i+1] eq empno)}">
					
					</c:if>
					<c:if test="${((confirmers[i+1] ne empno)) && (firstconfirmer eq empno)}">
				<c:set var="c" value="${manager.getMember(confirmers[i+1])}" />
				
					<c:set var="ename" value="${c.getEname()}" />
					<tr>
						<td align="center" width="10%">${ename}</td>
						<br>
						<td align="center" width="8%">
							<button class="btn btn-success btn-xs" data-title="Delete"
								data-target="#delete">
								<div class="icon" style="display: block; margin: auto;">결재완료</div>
							</button>
						</td>
						</td>
					</tr>
					<c:set var="doneLoop" value="true" />
					</c:if>
				</c:if>
				 

				<c:if test="${(confirmers[i+1] eq confirmer) && (confirmer ne 'X') || (confirmer eq 'O')}">
				
				<c:set var="c" value="${manager.getMember(confirmers[i+1])}" />
				
					<c:set var="ename" value="${c.getEname()}" />
					<tr>
						<td align="center" width="10%">${ename}</td>
						<br>
						<td align="center" width="8%">
							<button class="btn btn-danger btn-xs" data-title="Delete"
								data-toggle="modal" data-target="#delete">
								<div class="icon"></div>
								<span>미결</span>
							</button>
						</td>
					</tr>
					<c:set var="doneLoop" value="true" />
				</c:if>

			</c:forEach>

		</table>
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
</html>