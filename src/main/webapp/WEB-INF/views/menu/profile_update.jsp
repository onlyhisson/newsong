<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Calendar" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
	/* 현재 year 구하기 */
	Calendar cal = Calendar.getInstance();
	int curYear = cal.get(cal.YEAR);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>NEWSONG J H.O.W 악기팀 - 프로필 수정</title>
  <!-- Bootstrap core CSS-->
  <link href="resources/theme1/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="resources/theme1/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="resources/theme1/css/sb-admin.css" rel="stylesheet">
</head>

<body class="bg-dark">

<!-- 로그인 관리 -->
<c:if test="${empty sessionScope.userinfo.email}">
	<jsp:forward page="../index.jsp"/>
</c:if>

  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">사용자 정보 수정</div>
      <div class="card-body">
        <form id="updateProfile" name="updateProfile" action="profileChange.do" method="post">
        	  <div class="form-group">
            <label for="email">Email address</label>
            <input class="form-control" id="email" name="email" type="email" aria-describedby="emailHelp" readonly value="${sessionScope.userinfo.email}">
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="name">Name</label>
                <input class="form-control" id="name" name="name" type="text" aria-describedby="nameHelp" placeholder="Enter name" value="${sessionScope.userinfo.name}" onkeyup="infoConfirm()">
              </div>
              <div class="col-md-6">
                <label for="age">Age</label>
                <div class="form-row">
						<div class="form-group col-md-3">
						    	<c:set var="cur_year" value="<%=curYear%>" />
							<c:set var="user_year" value="${sessionScope.userinfo.age.substring(0,4)}" />
							<fmt:parseNumber var="userYear" integerOnly="true" type="number" value="${user_year}" />
						    <select class="selectpicker form-control" name="year" id="year" >
						    	<c:forEach var="numY" begin="${cur_year-60}" end="${cur_year}" step="1">
						    		<c:choose>
						    			<c:when test="${userYear eq numY}">
						    				<option selected>${numY}</option>
						    			</c:when>
						    			<c:otherwise>
						    				<option>${numY}</option>
						    			</c:otherwise>
						    		</c:choose>
						    	</c:forEach>
						    </select>
						</div>
						<div class="form-group col-md-1">년</div>
						<div class="form-group col-md-3">
							<c:set var="user_month" value="${sessionScope.userinfo.age.substring(4,6)}" />
							<fmt:parseNumber var="userMonth" integerOnly="true" type="number" value="${user_month}" />
						    <select class="selectpicker form-control" name="month" id="month" >
						    		<c:forEach var="numM" begin="1" end="12" step="1">
						    			<c:choose>
						    				<c:when test="${userMonth eq numM && numM < 10}">
						    					<option selected>0${numM}</option>
						    				</c:when>
						    				<c:when test="${userMonth eq numM && numM > 9}">
						    					<option selected>${numM}</option>
						    				</c:when>
						    				<c:when test="${userMonth ne numM && numM < 10}">
						    					<option>0${numM}</option>
						    				</c:when>
						    				<c:when test="${userMonth ne numM && numM > 9}">
						    					<option>${numM}</option>
						    				</c:when>
						    			</c:choose>
						    		</c:forEach>
						 
						    </select>
						</div>
						<div class="form-group col-md-1">월</div>
						<div class="form-group col-md-3">
							<c:set var="user_day" value="${sessionScope.userinfo.age.substring(6,8)}" />
							<fmt:parseNumber var="userDay" integerOnly="true" type="number" value="${user_day}" />
						    <select class="selectpicker form-control" name="day" id="day" >
						    <c:forEach var="numD" begin="1" end="31" step="1">
				    				<c:choose>
					    				<c:when test="${userDay eq numD && numD < 10}">
					    					<option selected>0${numD}</option>
					    				</c:when>
					    				<c:when test="${userDay eq numD && numD > 9}">
					    					<option selected>${numD}</option>
					    				</c:when>
					    				<c:when test="${userDay ne numD && numD < 10}">
					    					<option>0${numD}</option>
					    				</c:when>
					    				<c:when test="${userDay ne numD && numD > 9}">
					    					<option>${numD}</option>
					    				</c:when>
					    			</c:choose>
						    	</c:forEach>
						    </select>
						</div>
						<div class="form-group col-md-1">일</div>
					</div>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="password">비밀번호</label>
                <input class="form-control" id="password" name="password" type="password" placeholder="Password" onkeyup="infoConfirm()">
              </div>
              <div class="col-md-6">
                <label for="password_ch">비밀번호 재입력</label>
                <input class="form-control" id="pw_ch" name="pw_ch" type="password" placeholder="Confirm password" onkeyup="infoConfirm()">
              </div>
            </div>
          </div>
          <div class="form-group">
			<input type="text" class="form-control" id="guide_msg" style="border-style:none; color:red; background-color:white" readonly>
		  </div>
          <div>
          	<button type="button" class="btn btn-primary" style="width:100%" onclick="update_submit()">수정</button>
          </div>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="javascript:history.back()">취소</a>
        </div>
      </div>
    </div>
  </div>
  <!-- Bootstrap core JavaScript-->
  <script src="resources/theme1/vendor/jquery/jquery.min.js"></script>
  <script src="resources/theme1/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="resources/theme1/vendor/jquery-easing/jquery.easing.min.js"></script>
  <!-- 수정 버튼 입력시 유효성 검사 후 submit -->
  <script>
  	function update_submit() {
  		if(infoConfirm())
  			document.updateProfile.submit();
  	}
  	
  	function infoConfirm() {
  		inputText("");
  		
  		if(document.updateProfile.name.value.length < 1) {
  			inputText("이름을 입력해주세요.");
  			return false;
  		}
  		
  		if(document.updateProfile.password.value  == 0) {
  			inputText("비밀번호를 입력하세요.");
  			return false;
  		}
  		
  		if(document.updateProfile.password.value.length > 10) {
  			inputText("비밀번호를 10자 이하로 입력하세요.");
  			return false;
  		}
  		
  		if(document.updateProfile.password.value != document.updateProfile.pw_ch.value) {
  			inputText("비밀번호 확인이 일치하지 않습니다.");
  			return false;
  		}
  		return true;
  	}
  
  	function inputText(a) {
  		var msg = a;
  		document.updateProfile.guide_msg.value=msg;
  	}
  
  </script>
</body>

</html>
