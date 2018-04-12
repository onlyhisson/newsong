<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%!
	String name;
	String id;
	String pw;
	String major;
	String protocol;
	String[] hobbys;
%>

<%
	request.setCharacterEncoding("utf-8");

	name = request.getParameter("name");
	id = request.getParameter("id");
	pw = request.getParameter("pw");
	major = request.getParameter("major");
	protocol = request.getParameter("protocol");
	
	hobbys = request.getParameterValues("hobby");
%>

이름 : <%= name %><br />
아이디 : <%= id %><br />
비밀번호 : <%= pw %><br />
취미 : <%= Arrays.toString(hobbys) %><br />
전공 : <%= major %><br />

</body>
</html>