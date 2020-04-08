<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html>
<head>
	<title>Login Page</title>
   <!--Made with love by Mutiullah Samim -->
   
	<!--Bootsrap 4 CDN-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

	<!--Custom styles-->
	<link rel="stylesheet" type="text/css" href="styles.css">
	<!-- <style>
	body{background-image: url('http://getwallpapers.com/wallpaper/full/a/5/d/544750.jpg');}
	</style> -->
</head>
<body>
<div class="hero-wrap" style="background-image: url('<%=request.getContextPath() %>/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
<div><br></div>
<div class="container" style="display: table; margin-top: 100px; margin-bottom: 60px; margin-left: auto; margin-right: auto;">
	<div class="d-flex justify-content-center h-100 ">
		<div class="card">
			<div class="card-header">
				<h3>로그인</h3>
				
			</div>
			<div class="card-body">
				<form action="<%=request.getContextPath() %>/member/loginPro">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" placeholder="아이디" name="empno">
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" class="form-control" placeholder="비밀번호" name="password">
					</div>
					
					<div class="form-group">
						<input type="submit" value="로그인" class="btn btn-primary float-right login_btn">
					</div>
				</form>
			</div>
			<div class="card-footer">
				<%-- 
				<div class="d-flex justify-content-center links">
					<a href="<%=request.getContextPath() %>/view/inputForm.jsp">회원가입</a>
				</div> 
				--%>
				<div class="d-flex justify-content-center">
					<a href="<%=request.getContextPath() %>/view/member/findPasswordForm.jsp">비밀번호 찾기</a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>