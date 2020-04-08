<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.table4_3 table {
	width: 100%;
	margin: 15px 0;
	border: 0;
}

.table4_3 th {
	background-color: #ADD8E6;
	color: #FFFFFF
}

.table4_3, .table4_3 th, .table4_3 td {
	font-size: 1.05em;
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
	background-color: #fdfdfd;
}

.table4_3 tr:nth-child(even) {
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



<div><br></div>	
<div align="center">
	<form method="post" name="writeUploadform"
		enctype="multipart/form-data"
		action="<%=request.getContextPath()%>/notice/writeUploadPro">
		<input type="hidden" name="num" value="${ num }">
		<table class="table4_3" style="width: 50%;">
			

			<tr>
				<td width="70" align="center">제 목</td>
				<td width="330">
					<input type="text" size="58" maxlength="50"	name="subject" style="border-radius: 5px;">
				</td>
			</tr>
			<tr>
				<td width="70" align="center">내 용</td>
				<td width="330"><textarea name="content" rows="13" cols="40"
						class="form-control"></textarea></td>
			</tr>
			<tr>
				<td width="70" align="center">file</td>
				<td width="330"><input type="file" size="40" maxlength="30"
					name="uploadfile"></td>
			</tr>
			<tr>
				<td colspan=2 align="center"><input type="submit" value="글쓰기" style="color: white" class="myButton">
					<input type="reset" value="다시작성" style="color: white" class="myButton"> <input type="button"
					value="목록보기" style="color: white" class="myButton"
					OnClick="window.location='<%=request.getContextPath()%>/view/notice/noticelist.jsp'">
				</td>
			</tr>

		</table>
	</form>
</div>

<body>

</body>
</html>