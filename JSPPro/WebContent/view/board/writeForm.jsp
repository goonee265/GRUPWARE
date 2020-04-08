<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>답글 쓰기</title>
<style>
.table4_10 table {
	border: 0;
	align: center;
}

.table4_10 th {
	background-color: #ADD8E6;
	color: #FFFFFF
}

.table4_10, .table4_10 th, .table4_10 td {
	font-size: 0.95em;
	text-align: center;
	padding: 4px;
	border-collapse: collapse;
}

.table4_10 th, .table4_10 td {
	border: 1px solid #ADD8E6;
	border-width: 1px 0 1px 0
}

.table4_10 tr {
	border: 1px solid #ADD8E6;
}

.table4_10 tr:nth-child(odd) {
	background-color: #ADD8E6;
}

.table4_10 tr:nth-child(even) {
	background-color: #fdfdfd;
}

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
	font-size: 1.1em;
	text-align: center;
	padding: 4px;
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
</style>
</head>
<div align="center">
	<%-- <%//수정
int num=0,ref=1,re_step=0,re_level=0;
if(request.getParameter("num")!=null){
	num=Integer.parseInt(request.getParameter("num"));
	ref=Integer.parseInt(request.getParameter("ref"));
	re_step=Integer.parseInt(request.getParameter("re_step"));
	re_level=Integer.parseInt(request.getParameter("re_level"));
}
%> --%>

	<form method="post" name="writeform"
		action="${pageContext.request.contextPath}/board/writePro">
		<input type="hidden" name="num" value="${num}"> <input
			type="hidden" name="ref" value="${ref}"> <input type="hidden"
			name="re_step" value="${re_step}"> <input type="hidden"
			name="re_level" value="${re_level}"> <input type="hidden"
			name="empno" value="${memEmpno}">
		<!-- el 쌍따옴표 안에 쌍따옴표 써야할 경우! 확인필요 -->
		<table class="table4_9" style="width: 50%;">

			<tr>
				<th colspan=3>답글 쓰기</th>
			</tr>
			
			<tr>
				<td style = "width:10px; margin:0px; padding:0px" >
					<select name="header" style="width:90px; font-size:16px">
  						<option value="자유" selected="selected">자유</option>
  						<option value="질문과 답변">질문과 답변</option>
  						<option value="요청">요청</option>
					</select>
				</td>
				<td>
					<c:if test="${num==0}">	
					</c:if> <c:if test="${num!=0 }">
					<input type="text" size="50" maxlength="50" name="subject" style="border-radius: 5px;"
							value=" 답글> ">
						
					</c:if>
				</td>
			</tr>
		
			<tr>
				<td width="70"align="center">내용</td>
				<td width="330"><textarea name="content" rows="13" cols="40" class="form-control"></textarea>
				</td>
			</tr>

			<tr>
				<td colspan=3 align="center" style="border: 0"><input
					type="submit" value="답글쓰기" style="color: white" class="myButton"> <input
					type="reset" value="다시작성" style="color: white" class="myButton"> <input
					type="button" value="목록보기 " style="color: white"
					OnClick="window.location='${pageContext.request.contextPath}/board/boardlist'"
					class="myButton"></td>
			</tr>
		</table>
	</form>


</div>
<body>

</body>
</html>