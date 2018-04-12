<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="/" method="post">
		이름 : <input type="text" name="name" size="10"><br/>
		아이디 : <input type="text" name="id" size="10"><br/>
		비밀번호 : <input type="password" name="pw" size="10"><br/>
		
		취미 : <input type="checkbox" name="hobby" size="10">독서
		<input type="checkbox" name="hobby" size="10" value="cook">요리 
		<input type="checkbox" name="hobby" size="10" value="run">조깅 
		<input type="checkbox" name="hobby" size="10" value="swim">수영 
		<input type="checkbox" name="hobby" size="10" value="sleep">취침<br/> 
		
		<input type="radio" name="major" size="10" value="kor">국어
		<input type="radio" name="major" size="10" value="eng" checked="checked">영어
		<input type="radio" name="major" size="10" value="mat">수학
		<input type="radio" name="major" size="10" value="des">디자인<br/>
		
		<select name="protocol">	
			<option value="http">http</option>
			<option value="ftp" selected="selected">ftp</option>
			<option value="smtp">smtp</option>
			<option value="pop">pop</option>
		</select></br>
		
		<input type="submit" value="send">
		<input type="reset" value="reset">
	</form>
</body>
</html>