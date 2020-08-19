<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>이미지 슬라이드</title>
</head>
<body>
   <%@ include file="/WEB-INF/include/ReviewTest.jsp" %>
	<h1>이미지슬라이드 시작</h1>
	 <div class="gallery">
	 	<ul class="clearfix">
	 		<span id="divTest"></span>	
	 	</ul>
	 </div>
	 
	 <div class="g_item">
	 	<ul>
	 		<li class="on"></li>
	 		<li></li>
	 		<li></li>
	 		<li></li>
	 		<li></li>
	 	</ul>
	 </div>
</body>
</html>