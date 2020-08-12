<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#loginBtn").click(function(){
			location.href='/login';
		})
	})
</script>
<body>
	<div>
		<div>
			<div>
				<h3>아이디 찾기 검색결과</h3>
			</div>
			<div>
			
				<div>${ memberVo.mId }</div>
			
				<p>
					<button type="button" id=loginBtn>Login</button>
					<button type="button" onclick="history.go(-1);">Cancel</button>
				</p>
			</div>
		</div>
	</div>
</body>
</html>