<%@page import="model.WorkDayCheckDataBean"%>
<%@page import="dao.MybatisMemberDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>출결 결과 페이지</title>
</head>
<body>
<div><br><br></div>
<div style="   margin: 0 auto;  margin-top: 82px;  display: table;">
	<!-- 출근한 사원의 사원번호와 출근시간을 보여줄 테이블 -->
	<%-- <%  
		   MemberDao service = MemberDao.getInstance();
		   String empno = (String)session.getAttribute("memEmpno"); 
		   List<WorkDayCheckDataBean> list = service.getDate(Integer.parseInt(empno));

	%> --%>
	<table border="1" style= 	margin= 0 auto" >
		<tr align=center>
			<th>사원 번호</th>
			<th>출근 날짜</th>
			<th>출근 시간</th>
			<th>퇴근 시간</th>
			<th>출결 상태</th>
		</tr>


		<c:forEach var="emp" items="${list}">
			<%-- <% for (WorkDayCheckDataBean  emp : list ) { %> --%>
			<tr align=center>
				<td>${empno}</td>
				<td>${emp.workdate}</td>
				<td>${emp.workmin}</td>
				<td>${emp.workmax}</td>





				<!-- String result="";
        	String mintime = emp.getWorkmin();
        	String latetime= "09:01:00";

        	SimpleDateFormat sf = new SimpleDateFormat("HH:mm:ss");
        	Date min_time = sf.parse(mintime);
        	Date late_time = sf.parse(latetime); -->

				



				<!-- if(emp.getWorkmin()==null) {
        		result = "결석"; -->
				<!-- } else if(emp.getWorkmax()!=emp.getWorkmin() && min_time.getTime() >= late_time.getTime()){
        		result = "지각"; -->
				<!-- } else {
        		result = "정상출근";
        	} -->

				<!-- if(emp.getWorkmax()==emp.getWorkmin()) {
        		result ="조퇴";
        	} -->

				<td><i class="fa fa-check-circle-o"></i>${emp.result}</td>
			</tr>
</c:forEach>
	</table>
	</div>
	<br />
	<br />



</body>
</html>