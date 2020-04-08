<!-- 메인 페이지 구성
- 상단 : navbar
- 중단 : 시계 및 회사 금주 일정
- 하단 : footer

※ 팝업창 구현 예정 : 설문조사 form으로 이동
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>홈</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
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
    
    <div class="hero-wrap" style="background-image: url('<%=request.getContextPath() %>/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-start" data-scrollax-parent="true">
          <div class="col-lg-6 col-md-6 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
 
            <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"> Business Leaders <br><span>현재 시각 <span class="icon-clock-o mr-2"></span></span></h1>
            <p class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">
            <div id="timer" class="d-flex">
						  <div class="time" id="year"></div>
						  <div class="time pl-3" id="month"></div>
						  <div class="time pl-3" id="day"></div></div>
			<div id="timer" class="d-flex">			 
						  <div class="time pl-3" id="hour"></div>
						  <div class="time pl-3" id="minute"></div>
						  <div class="time pl-3" id="seconds"></div>
						</div>
          </div>
        </div>

      </div>
    </div>

    <section class="ftco-section">
			<div class="container">
        <div class="ftco-schedule">
        <div class="speaker-wrap">
        <div class="text">			
		<h1><a>금주 일정 안내</a></h1>
		</div></div>
					<div class="row">
		
            <div class="col-md-3 nav-link-wrap text-center text-md-right">
	            <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
	              <a class="nav-link ftco-animate active" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">월요일 <span>2020년 2월 17일</span></a>

	              <a class="nav-link ftco-animate" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false">수요일 <span>2020년 2월 19일</span></a>

	              <a class="nav-link ftco-animate" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3" role="tab" aria-controls="v-pills-3" aria-selected="false">금요일 <span>2020년 2월 21일</span></a>

	            </div>
	          </div>
	          <div class="col-md-9 tab-wrap">
	            
	            <div class="tab-content" id="v-pills-tabContent">

	              <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="day-1-tab">
	              	<div class="speaker-wrap ftco-animate d-md-flex">
	              		<div class="img speaker-img" style="background-image: url(<%=request.getContextPath() %>/images/exhibition.jpg);"></div>
	              		<div class="text">
	              			<h2><a href="#">2020년 취업 박람회 개최관련 미팅</a></h2>
	              			<p>IT, 제조, 항공, 무역, 유통 등 다양한 업계의 유수기업들이 참석하는 2020년 취업 박람회 개최를 맞이해 컨설팅 관련 의뢰가 들어온 상황입니다.
	              			각 팀의 팀장을 포함해 각 기업 대표들이 모여 회의를 진행할 예정입니다.</p>
	              			<span class="time">11:00 am - 12:00 pm</span>
	              			<p class="location"><span class="flaticon-placeholder mr-2"></span>3층 대회의실</p>
	              			<p>각 팀의 실무자를 동반해주시기 바랍니다.</p>
	              			<h3 class="speaker-name">&mdash; <a>이정진</a> <span class="position">경영지원팀 팀장</span></h3>
	              		</div>
	              	</div>
	              	
	              </div>

	              <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-day-2-tab">
	              	<div class="speaker-wrap ftco-animate d-md-flex">
	              		<div class="img speaker-img" style="background-image: url(<%=request.getContextPath() %>/images/staff-4.jpg);"></div>
	              		<div class="text">
	              			<h2><a href="#">Introduction to Business Leaders</a></h2>
	              			<p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
	              			<span class="time">09:00 am - 4:30 pm</span>
	              			<p class="location"><span class="icon-map-o mr-2"></span>20 July 2019 - Hall, Building Los Angeles CA</p>
	              			<p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
	              			<h3 class="speaker-name">&mdash; <a href="#">Ryan Thompson</a> <span class="position">Founder of Wordpress</span></h3>
	              		</div>
	              	</div>
	              	<div class="speaker-wrap ftco-animate d-md-flex">
	              		<div class="img speaker-img" style="background-image: url(<%=request.getContextPath() %>/images/staff-1.jpg);"></div>
	              		<div class="text">
	              			<h2><a href="#">Introduction to Business Leaders</a></h2>
	              			<p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
	              			<span class="time">09:00 am - 4:30 pm</span>
	              			<p class="location"><span class="icon-map-o mr-2"></span>20 July 2019 - Hall, Building Los Angeles CA</p>
	              			<p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
	              			<h3 class="speaker-name">&mdash; <a href="#">Ryan Thompson</a> <span class="position">Founder of Wordpress</span></h3>
	              		</div>
	              	</div>
	              </div>
	              <div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-day-3-tab">
	              	<div class="speaker-wrap ftco-animate d-md-flex">
	              		<div class="img speaker-img" style="background-image: url(<%=request.getContextPath() %>/images/staff-3.jpg);"></div>
	              		<div class="text">
	              			<h2><a href="#">Introduction to Business Leaders</a></h2>
	              			<p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
	              			<span class="time">09:00 am - 4:30 pm</span>
	              			<p class="location"><span class="icon-map-o mr-2"></span>20 July 2019 - Hall, Building Los Angeles CA</p>
	              			<p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
	              			<h3 class="speaker-name">&mdash; <a href="#">Ryan Thompson</a> <span class="position">Founder of Wordpress</span></h3>
	              		</div>
	              	</div>
	              	<div class="speaker-wrap ftco-animate d-md-flex">
	              		<div class="img speaker-img" style="background-image: url(<%=request.getContextPath() %>/images/staff-4.jpg);"></div>
	              		<div class="text">
	              			<h2><a href="#">Introduction to Business Leaders</a></h2>
	              			<p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
	              			<span class="time">09:00 am - 4:30 pm</span>
	              			<p class="location"><span class="icon-map-o mr-2"></span>20 July 2019 - Hall, Building Los Angeles CA</p>
	              			<p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
	              			<h3 class="speaker-name">&mdash; <a href="#">Ryan Thompson</a> <span class="position">Founder of Wordpress</span></h3>
	              		</div>
	              	</div>
	              	<div class="speaker-wrap ftco-animate d-md-flex">
	              		<div class="img speaker-img" style="background-image: url(<%=request.getContextPath() %>/images/staff-1.jpg);"></div>
	              		<div class="text">
	              			<h2><a href="#">Introduction to Business Leaders</a></h2>
	              			<p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
	              			<span class="time">09:00 am - 4:30 pm</span>
	              			<p class="location"><span class="icon-map-o mr-2"></span>20 July 2019 - Hall, Building Los Angeles CA</p>
	              			<p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
	              			<h3 class="speaker-name">&mdash; <a href="#">Ryan Thompson</a> <span class="position">Founder of Wordpress</span></h3>
	              		</div>
	              	</div>
	              </div>
	            </div>
	          </div>
	        </div>
        </div>
			</div>
		</section>
   	

		
  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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
  <script src="<%=request.getContextPath()%>/js/bootstrap.js" type="text/javascript"></script>
  <script src="<%=request.getContextPath()%>/js/bootstrap-datepicker.js" type="text/javascript"></script>
    
    <script>
    var nowTemp = new Date();
    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
     
    var checkin = $('#dpd1').datepicker({
      onRender: function(date) {
        return date.valueOf() < now.valueOf() ? 'disabled' : '';
      }
    }).on('changeDate', function(ev) {
      if (ev.date.valueOf() > checkout.date.valueOf()) {
        var newDate = new Date(ev.date)
        newDate.setDate(newDate.getDate() + 1);
        checkout.setValue(newDate);
      }
      checkin.hide();
      $('#dpd2')[0].focus();
    }).data('datepicker');
    var checkout = $('#dpd2').datepicker({
      onRender: function(date) {
        return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
      }
    }).on('changeDate', function(ev) {
      checkout.hide();
    }).data('datepicker');
    
    
    </script>
  </body>
</html>