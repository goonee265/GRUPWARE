<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.ApprovalDataBean"%>
<%@ page import="java.util.List"%>
<%@ page import="dao.MybatisApprovalDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
   font-size: 1.1em;
   text-align: center;
   padding: 4px;
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
   <br/><br/><br/><br/><br/><br/>
</div>

<body>

<div align="center">
<input type="hidden" name="num" value="${article.num }">
      <br>
      <br>
      <p align="center"></p>
      <table class="table4_9" width="60%" height="80%">
         <th>${article.header}</th>
         <tr height="30">

            <td align="center" colspan="4" style="font-size: 30px">${article.subject }</td>
         </tr>
         <tr height="30">
            <td>작성자</td>
            <td align="center">${article.name}</td>
            <td>작성일</td>
            <td align="center">${article.reg_date} </td>
         </tr>
         <tr height="30">
            <td align="center" colspan="1">글내용</td>   
            <td align="left" colspan="3">${article.content }</td>
         </tr>
         <tr height="30">
            <td align="center" colspan="1">파일 이름 :<br/>
            ${article.filename }</td>   
            <td align="left" colspan="3">
            <img src="<%=request.getContextPath()%>/uploadapprovalFile/${article.filename }">
            </td>
         </tr>
      <c:if test="${(empno == empno2) && (confirm eq superior)}">
      		
         <tr height="30" style="border: 0">
            <td colspan="4" style="border: 0"><a
               href="<%=request.getContextPath()%>/approval/draftContentupdateForm?num=${article.num }" style="color: white"
               class="myButton">수정</a> <a
               href="<%=request.getContextPath()%>/approval/draftContentdeleteForm?num=${article.num }" style="color: white"
               class="myButton">삭제</a>   <a
               href="<%=request.getContextPath()%>/approval/approvalCheckEndPro?num=${article.num }" style="color: white"
               class="myButton">전결</a> <a
               href="<%=request.getContextPath()%>/approval/approvalListForm" style="color: white"
               class="myButton">목록</a></td>
               
         </tr>
      </c:if>      
      
      <c:if test="${(empno == empno2) && (article.confirm eq 'O')}">
         <tr height="30" style="border: 0">
            <td colspan="4" style="border: 0"><a
               href="<%=request.getContextPath()%>/approval/draftContentdeleteForm?num=${article.num }"
               class="myButton" style="color: white">삭제</a><a
               href="<%=request.getContextPath()%>/approval/approvalListForm"
               class="myButton" style="color: white">목록</a></td>
         </tr>
      </c:if>
       
      <c:if test="${empno != empno2 }">
         <tr height="30" style="border: 0">
            <td style="border: 0" colspan="4">
               <a href="<%=request.getContextPath()%>/approval/approvalCheckPro?num=${article.num }"
               class="myButton" style="color: white">승인</a>
               <a href="<%=request.getContextPath()%>/approval/approvalCheckEndPro?num=${article.num }"
               class="myButton" style="color: white">전결</a>
               <a href="<%=request.getContextPath()%>/approval/approvalReturnPro?num=${article.num }"
               class="myButton" style="color: white">반려</a>
               <a href="<%=request.getContextPath()%>/approval/approvalListForm"
               class="myButton" style="color: white">목록</a></td>
         </tr>
         </c:if>
      </table>
   </div>



</body>
</html>