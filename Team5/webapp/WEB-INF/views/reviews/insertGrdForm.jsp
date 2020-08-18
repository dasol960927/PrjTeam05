<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script language="javaScript">


	function submitClick(){
		var mId = $("#mId").val();
		var docId = $("#docId").val();
		var grdScore = $("#grdScore").val();
		grdScore *= 1;
		var grdConts = $("#grdConts").val();
		
		var filmId = $("#filmId").val();
		var filmSeq = $("#filmSeq").val();
		var filmYear = $("#filmYear").val();
						
		
		
		//opener.window.document.location.href="'/REVIEW/insertGrd?grdConts='+ grdConts '&grdScore='+grdScore'";
		opener.document.location.href='/REVIEW/insertGrd?mId=' + mId + '&docId=' + docId + '&grdScore=' + grdScore + '&grdConts='
					+ grdConts + '&filmId=' + filmId + '&filmSeq=' + filmSeq + '&filmYear=' + filmYear;
		window.close();
	}
	
	function cancelClick(){
		//opener.document.location.href='/filmReview1';
		opener.document.location.reload();
		window.close();
	}

</script>
</head>
<%
   String mId = request.getParameter("mId");
   String docId = request.getParameter("docId");
   String filmId = request.getParameter("filmId");
   String filmSeq = request.getParameter("filmSeq");
   String filmYear = request.getParameter("filmYear");
%>
<body>
	
		<h1>평점 작성해라</h1>
		<table>
			<tr>
				<td>평점</td>
				<input type="text" id="grdScore" name="grdScore" value=""/>
			</tr>
			<tr>
				<td>한줄평</td>
				<textarea id="grdConts" name="grdConts" cols="50" rows="2" placeholder="감상평을 남겨주세요.영화와 상관없는 내용은 약관에 의해 제재를 받을 수 있습니다"></textarea>
			</tr>
			
			<input type="hidden" id="mId" value="<%=mId%>"/>
			<input type="hidden" id="docId" value="<%=docId%>"/>
			<input type="hidden" id="filmId" value="<%=filmId%>"/>
			<input type="hidden" id="filmSeq" value="<%=filmSeq%>"/>
			<input type="hidden" id="filmYear" value="<%=filmYear%>"/>
						
			
						
		</table>		
		<input type="button" name="btnCancel" value="취소" onclick="cancelClick()" />
		<input type="button" name="btnSubmit" value="확인" onclick="submitClick()"/>
		
		
</body>
</html>