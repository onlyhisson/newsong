<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Join Form</title>
<script src="<c:url value="resources/theme2/js/members.js" />"></script>
</head>

<body>
	<form action="permitJoin.do" method="post" name="join_form">
		EMAIL : <input type="text" name="email" size="20"><br /> 
		PASSWORD : <input type="password" name="pw" size="20"><br /> 
		PASSWORD CHECK : <input type="password" name="pw_check" size="20"><br />
		NAME : <input type="text" name="name" size="20"><br /> 
		AGE : <input type="text" name="age" size="20"><br /> 
		<input type="button" value="JOIN MEMBER" onclick="infoConfirm();">&nbsp;&nbsp;&nbsp;
		<input type="reset" value="CANCEL" onclick="javascript:window.location='/main.do'">
	</form>

<div>${errorMsg}</div>
</body>
</html>