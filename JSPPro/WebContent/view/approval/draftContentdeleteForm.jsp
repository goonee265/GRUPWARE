<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>draftContentdeleteForm</title>
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

<div>
<br/><br/><br/><br/><br/>
</div>
<body>
	<div align="center">
		<form method="post" name="delForm"
		action="${pageContext.request.contextPath}/approval/draftContentdeletePro">
			<input type="hidden" name="num"
				value="<%=request.getParameter("num")%>">
			<table class="table4_9" width="360">
				<tr height="30">
					<td>글을 정말로 삭제하시겠습니까???</td>
				</tr>
				<tr height="30">
					<td align=center><input type="submit" value="글삭제" 
						class="myButton" style="color: white">&nbsp;<input type="button" value="글목록"
						onclick="window.location='${pageContext.request.contextPath}/approval/approvalListForm'"
						class="myButton" style="color: white">
					</td>
				</tr>

			</table>
		</form>
		<br> <br>
	</div>

</body>
</html>