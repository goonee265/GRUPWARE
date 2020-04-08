<%@page import="model.CalendarDataBean"%>
<%@page import="java.util.List"%>
<%@page import="dao.MybatisCalendarDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>calendar</title>

</head>
<body>
	<div>
		<br><br><br><br><br>
	</div>
	<center>
		<table border=0>
			<!-- 달력 상단 부분, 더 좋은 방법이 없을까? -->
			<tr>
				<td align=left width=200>
					<!-- 년 도--> <a href="calendar?year=${year - 1}&month=${month}"><i class="fas fa fa-chevron-left" style='color:LightSteelBlue'></i></a>

					${year} 년 <a href="calendar?year=${year + 1}&month=${month}"><i class="fas fa fa-chevron-right" style='color:LightSteelBlue'></i></a>
				</td>
				<td align=center width=300>
					<!-- 월 --> <a href="calendar?year=${year}&month=${month-1}"><i class="fas fa fa-chevron-left" style='color:LightSteelBlue'></i></a>

					${month + 1} 월 <a href="calendar?year=${year}&month=${month+1}"><i class="fas fa fa-chevron-right" style='color:LightSteelBlue'></i></a>
				</td>
				<td align=right width=200>${currentYear} - ${currentMonth+1} -
					${currentDate}</td>
			</tr>
		</table>
		<table border=1 cellspacing=0>
			<!-- 달력 부분 -->
			<tr>
				<td width=120><a style="color:Crimson">일</a></td>
				<!-- 일=1 -->
				<td width=120><a style="color:Black">월</a></td>
				<!-- 월=2 -->
				<td width=120><a style="color:Black">화</a></td>
				<!-- 화=3 -->
				<td width=120><a style="color:Black">수</a></td>
				<!-- 수=4 -->
				<td width=120><a style="color:Black">목</a></td>
				<!-- 목=5 -->
				<td width=120><a style="color:Black">금</a></td>
				<!-- 금=6 -->
				<td width=120><a style="color:MediumBlue">토</a></td>
				<!-- 토=7 -->
			</tr>
			<tr height=80>


				<c:forEach var="i" begin="0" end="${startDay-2}">
					

					<td>&nbsp;</td>
				
					<c:set var="br" value="${br+1}" />

					<c:if test="${((br%7)==0)}">
						
						<br>
					</c:if>

				</c:forEach>
			
				<c:forEach var="i" begin="1" end="${endDay}">
			<form name="userinput" method=post action=calendarPro onsubmit="return checkIt()">
						<td align=left valign=top><a style="color: grey" data-toggle="modal" href="#myModal">${i}</a><br> 
			<div class="modal" id="myModal">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">일정추가</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body" align="center">
							<input type=text name=calendarYear value="${year}" size=4 readonly>년 
                     <input type=text name=calendarMonth value="${month+1}" size=2 readonly>월 
                     <input type=text name=calendarDay size=2 >일 <br> 
                     <br> 내용  <input type=text name=calendarContents> 
                   			  <input type="hidden" name="empno" value="<%=session.getAttribute("memEmpno")%>">
							 
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-default">등록</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
					</form>
							<c:if test="${list!=null}">
								<c:forEach var="emp" items="${list}">
									
									<c:if test="${year == emp.calendarYear && month + 1 == emp.calendarMonth && i == emp.calendarDay}">	
			<form name="update" method=post action=updateCalendarPro onsubmit="return checkIt()">
										
									<a style="color:Black">${emp.calendarContents}<br></a>

									<!-- <a href=# style="color:Black"> -->
									</c:if>
								</c:forEach>

							</c:if> 
							<c:set var="br" value="${br+1}" /> 
							<c:if test="${(br % 7) == 0 && i != end}">	
				
			</tr>
			<tr height=80>
				</c:if>
				</c:forEach>

				</td>

				<%-- <%				
						while ((br++)%7 != 0) //말일 이후 빈칸출력
					%> --%>
			</tr>

			
			
			
		</table>
	</center> 
	<script>
	
	function checkIt() {
		var userinput = eval("document.userinput");
		if(!userinput.calendarDay.value) {alert("날짜를 입력하세요"); userinput.calendarDay.focus(); return false;}
		if(!userinput.calendarContents.value) {alert("내용을 입력하세요"); userinput.calendarContents.focus(); return false;}
	}
	</script>
</body>
</html>
