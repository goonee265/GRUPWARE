<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.MybatisMemberDao" %>
<%@ page import="model.MemberDataBean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
	
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

	<script>
	var elementClicked = 0;
	
	function checkIt() {

		var sely = document.getElementById("birthy");
		var birthy;
		for(i=0; i<sely.options.length; i++) {
		    if(sely.options[i].selected == true) {
		        birthy = sely.options[i].value;
		        break;
		    }
		}
		
		var selm = document.getElementById("birthm");
		var birthm;
		for(i=0; i<selm.options.length; i++) {
		    if(selm.options[i].selected == true) {
		        birthm = selm.options[i].value;
		        break;
		    }
		}
		
		var seld = document.getElementById("birthd");
		var birthd;
		for(i=0; i<seld.options.length; i++) {
		    if(seld.options[i].selected == true) {
		        birthd = seld.options[i].value;
		        break;
		    }
		}
		

		var userinput = eval("document.userinput");
		if(!userinput.empno.value) {alert("사번을 입력하세요"); userinput.empno.focus(); return false;}
		
		if(!userinput.password.value) {alert("비밀번호를 입력하세요"); userinput.password.focus(); return false;}
		
		if(!userinput.passcheck.value) {alert("비밀번호 확인란을 입력하세요"); userinput.passcheck.focus(); return false;}
		

		
		
		if(birthy == 0 ) {
			alert("연도를 선택하세요");  return false;
		}
		
		if(birthm == 0 ) {
			alert("출생월을 선택하세요");  return false;
		}
		
		if(birthd == 0 ) {
			alert("출생일을 선택하세요");  return false;
		}
		
		if ((birthm==4 || birthm==6 || birthm==9 || birthm==11) && birthd==31)

		{
			alert("해당 월은 31일이 없습니다."); return false;
		}
		
		if (birthm == 2) { var isleap = (birthy % 4 == 0 && (birthy % 100 != 0 || birthy % 400 == 0)); 
		
		if (birthd>29 || (birthd==29 && !isleap)) { 
			alert("해당 년도의 2월은 29일 이후 존재하지 않습니다.");
			return false; } 
		
		else { return true; }
		
		}
		
		if(!userinput.phone.value && !userinput.email.value) {alert("휴대전화 혹은 이메일 중 하나는 입력해야합니다."); userinput.phone.focus(); return false;}
		
		
		if (elementClicked != 1 ) {
		    alert("비밀번호 확인버튼을 눌러주세요"); 
		    return false;
		}
		
		else { return true;}
		
		
			if (psCheck() == false) {
			alert("비밀번호를 확인하지 않았습니다.다시 확인해주세요.");
			return false;
		}
		else {
			return true;
		} 
	}
	
	
	
	function psCheck() {
		 if(userinput.password.value != userinput.passcheck.value) {
			 alert("비밀번호가 일치하지 않습니다 다시 입력하세요"); 
			 elementClicked = 0;
			 return false;
			 
		 }
		 
		 else {
			 alert("비밀번호가 일치합니다."); 
			 elementClicked = 1;
			 return true;
			 
		 }
		 
	 }
	
	
	</script>
	
	<section class="hero-wrap hero-wrap-2 js-fullheight"
		style="background-image: url('<%=request.getContextPath()%>/images/bg_2.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<h1 class="mb-3 bread">MY PAGE</h1>
					<p class="breadcrumbs">
						<span class="mr-2">
						<a href="<%=request.getContextPath()%>/view/index.jsp">Home 
						<i class="ion-ios-arrow-forward"></i></a></span> 
								<span><a href="<%=request.getContextPath()%>/view/member/mypage.jsp">Mypage <i class="ion-ios-arrow-forward"></i></a></span>
								<span>Edit Profile <i class="ion-ios-arrow-forward"></i></span>
					</p>
				</div>
			</div>
		</div>
	</section>

	<hr>
	
<c:if test="${empno eq '0'}">

		<div class="heading-section heading-right"> &emsp;&emsp;&emsp;</div>
			<div class="heading-section heading-right">
			
	            <p><a href="<%=request.getContextPath()%>/view/member/inputForm.jsp" class="btn btn-big btn-info">회원관리</a></p>
</c:if>	
					</div>
					<div><br><br>
				</div>
					
	<div class="col-lg-5 col" ></div>

	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-3">
			<!--left col-->

			<div class="text-center">
				<img src="<%=request.getContextPath() %>/images/person_4.jpg"
					class="avatar img-circle img-thumbnail" alt="avatar">
				<h6>Upload a different photo...</h6>
				<input type="file" class="text-center center-block file-upload">
			</div>
			
			<br>
		</div>
		<!--left col-->

		<hr>
		<div class="container col-sm-6">

			<form action="<%=request.getContextPath()%>/member/mypageUpdatePro" class="form-horizontal" role="form" name="userinput"
				autocomplete="off" onsubmit="return checkIt()" method="post">

				<div class="form-group">
					<label class="col-sm-3 control-label, text-left">사번</label>
					<div class="col-sm-4, form-inline">
						<input type="text" class="form-control" value="${empno}" name="empno" readonly/>
						
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label, text-left">부서명</label>
					<div class="col-sm-4, form-inline">
						<input type="text" class="form-control" value="<%=session.getAttribute("memDname")%>" name="dname" readonly/>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label, text-left">이름</label>
					<div class="col-sm-4, form-inline">
						<input type="text" value="${c.getEname()}" class="form-control" name="ename" readonly/>
					</div>
				</div>


				<div class="form-group">
					<label class="col-sm-4 control-label, text-left">신규 비밀번호</label>
					<div class="col-sm-4, form-inline">
						<input type="password" placeholder="" class="form-control" name="password">
					</div>
					
				</div>

				<div class="form-group">
					<label class="col-sm-4 control-label, text-left">비밀번호 확인</label>
					<div class="col-sm-4, form-inline">
						<input type="password" placeholder="" class="form-control" name="passcheck">
						<button type="button" class="btn btn-lg btn-basic pscheck" onclick="psCheck()" >
							<i class="fas fa-user-check" ></i>
						</button>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label, text-left">생년월일</label>
					<div class="col-sm-4, form-inline">

						<select id="birthy" class="form-control" name="birthy">
							<option value="0"></option>
							<option value="1950">1950</option>
							<option value="1951">1951</option>
							<option value="1952">1952</option>
							<option value="1953">1953</option>
							<option value="1954">1954</option>
							<option value="1955">1955</option>
							<option value="1956">1956</option>
							<option value="1957">1957</option>
							<option value="1958">1958</option>
							<option value="1959">1959</option>
							<option value="1960">1960</option>
							<option value="1961">1961</option>
							<option value="1962">1962</option>
							<option value="1963">1963</option>
							<option value="1964">1964</option>
							<option value="1965">1965</option>
							<option value="1966">1966</option>
							<option value="1967">1967</option>
							<option value="1968">1968</option>
							<option value="1969">1969</option>
							<option value="1970">1970</option>
							<option value="1971">1971</option>
							<option value="1972">1972</option>
							<option value="1973">1973</option>
							<option value="1974">1974</option>
							<option value="1975">1975</option>
							<option value="1976">1976</option>
							<option value="1977">1977</option>
							<option value="1978">1978</option>
							<option value="1979">1979</option>
							<option value="1980">1980</option>
							<option value="1981">1981</option>
							<option value="1982">1982</option>
							<option value="1983">1983</option>
							<option value="1984">1984</option>
							<option value="1985">1985</option>
							<option value="1986">1986</option>
							<option value="1987">1987</option>
							<option value="1988">1988</option>
							<option value="1989">1989</option>
							<option value="1990">1990</option>
							<option value="1991">1991</option>
							<option value="1992">1992</option>
							<option value="1993">1993</option>
							<option value="1994">1994</option>
							<option value="1995">1995</option>
							<option value="1996">1996</option>
							<option value="1997">1997</option>
							<option value="1998">1998</option>
						</select>
						<div> &nbsp;년</div>

						<select id="birthm" class="form-control" name="birthm">
    						<option value="0"></option>
    						<option value="1">1</option>
    						<option value="2">2</option>
    						<option value="3">3</option>
    						<option value="4">4</option>
    						<option value="5">5</option>
    						<option value="6">6</option>
    						<option value="7">7</option>
    						<option value="8">8</option>
    						<option value="9">9</option>
    						<option value="10">10</option>
    						<option value="11">11</option>
    						<option value="12">12</option>
							</select>
							<div>&nbsp;월</div>
							<select id="birthd" class="form-control" name="birthd">
    						<option value="0"></option>
    						<option value="1">1</option>
    						<option value="2">2</option>
    						<option value="3">3</option>
    						<option value="4">4</option>
    						<option value="5">5</option>
    						<option value="6">6</option>
    						<option value="7">7</option>
    						<option value="8">8</option>
    						<option value="9">9</option>
    						<option value="10">10</option>
    						<option value="11">11</option>
    						<option value="12">12</option>
    						<option value="13">13</option>
    						<option value="14">14</option>
    						<option value="15">15</option>
    						<option value="16">16</option>
    						<option value="17">17</option>
    						<option value="18">18</option>
    						<option value="19">19</option>
    						<option value="20">20</option>
    						<option value="21">21</option>
    						<option value="22">22</option>
    						<option value="23">23</option>
    						<option value="24">24</option>
    						<option value="25">25</option>
    						<option value="26">26</option>
    						<option value="27">27</option>
    						<option value="28">28</option>
    						<option value="29">29</option>
    						<option value="30">30</option>
    						<option value="31">31</option>
							</select>
							<div>&nbsp;일</div>
                    </div>
                   </div>
             	<div class="form-group">
					<label class="col-sm-3 control-label, text-left">휴대전화</label>
					<div class="col-sm-4, form-inline">
						<input type="text" class="form-control" placeholder="${c.getPhone()}" name = "phone">
					</div>
				</div>  
				
				<div class="form-group">
					<label class="col-sm-3 control-label, text-left">이메일</label>
					<div class="col-sm-4, form-inline">
						<input type="text" class="form-control" placeholder="${c.getEmail()}" name = "email">
					</div>
				</div>  
			
	    					
				<div class="form-group">
                    <label class="col-sm-3 control-label, text-left">주소</label>
                    <div class="col-sm-4, form-inline">
                        <input type="text" class="form-control" placeholder="${c.getAddress()}" name = "address">
                    </div>
                </div>
             
                <div class="row text-center, form-inline" style="width: 80%">
                    <div style="width: 65%; float:none; margin:0 auto" >
                    
                        <button type="submit" class="btn btn-info"><i class="glyphicon glyphicon-ok-sign"></i>수정</button>
                        &nbsp; 
                        <button type="reset" class="btn btn-info"><i class="glyphicon glyphicon-repeat"></i>취소</button>
                    </div>
                </div>
                
                
            </form> <!-- /form -->
        </div> <!-- ./container -->
		 </div>
      <hr>
      
      
 <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
		</body>
		</html>