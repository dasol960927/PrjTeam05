<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<form action="/loginCheck" method="POST">
		<div><input type="text"     name="mId"   placeholder="아이디"/></div>
		<div><input type="password" name="mPass" placeholder="암호"/></div>
		<input type="submit" value="로그인"/>
	</form>
</body>
</html>