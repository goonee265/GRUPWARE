<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>일반 기안문</title>
</head>
<style>
.table4_3 table {
	width: 100%;
	margin: 15px 0;
	border: 0;
}

.table4_3 th {
	background-color: #B0C4DE;
	color: #FFFFFF
}

.table4_3, .table4_3 th, .table4_3 td {
	font-size: 1.05em;
	text-align: center;
	padding: 4px;
	border-collapse: collapse;
}

.table4_3 th, .table4_3 td {
	border: 1px solid #B0C4DE;
	border-width: 1px 0 1px 0
}

.table4_3 tr {
	border: 1px solid #B0C4DE;
}

.table4_3 tr:nth-child(odd) {
	background-color: #fdfdfd;
}

.table4_3 tr:nth-child(even) {
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
<body>
	<div>
		<br><br><br><br>
	</div>
<div align="center">
	<form method="post" name="draft"
	enctype="multipart/form-data"
	action="${pageContext.request.contextPath}/approval/draftPro">
	<div>		
		<table class="table4_3" style="width: 50%;">
			<tr>
				<td align="left" colspan=2 >
					이름 : ${name}
				</td>				
			</tr>
			
			<tr>
				<td align="center">제목</td>
				<td>
					<input type="text" size="45" name="subject" style="border-radius: 5px;">
					<select name="header" style="width:90px; font-size:14px">
  						<option value="일반" selected="selected">일반</option>
  						<option value="휴가">휴가</option>
  						<option value="비품">비품</option>
					</select>
				</td>
			</tr>
				
			<tr>
				<td align="center">내용</td>
				<td width="330">
				<textarea name="content" rows="13" cols="40" class="form-control"></textarea>
				</td>
			</tr>
			
			<tr>
				<td width="70" align="center">file</td>
				<td width="330"><input type="file" size="40" maxlength="30"
					name="downloadFile"></td>
			</tr>
			
			<tr style="border:0">
				<td colspan=2 align="center" style="border:0">
					<input type="submit" value="글쓰기" class="myButton" style="color: white">
					<input type="reset" value="다시쓰기" class="myButton" style="color: white">
					<input type="button" value="목록 " style="color: white" OnClick="window.location='${pageContext.request.contextPath}/approval/approvalListForm'" class="myButton">
				</td>
			</tr>			
		</table>
	</div>
	</form>
</body>
</html>