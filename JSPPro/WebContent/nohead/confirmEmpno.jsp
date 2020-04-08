<%@page import="model.MemberDataBean"%>
<%@page import="dao.MybatisMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/animate.css">
    
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/magnific-popup.css">

    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/aos.css">

    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/ionicons.min.css">

    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/flaticon.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/icomoon.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>


<body>



<c:if test="${check != 1 }">

<script>

function setinfo()
{ 
   
opener.document.userinput.empno.value="${empno}";
<%-- 
opener.document.userinput.deptno.value="<%=c.getDeptno()%>";
opener.document.userinput.ename.value="<%=c.getEname()%>"; 
--%>
self.close();

}

</script>
<div align="center">
<br><br>
       사번 ${empno} 이 존재하지 않습니다. <br>
       이 사번으로 가입하시겠습니까?
       <br><br>
      <input type="button" value="예" onclick="setinfo()" class="btn btn-primary">
      <input type="button" value="아니요" onclick="window.close()" class="btn btn-primary">
</div>
</c:if>
<c:if test="${check == 1 }">

<table width="270" border="0" cellspacing="0" cellpadding="5">
   <tr>
      <td align="center">
      
         <p> 입력하신 사번 ${empno}은(는) 존재합니다. </p>
         
   <form name="checkForm" method="get" action="confirmEmpno" autocomplete="off">

   <div class="form-inline"></div>
   다른 사번을 선택하세요.<p>
   
   <input type="text" style="width: 120px;" placeholder="사번" name = "empno" class="form-control">
   <input type="submit" value="확인" class="btn btn-primary">
   
</form>
      </td>
   </tr>
</table>

</c:if>

<script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/popper.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/jquery.easing.1.3.js"></script>
  <script src="<%=request.getContextPath() %>/js/jquery.waypoints.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/jquery.stellar.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/owl.carousel.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/jquery.magnific-popup.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/aos.js"></script>
  <script src="<%=request.getContextPath() %>/js/jquery.animateNumber.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="<%=request.getContextPath() %>/js/google-map.js"></script>
  <script src="<%=request.getContextPath() %>/js/main.js"></script>

</body>


</html>