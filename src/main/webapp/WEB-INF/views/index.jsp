<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	/* 현재 year 구하기 */
	Calendar cal = Calendar.getInstance();
	int curYear = cal.get(cal.YEAR);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>NEWSONG J H.O.W 악기팀</title>
	
	<!-- Slide CSS -->
	<link href="<c:url value="/resources/theme2/css/slide-w3.css" />" rel="stylesheet">
    
    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/resources/theme2/vendor/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">
	
    <!-- Custom fonts for this template -->
    <link href="<c:url value="/resources/theme2/vendor/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

    <!-- Plugin CSS -->
    <link href="<c:url value="/resources/theme2/vendor/magnific-popup/magnific-popup.css" />" rel="stylesheet">
    
	<!-- Custom styles for this template -->
    <link href="<c:url value="/resources/theme2/css/creative.css" />" rel="stylesheet">

  </head>

  <body id="page-top">
 	
 	<!-- 로그인 관리 -->
	<c:choose>
		<c:when test="${empty sessionScope.userinfo.email}">
		</c:when>
		<c:otherwise>
			<jsp:forward page="./menu/religion_check.jsp"/>
		</c:otherwise>
	</c:choose>

	<!-- 회원가입 성공 팝업 -->
	<c:if test="${!empty indexPopMsg}">
		<script>alert("${indexPopMsg}")</script>
		<c:set var="indexPopMsg" value="" scope="session" /> 
	</c:if>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">TOP</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#about">Join</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#menu">Menu</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#gallery">Gallery</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#contact">Contact</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <header class="masthead text-center text-white d-flex">
      <div class="container my-auto">
        <div class="row">
          <div class="col-lg-7 mx-auto">
            <h1 class="text-uppercase">
              <strong>NEWSONG J</strong>
            </h1>
            <hr>
            <p class="text-faded mb-5">
            		명성교회 청년대학부 NEWSONG J<br />
           	    H.O.W 악기팀을 기록하기 위한 공간입니다.  		
            </p>
          </div>
          <div class="col-lg-4 mx-auto">
          	<form name ="indexPageForm" action="login.do" method="POST">
          		<div class="form-group">
          			<span class="pull-left"><label for="email">Email :</label></span>
          			<input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
          		</div>
          		<div class="form-group">
          			<span class="pull-left"><label for="pw">Password :</label></span>
          			<input type="password" class="form-control" id="pw" placeholder="Enter password" name="pw">
          		</div>
          		<div class="form-group">
          			<span class="pull-left">
          				<a href="#" onclick="movePwResetPage(); return false;" style="color:white">비밀번호를 잊으셨나요?</a>
          			</span>
          		</div>
          		<br />
          		<br />
          		<button type="submit" class="btn btn-primary btn-xl rounded-0">Sign In</button>
          	</form>
          </div>
        </div>
      </div>
    </header>

    <section id="menu">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading">MENU</h2>
            <hr class="my-4">
          </div>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
              <i class="fa fa-4x fa-heart text-primary mb-3 sr-icons"></i>
              <h3 class="mb-3">공지사항</h3>
              <p class="text-muted mb-0">찬양팀 전체 일정, 악기팀원의 이벤트 등 주요 사항을 공지합니다.</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
              <i class="fa fa-4x fa-paper-plane text-primary mb-3 sr-icons"></i>
              <h3 class="mb-3">기도제목</h3>
              <p class="text-muted mb-0">매주 악기팀원의 기도제목을 게시하고 중보할 수 있습니다.</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
              <i class="fa fa-4x fa-newspaper-o text-primary mb-3 sr-icons"></i>
              <h3 class="mb-3">경건생활</h3>
              <p class="text-muted mb-0">매주 악기팀원의 경건생활을 게시하고 확인할 수 있습니다.</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
              <i class="fa fa-4x fa-diamond text-primary mb-3 sr-icons"></i>
              <h3 class="mb-3">회계보고</h3>
              <p class="text-muted mb-0">악기팀 재정을 확인할 수 있습니다.</p>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <section class="bg-primary" id="about">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto text-center">
            <h2 class="section-heading text-white">H.O.W 악기팀</h2>
            <hr class="light my-4">
            <p class="text-faded mb-4">
            		NEWSONG J는 명성교회에서 청년들이 함께 드리는 예배를 말합니다.<br />
            		NEWSONG J의 찬양을 위한 부서를 H.O.W(Heart Of Worship) 라고 하며 <br />
            		그 안에서 악기로 주님을 섬기고 있습니다.
            </p>
            <a class="btn btn-light btn-xl js-scroll-trigger" data-toggle="modal" data-target="#joinModal">회원가입</a>
          </div>
        </div>
      </div>
    </section>

	<section id="gallery">
	<div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading">GALLERY</h2>
            <hr class="my-4">
          </div>
        </div>
      </div>
      
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-6 w3-content w3-section" >
			<img class="mySlides w3-animate-fading" src="<c:url value="/resources/theme2/img/portfolio/fullsize/1.jpg" />" style="width: 100%;">
			<img class="mySlides w3-animate-fading" src="<c:url value="/resources/theme2/img/portfolio/fullsize/2.jpg" />" style="width: 100%;">
		</div>
		<div class="col-md-6 w3-content w3-section" >
			<img class="mySlides2 w3-animate-fading2" src="<c:url value="/resources/theme2/img/portfolio/fullsize/4.jpg" />" style="width: 100%;">
			<img class="mySlides2 w3-animate-fading2" src="<c:url value="/resources/theme2/img/portfolio/fullsize/3.jpg" />" style="width: 100%;">
		</div>
        </div>
      </div>
      
      
	
	</section>
 
    <section class="p-0" id="contact">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto text-center">
            <h2 class="section-heading">개발자 소개</h2>
            <hr class="my-4">
            <p class="mb-5">
            		현재 이 웹어플리케이션은 Spring Framework, JSP, MySql, Bootstrap을 사용했습니다.<br />
            		악기팀에서 E.Guitar로 찬양하고 있습니다. 
            </p>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4 ml-auto text-center">
            <i class="fa fa-phone fa-3x mb-3 sr-contact"></i>
            <p>010-9575-3060</p>
          </div>
          <div class="col-lg-4 mr-auto text-center">
            <i class="fa fa-envelope-o fa-3x mb-3 sr-contact"></i>
            <p>
              <a href="mailto:your-email@your-domain.com">onlyhisson@naver.com</a>
            </p>
          </div>
        </div>
      </div>
    </section>
    
    <!-- Modal -->
	<div class="modal fade" id="joinModal" tabindex="-1" role="dialog" aria-labelledby="joinModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="joinModalLabel">회원가입</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<form id="joinForm" name="joinForm" action="permitJoin.do" method="post">
			    <div class="form-group">
			      <label for="email">Email</label>
			      <input type="email" class="form-control" id="email" name="email" onkeyup="infoConfirm()">
			    </div>
			    <div class="form-group">
			      <label for="pwd">Password</label>
			      <input type="password" class="form-control" id="password" name="password" onkeyup="infoConfirm()">
			    </div>
			    <div class="form-group">
			      <label for="pw_ch">Password Check</label>
			      <input type="password" class="form-control" id="pw_ch" name="pw_ch" onkeyup="infoConfirm()">
			    </div>
			    <div class="form-group">
			      <label for="name">Name</label>
			      <input type="text" class="form-control" id="name" name="name" onkeyup="infoConfirm()">
			    </div>		
			    <div class="form-group">
			      <label for="age">Age</label>
				    	<div class="form-row">
						<div class="form-group col-md-5">
						    <select class="selectpicker form-control" name="year" id="year" >
							<%
						    		for(int i = curYear-60; i < curYear; i++){
							%>		<option><%=i%></option>
							<%
						    		}
						    %>
						    </select>
						</div>
						<div class="form-group col-md-1">년</div>
						<div class="form-group col-md-2">
						    <select class="selectpicker form-control" name="month" id="month" >
						    <%
						    		for(int i = 1; i < 13; i++){
						    			if(i < 10) {
							%>		<option>0<%=i%></option>
							<% 
						    			}else{
							%>
									<option>	<%=i%></option>
							<%
						    			}
						    		}
						    %>
						    </select>
						</div>
						<div class="form-group col-md-1">월</div>
						<div class="form-group col-md-2">
						    <select class="selectpicker form-control" name="day" id="day" >
						    <%
						    		for(int i = 1; i < 32; i++){
							 		if(i < 10) {
							%>		<option>0<%=i%></option>
							<% 
						    			}else{
							%>
									<option>	<%=i%></option>
							<%
						    			}
						    		}
						    %>
						    </select>
						</div>
						<div class="form-group col-md-1">일</div>
					</div>
			    </div>
			    
			    <div class="form-group">
			      <input type="text" class="form-control" id="guide_msg" style="border-style:none; color:red; background-color:white" readonly>
			    </div>		    
		  	</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" onclick="modal_submit()">Register</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<!-- Trigger the 회원 가입 성공 여부 modal with a button -->
	<button class="btn btn-default" id="popbutton" data-target="#myModal" data-toggle="modal"></button>
	
	<!-- 회원 가입 성공 여부 Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
		    <div class="modal-content">
	      		<div class="modal-header">
	        			<h5 class="modal-title">NEWSONG J</h4>
	        			<button type="button" class="close" data-dismiss="modal">&times;</button>
	      		</div>
		      	<div class="modal-body">
		        		<p>회원가입 완료.</p>
		      	</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
    <!-- slide JavaScript -->
    <script src="<c:url value="/resources/theme2/js/slide.js" />"></script>
    
    <!-- Bootstrap core JavaScript -->
    <script src="<c:url value="/resources/theme2/vendor/jquery/jquery.min.js" />"></script>
    <script src="<c:url value="/resources/theme2/vendor/bootstrap/js/bootstrap.min.js" />"></script>

    <!-- Plugin JavaScript -->
    <script src="<c:url value="/resources/theme2/vendor/jquery-easing/jquery.easing.min.js" />"></script>
    <script src="<c:url value="/resources/theme2/vendor/scrollreveal/scrollreveal.min.js" />"></script>
    <script src="<c:url value="/resources/theme2/vendor/magnific-popup/jquery.magnific-popup.min.js" />"></script>

    <!-- Custom scripts for this template -->
    <script src="<c:url value="/resources/theme2/js/creative.min.js" />"></script>
    
    <!-- 회원가입 유효성 검사 -->
    <script src="<c:url value="/resources/theme2/js/members.js" />"></script>
    
    <script>
	    function openModalPopup() {
			document.getElementById("popbutton").click();
	    }
	    
	    function movePwResetPage() {
		    	document.indexPageForm.action="forgotPassword.do"; 
		    	document.indexPageForm.method="get"; 
		    	document.indexPageForm.submit();
	    }
    </script>
    
  </body>

</html>
