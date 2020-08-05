<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
</head>
<body>
	<p>공지사항 
	<div> 
	
	</div>
	
	<div>
	<table>
	
	<tr> 
	  <td>작성자</td> 
	  <td>제목</td> 
	  <td>조회수</td>  
	  <td>작성일</td> 
	</tr>
	
	<c:forEach var = "boardVo" items = "${ boardList }">
	<tr>
		<td>${ boardVo.mId }</td>
		<td>${ boardVo.bName }</td>
		<td>${ boardVo.bCnt }</td>
		<td>${ boardVo.bDate }</td>
	</tr>
	</c:forEach>
	
	</table>
	</div>
	
	
	<p>FAQ
	<div>
	go
	</div>
</body>
</html>