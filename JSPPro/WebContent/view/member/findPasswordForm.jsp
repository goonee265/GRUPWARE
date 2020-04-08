<%@ page import="dao.MybatisMemberDao" %>
<%@ page import="model.MemberDataBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script>
function checkIt() {
var pwqno = document.getElementById("pwqno");
var pwqtext;
for(i=0; i<pwqno.options.length; i++) {
    if(pwqno.options[i].selected == true) {
        pwqtext = pwqno.options[i].value;
        break;
    }
}

	var pwcheckform = eval("document.pwcheckform");
	if(!pwcheckform.empno.value) {alert("사번을 입력하세요"); pwcheckform.empno.focus(); return false;}
	
	if(pwqtext == 0 ) {
		alert("비밀번호 찾기 질문을 선택하세요");  return false;
	}
	
	if(!pwcheckform.pwqans.value) {alert("비밀번호 찾기 답을 입력하세요"); pwcheckform.pwqans.focus(); return false;}
	
}
	
function pwcheck(pwcheckform) {
	
	var pwqno = document.getElementById("pwqno");
	var pwqtext;
	for(i=0; i<pwqno.options.length; i++) {
	    if(pwqno.options[i].selected == true) {
	        pwqtext = pwqno.options[i].value;
	        break;
	    }
	}

	url = "<%=request.getContextPath()%>/member/confirmPassword?empno=" + pwcheckform.empno.value + "&pwqno=" + pwqtext + "&pwqanstext=" + pwcheckform.pwqanstext.value;
	
	open(
		url, "confirm", "toolbar=no, location=, status=no, menubar=no, scrollbars=no, resizable=no, width=400, height=300, left=450"	
	
	);

}

</script>


<div><br></div>
<div class="col-lg-2 col" ></div>
          <div class="col-lg-4 col-md-6 mt-0 mt-md-5" style="display: table; margin-left: auto; margin-right: auto;">
          	<form action="#" class="request-form ftco-animate" name = pwcheckform >
          		<h2>비밀번호 찾기</h2>
	    				<div class="form-group">
	    					<input type="text" class="form-control" placeholder="사번" name = empno>
	    				</div>
	    				<div class="form-group">
	    				<div> 비밀번호 찾기 질문을 선택하세요</div>
	    					<select id="pwqno">
    						<option value=""></option>
    						<option value="1">좋아하는 음식은?</option>
    						<option value="2">자신의 보물 1호</option>
    						<option value="3">인생 좌우명</option>
    						<option value="4">추억하고 싶은 날짜가 있다면?</option>
    						<option value="5">인상깊게 읽은 책 이름</option>
    						<option value="6">두번째로 존경하는 인물</option>
    						<option value="7">다시 태어나면 되고싶은 것은?</option>
							</select>
	    				</div>
	    				
	    				<div class="form-group">
	    					<input type="text" class="form-control" placeholder="비밀번호 찾기 답" name="pwqanstext">
	    				</div>
	            <div class="form-group">
	              <input type="button" value="비밀번호 찾기" class="btn btn-primary py-3 px-4" onclick="pwcheck(this.form)">
	            </div>
	    			</form>
          </div>
<div><br></div>         
          
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