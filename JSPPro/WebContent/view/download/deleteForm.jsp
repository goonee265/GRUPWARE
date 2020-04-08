<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자료실 글 삭제</title>
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
	<div align="center">
		
		<form name="delform" action="deletePro" method="post">
			<input type="hidden" name="num" value="<%=request.getParameter("num")%>">
			<table class="table4_11" width="360">

				<tr height="30">
					<td>정말로 글을 삭제 하시겠습니까?</td>
				</tr>

				<tr height="30">
					<td align=center><INPUT type="submit" style="color: white" value="글삭제" class="myButton">&nbsp; 
					<input type="button" value="글목록" style="color: white" onclick="document.location.href='downloadlist'" class="myButton"></td>
				</tr>

			</table>
		</form>
		<br>
		<br>
	</div>

</body>
</html>