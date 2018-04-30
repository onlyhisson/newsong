<%@ page language="java" contentType="text/html; charset=UTF-8" %>
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
  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">비밀번호 재발송</div>
      <div class="card-body">
        <form id="resetPassword" name="resetPassword" action="resetPassword.do" method="POST">
        	  <div class="form-group">
            <label for="email">Email address</label>
            <input class="form-control" id="email" name="email" type="email" aria-describedby="emailHelp" placeholder="Enter email">
          </div>
          <div>
          	<button type="submit" class="btn btn-primary" style="width:100%" >요청</button>
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
  	function reset_password() {
		document.resetPassword.submit();
  	}
  </script>
</body>

</html>
