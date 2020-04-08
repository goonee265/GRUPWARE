<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style>
.table4_3 table {
	border: 0;
	align: center;
}

.table4_3 th {
	background-color: #ADD8E6;
	color: #FFFFFF
}

.table4_3, .table4_3 th, .table4_3 td {
	font-size: 0.95em;
	text-align: center;
	padding: 4px;
	border-collapse: collapse;
}

.table4_3 th, .table4_3 td {
	border: 1px solid #ADD8E6;
	border-width: 1px 0 1px 0
}

.table4_3 tr {
	border: 1px solid #ADD8E6;
}

.table4_3 tr:nth-child(odd) {
	background-color: #ADD8E6;
}

.table4_3 tr:nth-child(even) {
	background-color: #ADD8E6;
}
.table4_3 table {
	width:100%;
	margin:15px 0;
	border:0;
}
.table4_3 th {
	background-color:#ADD8E6;
	color:#FFFFFF
}
.table4_3,.table4_3 th,.table4_3 td {
	font-size:1.05em;
	text-align:center;
	padding:4px;
	border-collapse:collapse;
}
.table4_3 th,.table4_3 td {
	border: 1px solid #ADD8E6;
	border-width:1px 0 1px 0
}
.table4_3 tr {
	border: 1px solid #ADD8E6;
}
.table4_3 tr:nth-child(odd){
	background-color:#fdfdfd;
}
.table4_3 tr:nth-child(even){
	background-color:#fdfdfd;
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
	<div align="center">
		<br>
		<br>
		<p align="center"></p>
		<table class="table4_3" width="60%" height="80%">
		<tr height="30">

				<td align="center" colspan="6" style="font-size: 20px">${article.subject}</td>
		
		</tr>
			<tr height="30">
				<td align="center">글번호</td>
				<td align="center">${article.num }</td>
				<td>작성자</td>
				<td align="center">${article.empno }</td>
				<td>작성일</td>
				<td align="center">${article.reg_date }</td>
			</tr>
			
			<tr height="30">
				<td align="center">글내용</td>
				<td width="330" align="left" colspan="5">${article.content }</td>
			</tr>
			<tr height="30">
				<td align="center">이미지</td>
				<td align="left" colspan="5"><img
					src="<%=request.getContextPath()%>/downloadFile/${article.filename }"></td>
			</tr>
			<tr height="30" style="border: 0">
				<td colspan="6" style="border: 0"><input type="button" style="color: white"
					value="글삭제" class="myButton"
					onclick="document.location.href='deleteForm?num=${article.num}'">&nbsp;&nbsp;&nbsp;&nbsp;

					<input type="button" style="color: white" value="글목록" class="myButton"
					onclick="document.location.href='noticelist'"></td>
			</tr>
		</table>
	</div>
</body>
</html>