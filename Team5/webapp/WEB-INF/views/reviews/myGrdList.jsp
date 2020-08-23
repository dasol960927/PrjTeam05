<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>FlimCritics | DepositTable</title>
  <%@ include file="/WEB-INF/include/admin.jsp" %>
<style>
table, th, td {
	border:1px solid black;
	border-collapse: collapse;	
}

table { width:800px; margin:0 auto; }

</style>  
 
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
 
  <%@ include file="/WEB-INF/include/ProfileCommon.jsp" %>
      	<div>		
              <div class="card-body">
              	<h1>${login.mName }님의 한줄평내역</h1>
                <table id="example2" class="table table-bordered table-hover">
                  <thead>
                  <tr>
                    <th>영화제목</th>
                    <th>평점</th>
                    <th>한줄평</th>
                    <th>작성일</th>
                    <th></th>
                  </tr>
                  </thead>
                  <tbody>
					<c:forEach var="revVo" items="${grdList}">
						<tr>
							<td>
							<div id ="${revVo.docId}"></div>
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
												
												$('#'+string).html(html);
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
							<td>
							  <input type="button" value="수정하기" class="btn btn-blcok btn-info btn-lg" 
							onclick="window.open('/REVIEW/updateGrdForm?mId=${login.mId}&revIdx=${revVo.revIdx}', '팝업창이름', 'width=500, height=500','location=no', 'resizable=no')">							
							  <input type="button" value="삭제하기" class="btn btn-blcok btn-info btn-lg" 
							onclick="window.open('/REVIEW/insertGrdForm?mId=${login.mId}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}', '팝업창이름', 'width=500, height=500','location=no', 'resizable=no')">							
							</td>				
						</tr>
					</c:forEach>
                  </tbody>
                  <tfoot>
                  <tr>
                    <th colspan="5" style="text-align:right;"><a href="/test?mId=${memberVo.mId}">돌아가기</a></th>
                  </tr>
                  </tfoot>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->

  <!-- /.content-wrapper -->
  <%@ include file="/WEB-INF/include/footer.jsp" %>
  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
</body>
</html>
