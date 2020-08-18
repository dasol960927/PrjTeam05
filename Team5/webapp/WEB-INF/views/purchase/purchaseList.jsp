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
 
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">

            <!-- Profile Image -->
            <div class="card card-primary card-outline">
              <div class="card-body box-profile">
              <a href="/">Home</a>
                <div class="text-center">
                  <img class="profile-user-img img-fluid img-circle"
                       src="/img/User.jpg"
                       alt="User profile picture">
                </div>
				
                <h3 class="profile-username text-center">${ memberVo.mName }&nbsp;&nbsp;&nbsp;님</h3>

                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                  	<br/>
                    <b>찜한 영화</b> <p class="float-right" >&nbsp;&nbsp;&nbsp;편</p><a class="float-right" href="#">${memberVo.cntl}</a> 
                  </li>
                  <li class="list-group-item">
                  	<br/>
                    <b>잔여캐시</b> <p class="float-right" >&nbsp;&nbsp;&nbsp;원</p><a class="float-right" >${memberVo.mCash}</a> 
                  </li>
                  <li class="list-group-item">
                  	<br/>
                    <b>구매내역</b> <p class="float-right" >&nbsp;&nbsp;&nbsp;건</p><a class="float-right" href="/PUR/List?mId=${memberVo.mId}">${memberVo.cntp}</a>
                  </li>
                  <li class="list-group-item">
                  	<br/>
                    <b>충전내역</b> <a class="float-right" href="/DPS/Deposit1?mId=${memberVo.mId}">충전하기</a> <p class="float-right">&nbsp;&nbsp;건&nbsp;&nbsp;</p> <a class="float-right" href="/DPS/List?mId=${memberVo.mId}">${memberVo.cntd}</a>  
                  </li>
                </ul>
				<br/>
                <a href="/updateForm?mId=${ memberVo.mId }" class="btn btn-primary btn-block"><b>회원정보 수정</b></a>
                <br/>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <!-- About Me Box -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">About Me</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <strong><i class="fas fa-user mr-1"></i>닉네임</strong>
                <p class="text-muted">
                  ${memberVo.mNickName}
                </p>
                <hr>
                <strong><i class="fas fa-user mr-1"></i> 성별</strong>
                <p class="text-muted">${memberVo.mGender}</p>
                <hr>
                <strong><i class="fas fa-user mr-1"></i> 생년월일</strong>
                <p class="text-muted">
                  <span class="tag tag-info">${memberVo.mBdate}</span>
                </p>
                <hr>
                <strong><i class="fas fg-lg fa-phone mr-1"></i> 전화번호</strong>

                <p class="text-muted">${memberVo.mPhone}</p>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
      	<div>		
              <div class="card-body">
              	<h1>${memberVo.mName }님의 구매내역</h1>
                <table id="example2" class="table table-bordered table-hover">
                  <thead>
                  <tr>
                    <th>구매일자</th>
                    <th>영화제목</th>
                    <th>금액</th>
                  </tr>
                  </thead>
                  <tbody>
					<c:forEach var="purVo" items="${purList}">
						<tr>				
							<td>${ purVo.pDate }</td>
							<td>
							<div id ="${purVo.docId}"></div>
                              <script>
								var str = '${purVo.docId}';
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
							<td>${ purVo.comVal }</td>			
						</tr>
					</c:forEach>
                  </tbody>
                  <tfoot>
                  <tr>
                    <th colspan="3" style="text-align:right;"><a href="/test?mId=${memberVo.mId}">돌아가기</a></th>
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
