<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, th, td {
	border:1px solid black;
	border-collapse: collapse;	
}

table { width:800px; margin:0 auto; }

#contsTd {
	overflow:hidden; 
	white-space:nowrap;
	text-overflow:ellipsis;
}

#example2 {
	table-layout:fixed;
}

</style>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>


<script>

	
	function okClick(){
		//opener.document.location.href='/filmReview1';
		opener.document.location.reload();
		window.close();
	}

</script>
</head>


<body class="hold-transition sidebar-mini">
<div class="wrapper">
  
      	<div>		
              <div class="card-body">
              	<h1>${mId}님의 한줄평/리뷰 내역</h1>
                <table id="example2" class="table table-bordered table-hover">
                  <thead>
                  <tr>
                    <th>영화제목</th>
                    <th>평점(한줄평)/제목(리뷰)</th>
                    <th>감상평</th>
                    <th>작성일</th>                    
                  </tr>
                  </thead>
                  <tbody>                   
					<c:forEach var="revVo" items="${grdList}">
                  <c:choose>
                  <c:when test="${ revVo.revGubun eq 'S'.charAt(0)}">					
						<tr>
							<td>
							<div class ="${revVo.docId}"></div>
                              <script>
								var str = '${revVo.docId}';
								//console.log('str' + str);
								film(str);

								//제목 자르기
								function title(string) {
									var str = string.split('^');
									return str;
								}
								
								function film(string) {
									var FilmId = "" + string; //강제로 string 형으로 바꾸기
									var FilmSeq = "" + string; 
									var sFilmId = FilmId.substr(0,1); //K22321 로 받아와서 첫번째 글자만 자르기
									var sFilmSeq = FilmSeq.substr(1,5);
										
									$(function(){
										var url = 'http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=14RGX39B77HG1YYJ5L70';
										$.ajax({
											url : url,
											type : 'get',
											dataType : "json",
											async: false,
											data : {movieId : sFilmId, movieSeq : sFilmSeq},
											success : function(data) {
												//console.log(data);
													
												var json = data.Data[0].Result[0];
												//console.log(json);
												var html = '';

												//제목 문자열 자르기
												var titleName = ""+data.Data[0].Result[0].titleEtc;
												var tit = title(titleName); 
														
												html += '<span>';
												html += '<p>' + tit[0] + '</p>';
												html += '</span>';
												
												$('.'+string).html(html);
											},
											error : function(xhr) {
												alert(xhr.status + '' + xhr.textStatus);
											}
										});
									});
								}
								</script>
							</td>
							<td><%@ include file="/WEB-INF/include/star.jsp" %></td>
							<td>${ revVo.grdConts }</td>
							<td>${ revVo.revDate }</td>			
						</tr>
						</c:when>
						</c:choose>
					</c:forEach>
					
					
					<c:forEach var="revVo" items="${revList}">
                  <c:choose>
                  <c:when test="${ revVo.revGubun eq 'L'.charAt(0)}">					
						<tr>
							<td>
							<div class ="${revVo.docId}"></div>
                              <script>
								var str = '${revVo.docId}';
								//console.log('str' + str);
								film(str);

								//제목 자르기
								function title(string) {
									var str = string.split('^');
									return str;
								}
								
								function film(string) {
									var FilmId = "" + string; //강제로 string 형으로 바꾸기
									var FilmSeq = "" + string; 
									var sFilmId = FilmId.substr(0,1); //K22321 로 받아와서 첫번째 글자만 자르기
									var sFilmSeq = FilmSeq.substr(1,5);
										
									$(function(){
										var url = 'http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=14RGX39B77HG1YYJ5L70';
										$.ajax({
											url : url,
											type : 'get',
											dataType : "json",
											async: false,
											data : {movieId : sFilmId, movieSeq : sFilmSeq},
											success : function(data) {
												//console.log(data);
													
												var json = data.Data[0].Result[0];
												//console.log(json);
												var html = '';

												//제목 문자열 자르기
												var titleName = ""+data.Data[0].Result[0].titleEtc;
												var tit = title(titleName); 
														
												html += '<span>';
												html += '<p>' + tit[0] + '</p>';
												html += '</span>';
												
												$('.'+string).html(html);
											},
											error : function(xhr) {
												alert(xhr.status + '' + xhr.textStatus);
											}
										});
									});
								}
								</script>
							</td>
							<td>${ revVo.revTitle }</td>
							<td id="contsTd">${ revVo.revConts }</td>
							<td>${ revVo.revDate }</td>							
						</tr>
						</c:when>
						</c:choose>
					</c:forEach>					
					
									
                  </tbody>
                  <tfoot>
                  <tr>
                    <th colspan="4" style="text-align:right;"><input type="button" value="확인" onclick="okClick()"></th>
                  </tr>
                  </tfoot>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
 </div>
  <!-- /.row -->


    

  

</body>
</html>