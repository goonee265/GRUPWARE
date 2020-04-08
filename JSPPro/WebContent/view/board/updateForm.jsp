<%@page import="model.BoardDataBean"%>
<%@ page contentType="text/html; charset=UTF-8"%>


<html>
<head><title>게시판 수정</title>
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

<div align="center">
<form method="post" name="writeUploadForm" action="<%=request.getContextPath()%>/board/updatePro">
<input type="hidden" name="num" value="${article.num}">
<table class="table4_3" style="width:50%;">
	
	
	<tr>
		<td width="70" align="center">제 목 </td>
		<td width="330">
			<input type="text" size="58" maxlength="50" name="subject"  style="border-radius: 5px;" value="${article.subject}">
		</td>
	</tr>
	
	<tr>
		<td width="70" align="center">내 용 </td>
		<td width="330">
			<textarea name="content" rows="13" cols="40" class="form-control">${article.content}</textarea>
		</td>
	</tr>
	
	<tr>
		<td colspan=2 align="center">
			<input type="submit" value="수정" class="myButton" style="color: white">
			<input type="reset" value="다시작성" class="myButton" style="color: white">
			<input type="button" value="목록보기 " style="color: white" OnClick="window.location='boardlist'" class="myButton">
		</td>
	</tr>
</table>
</form>
</div>

<body>

</body>
</html>