<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>FlimCritics | FilmSearch</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
//Main에서 값 받아오기
var keywordGet = '<%= (String)request.getParameter("keyword")%>'
//alert(keywordGet);

//null 체크
function nullCheck(string) {
	var checkValue;
	if(string == ""){
		checkValue = '추가예정';
	}else{
		checkValue = string;
	}
	return checkValue;
}

//포스터, 스틸컷 url
function poster(string) {
	var str = string.split('|');
	
	return str;
}

//제목 자르기
function title(string) {
	var str = string.split('^');
	
	return str;
}

$(function(){
	var url = 'http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=14RGX39B77HG1YYJ5L70&title='+ keywordGet;
	var v1 = '';
	$.ajax({
		url : url,
		type : 'get',
		dataType : "json",
		async: false,
		data : {title : keywordGet},
		success : function(data) {
			//console.log(data);
			var json = data.Data[0];
			//console.log(json);

			var list;
			var exit= false;
			var html = '';
			
				$.each(json, function(index, item) {
					list = json.Result;
					console.log(json.Result);
										
					$.each(list, function(index, item) {
						var tit = title(item.titleEtc); //제목 문자열 자르기

						//포스터
						var posterVal = '';
						var pos = poster(item.posters); //포스터 문자열 자르기
						if(pos == ''){
							posterVal = '<img src="/img/PosterReady.jpg" alt="포스터 준비중"/>';
						}else{
							posterVal = '<a href="/filmReview?docId=' + item.DOCID + 
							'&filmId=' + item.movieId + 
							'&filmSeq=' + item.movieSeq + 
							'&filmYear=' + item.prodYear + '"><img src="' + pos[0] + '" alt="포스터"/></a>';
						}
						
						//배우
						if(item.actors.actor[4] == null){
							var actorVal = '추가예정';
						}else{
							actorVal  = nullCheck(item.actors.actor[0].actorNm) + ', ';
							actorVal += nullCheck(item.actors.actor[1].actorNm) + ', ';
							actorVal += nullCheck(item.actors.actor[2].actorNm) + ', ';
							actorVal += nullCheck(item.actors.actor[3].actorNm) + ', ';
							actorVal += nullCheck(item.actors.actor[4].actorNm)
			            }
						
						html+=            '<div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">';
						html+=              '<div class="card bg-light">';
						html+=                '<div class="card-header text-muted border-bottom-0">';
						html+=                  '<b>'+ item.genre +'</b>';
						html+=                '</div>';
						html+=                 '<div class="card-body pt-0">';
						html+=                   '<div class="row">';
						html+=                     '<div class="col-7">';
						html+=                       '<h2 class="lead">'+ tit[1] +'</h2>';
						html+=                       '<p class="text-muted text-sm"><b>감독: </b>' + item.directors.director[0].directorNm + '</p>';
						html+=                       '<p class="text-muted text-sm"><b>배우: </b>' + actorVal + '</p>';
						html+=                     '</div>';
						html+=                      '<div class="img-fluid">' + posterVal+'</div>';
						html+=                   '</div>';
						html+=                 '</div>';
						html+=                 '<div class="card-footer">';
						html+=                   '<div class="text-right">';
						html+=                     '<a href="/Likelist" class="btn btn-sm bg-teal">';
						html+=                       '<i class="fas fa-heart"></i>';
						html+=                     '</a>';
						html+=                     '<a href="/filmReview?docId=' + item.DOCID + '&filmId=' + item.movieId + '&filmSeq=' + item.movieSeq + '&filmYear=' + item.prodYear + '" class="btn btn-sm btn-primary">';
						html+=                       '<i class="fas fa-eye"></i> 영화 리뷰';
						html+=                     '</a>';
						html+=                   '</div>';
						html+=                 '</div>';
						html+=               '</div>';
						html+=             '</div>';
			                
			            exit = true; //이중 ajax 빠져나오기  주희
					  });
					  if(exit){ return false;} //이중 ajax 빠져나오기
				});
			$('#film').html(html);
		},
		error : function(xhr) {
			alert(xhr.status + '' + xhr.textStatus);
	  	}
	});
});
</script>

</head>
<body class="hold-transition sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">

    <!-- SEARCH FORM -->
    <form class="form-inline ml-3" method="POST" action="/FilmSearch">
      <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" type="search" placeholder="영화명을 검색하세요" aria-label="Search" id="keyword" name="keyword">
        <div class="input-group-append">
          <button class="btn btn-navbar" type="submit">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

  
  <!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>영화 검색 결과</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="/">Home</a></li>
								<li class="breadcrumb-item active">영화 검색</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Default box -->

			<div class="card card-solid">
				<div class="card-body pb-0">
					<div class="row d-flex align-items-stretch" id="film">
					
					</div>
				</div>
				<!-- /.card-body -->
				<div class="card-footer">
					<nav aria-label="Contacts Page Navigation">
						<ul class="pagination justify-content-center m-0">
							<li class="page-item active"><a class="page-link" href="#">1</a></li>
						</ul>
					</nav>
				</div>
				<!-- /.card-footer -->
			</div>
			<!-- /.card -->
		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->

		<footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 1.0.0
    </div>
	<div id="footer">
		<div>고객센터(이용 및 결제 문의) cs@teamfive.co.kr • 051-629-5232 (유료) <br/>
		 제휴	및 대외 협력 contact@teamfive.com • 051-629-5232 (유료)</div>
		<div>주식회사 TeamFive | 대표  송지현 | 팀원 김상두 이재혁 박다솔 김주희 | 부산광역시 남구 용당동 부경대용당캠퍼스 공학 6관 | <br/>
		사업자등록번호 8282-2424 | 통신판매업 신고번호 제 2020-부산용당-2020호  <br/>
		대표번호 051-629-5233 <br/>
		 개인정보 처리 방침11</div>
	</div>
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/dist/js/demo.js"></script>
</body>
</html>
