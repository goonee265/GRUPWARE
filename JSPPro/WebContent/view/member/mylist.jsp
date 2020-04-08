<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="dao.MybatisMemberDao" %>
<%@ page import="model.MemberDataBean" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

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

</head>
<body>
   <section class="hero-wrap hero-wrap-2 js-fullheight"
      style="background-image: url('<%=request.getContextPath()%>/images/bg_2.jpg');"
      data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
         <div
            class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
            <div class="col-md-9 ftco-animate pb-5">
               <h1 class="mb-3 bread">Mypage</h1>
               <p class="breadcrumbs">
                  <span class="mr-2"><a
                     href="<%=request.getContextPath()%>/view/index.jsp">Home <i
                        class="ion-ios-arrow-forward"></i></a></span> 
                        <span>
                        <a href="<%=request.getContextPath()%>/member/mypage">MY PAGE <i class="ion-ios-arrow-forward"></i></a></span>
                        <span>My Articles <i class="ion-ios-arrow-forward"></i></span>
               </p>
            </div>
         </div>
      </div>
   </section>
   <div><br></div>
   <div><br></div>
   <hr>
   <div class="col-lg-2 col" ></div>

<script>

</script>


<c:if test="${count==0}">
<script>
alert("<%=session.getAttribute("memID")%>님이 작성하신 글 혹은 답글이 없습니다.");
history.go(-1);
</script>
</c:if>

<c:if test="${count!=0}">

<div class="container">
   <div class="row">
      <div class="col-md-12">
         <div class="table-responsive">
            <table id="mytable" class="table table-bordred table-striped">
               <thead>
                  <th>글번호</th>
                  <th>말머리</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>작성일</th>
                  <th>조회수</th>
                  <th>Edit</th>
                  <th>Delete</th>
               </thead>
      
      
<c:forEach  var="article" items="${li}">	
	<tbody>
      <tr>
			<td align="center" > ${number}
			<c:set var="number" value="${number-1}"/>

			</td>
			
			<td> ${article.header}</td>
            <td>  
            <a href="<%=request.getContextPath()%>/board/content?num=${article.num}&pageNum=${currentPage}" >${article.subject}</a>
            </td>            
            <td>${article.name}</td>
            <td><fmt:formatDate value="${article.reg_date}" type="date"/></td>
            <td>${article.readcount}</td>
            <td>
                   <p data-placement="top" data-toggle="tooltip" title="Edit">
                   <button class="btn btn-primary btn-xs" data-title="Edit" 
                   data-toggle="modal" data-target="#edit" 
                   onclick="document.location.href='<%=request.getContextPath()%>/board/updateForm?num=${article.num}'"
                   >

                    <div class="icon"><span class="icon icon-pencil"></span></div>
                   <!-- <span class="glyphicon glyphicon-pencil"></span> --></button></p>
                </td>

                <td>
                    <p data-placement="top" data-toggle="tooltip" title="Delete">
                    <button class="btn btn-danger btn-xs" data-title="Delete" 
                    data-toggle="modal" data-target="#delete" 
                    onclick="document.location.href='<%=request.getContextPath()%>/board/deleteForm?num=${article.num}'"
                    ><div class="icon"></div><span class="icon icon-trash"></span></button></p>
                </td>
     </tr>
                  
               </tbody>
               
</c:forEach>
               
             </table>
            
            
         </div>
      </div>
   </div>
</div>
      

<div><br></div>
          <div class="col text-center">
            <div class="block-27">   
            <ul>

<c:if test="${startPage > bottomLine }">


         <li><a href="mylist?pageNum=${startPage-bottomLine}">&lt;</a></li>
</c:if>
      
<c:forEach var="i" begin="${startPage}" end="${endPage}">

         <li><a href="mylist?pageNum=${i}">${i}</a></li>
</c:forEach>
      
<c:if test="${endPage < pageCount}">

         <li><a href="mylist?pageNum=${startPage+bottomLine}">&gt;</a></li>
</c:if>

</c:if>
 
   </ul>
   </div></div>
   
    
      <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   

</body>
</html>