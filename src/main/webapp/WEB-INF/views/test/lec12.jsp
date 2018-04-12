<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>lec12 pages.</h2>

<jsp:forward page="include.jsp">
	<jsp:param name="id" value="onlyhisson"/>					
	<jsp:param name="pw" value="pwpwpw"/>					
</jsp:forward>


</body>
</html>