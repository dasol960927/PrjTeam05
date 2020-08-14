<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>FlimCritics | Posters</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
  <!-- Ekko Lightbox -->
  <link rel="stylesheet" href="/plugins/ekko-lightbox/ekko-lightbox.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic&display=swap" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
//포스터  
function poster(string) {
	var str = string.split('|');
	
	return str;
}

//날짜
function movieDate(string) {
	var str = string.replace(/-/g,"");
	
	return str;
}

//제목
function title(string) {
	var str = string.split('^');
	
	return str;
}

var v1 = '';
function getBoxOffice(date, divId) {
	function kmdbApi(movieNm,openDt) {
		var kDate = movieDate(openDt);
		var KMDbUrl = 'http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=14RGX39B77HG1YYJ5L70'
				+'&releaseDts=' + kDate + '&title='+ movieNm;
		var pos = '';
		$.ajax({
			url : KMDbUrl,
			type : 'get',
			dataType : "json",
			async: false, //값을 리턴시 해당코드를 추가하여 동기로 변경
			success : function(data) {
				//console.log(data);
				var TotalCount = data.Data[0].Count;
				if(TotalCount == 0){
					v1 = '<img src="/img/PosterReady.jpg" alt="포스터 준비중"/>';
				}else{
					if(TotalCount > 0){
						for(var i=0;i<TotalCount;i++){
							if(kDate == data.Data[0].Result[i].repRlsDate){
								pos = poster(data.Data[0].Result[i].posters);
								v1 = '<a href="#"><img src="' + pos[0] + '"/></a>';
							}else{
								pos = '';
							}
						}
					}else{
						pos = poster(data.Data[0].Result[0].posters);
						v1 = '<a href="#"><img src="' + pos[0] + '"/></a>';
					}
				}
			},
			error    : function(xhr) {
				alert(xhr.status + '' + xhr.textStatus);
		  	}
		});
		return v1;
	}
	
	$(function(){	
		var BoxOfficeUrl = 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=b277ae665edf3d36d582a0b696287edc'+
		   '&targetDt='+ date;
		
		$.ajax({
			url : BoxOfficeUrl,
			type : 'get',
			dataType : "json",
			  success : function(data) {
				  var list = data.boxOfficeResult.dailyBoxOfficeList;
				  //console.log(list);
				  var html = '';
				  $.each(list, function(index, item) {
					    html += '<div class="col-sm-2">';
						html += kmdbApi(item.movieNm,item.openDt);
		               	html += '<p>제목 : ' + item.movieNm + '</p>';
		                html += '</div>';
				  });
				  $('#div0').html(html);
			  },
			  error    : function(xhr) {
				  alert(xhr.status + '' + xhr.textStatus);
			  }
		  });
	});	
}

//배우
function getActor(actorVal, divId) {
	$(function(){
		var url = 'http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=14RGX39B77HG1YYJ5L70&' + 
		     	  'actor=' + actorVal + '&listCount=10&sort=prodYear,1';
		$.ajax({
			url : url,
			type : 'get',
			dataType : "json",
			success : function(data) {
				//console.log(data);
				
				var js = data.Data[0].Result;
				var html = '';
				$.each(js, function(index, item) {				
					var posterVal = '';
					var pos = poster(item.posters); //포스터 문자열 자르기
					if(pos == ''){
						posterVal = '<img src="/img/PosterReady.jpg" alt="포스터 준비중"/>';
					}else{
						posterVal = '<a href="/filmReview?docId=' + item.DOCID + 
								'&filmId=' + item.movieId + 
								'&filmSeq=' + item.movieSeq + 
								'&filmYear=' + item.prodYear + '"><img src="' + pos[0] + '"/></a>';
					}
					
					html += '<span class="col-sm-2">';
					html += posterVal + '<br>';
		            html += '<p>' + item.title + '</p>';
		            html += '</span>';
				});
				$('#'+divId).html(html);
			},
			error : function(xhr) {
				alert(xhr.status + '' + xhr.textStatus);
		  	}
		});
	});
}

//감독
function getDirector(directorVal, divId) {
	$(function(){
		var url = 'http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=14RGX39B77HG1YYJ5L70&' + 
		     	  'director=' + directorVal + '&listCount=10&sort=prodYear,1';
		$.ajax({
			url : url,
			type : 'get',
			dataType : "json",
			success : function(data) {
				//console.log(data);
				
				var js = data.Data[0].Result;

				var html = '';
				$.each(js, function(index, item) {				
					var posterVal = '';
					var pos = poster(item.posters); //포스터 문자열 자르기
					if(pos == ''){
						posterVal = '<img src="/img/PosterReady.jpg" alt="포스터 준비중"/>';
					}else{
						posterVal = '<a href="/filmReview"><img src="' + pos[0] + '"/></a>';
					}
					
					html += '<div class="col-sm-2">';
					html += posterVal + '<br>';
		            html += '<p>' + item.title + '</p>';
		            html += '</div>';
				});
				$('#'+divId).html(html);
			},
			error : function(xhr) {
				alert(xhr.status + '' + xhr.textStatus);
		  	}
		});
	});
}

//장르
function getGenre(genreVal, divId) {
	$(function(){
		var url = 'http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=14RGX39B77HG1YYJ5L70&' + 
		     	  'genre=' + genreVal + '&listCount=10&sort=prodYear,1&createDts=2019';
		$.ajax({
			url : url,
			type : 'get',
			dataType : "json",
			success : function(data) {
				//console.log(data);
				
				var js = data.Data[0].Result;

				var html = '';
				$.each(js, function(index, item) {				
					var posterVal = '';
					var pos = poster(item.posters); //포스터 문자열 자르기
					if(pos == ''){
						posterVal = '<img src="/img/PosterReady.jpg" alt="포스터 준비중"/>';
					}else{
						posterVal = '<a href="#"><img src="' + pos[0] + '"/></a>';
					}
					
					html += '<div class="col-sm-2">';
					html += posterVal + '<br>';
		            html += '<p>' + item.title + '</p>';
		            html += '</div>';
				});
				
				$('#'+ divId).html(html);
			},
			error : function(xhr) {
				alert(xhr.status + '' + xhr.textStatus);
		  	}
		});
	});
}

var today = new Date();
var dd = today.getDate()-1;
var mm = today.getMonth()+1; //January is 0!
var yyyy = today.getFullYear();

if(dd<10) {
    dd='0'+dd
} 

if(mm<10) {
    mm='0'+mm
} 

today = yyyy+mm+dd;

//console.log(today);
getBoxOffice(today, 'div0');
getActor('박정민', 'div1');
getActor('손예진', 'div2');
getDirector('봉준호','div3');
getDirector('박찬욱','div4');
getGenre('액션','div5')
getGenre('어드벤처','div6');

</script>

<style>
	.category{width:100%; clear:both;}
	.col-sm-2{width:215px; padding:0px; margin:0px; float:left;}
	h3{font-family: 'Black Han Sans', sans-serif;
		font-family: 'Nanum Gothic', sans-serif;}
</style>

</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">


    <!-- SEARCH FORM -->
    <form class="form-inline ml-3" method="POST" action="/FilmSearch">
      <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" type="search" placeholder="영화작품 제목을 검색해보세요."  size="50" aria-label="Search" id="keyword" name="keyword">
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
            <h1>FlimCritics</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/">Home</a></li>
              <li class="breadcrumb-item"><a href="/test?mId=${login.mId }">${login.mName }님</a></li>
              <li class="breadcrumb-item active"><a href="/logout">LogOut</a></li>
              <li class="breadcrumb-item active"><a href="/Board?gubun=N">고객센터</a></li>
              <li class="breadcrumb-item active"><a href="/reqBoardWriter?mId=${login.mId }">1:1 문의</a></li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card card-primary">
              <div class="card-header">
                <div class="card-title">
                  	 이 영화에 대한 평가가 궁금하신가요?
                </div>
              </div>
              <div class="card-body">
                <div>
                  <div class="row">
                  
               <div class="category">
				    <h3>현재 상영하는 영화</h3>
					<div id=div0></div>
			   </div>
				
				<div class="category">
					<h3>믿고 보는<b>박정민</b>배우</h3>
					<div id=div1></div>
				</div>
				
				<div class="category">
					<h3>믿고 보는 <b>손예진</b>배우</h3>
					<div id=div2></div>
				</div>
				
				<div class="category">
				<h3>Made by<b>봉준호</b>감독</h3>
				<div id=div3></div>
				</div>
				
				<div class="category">
				<h3>Made by<b>박찬욱</b>감독</h3>
				<div id=div4></div>
				</div>
				
				<div class="category">
				<h3>속이 뻥 뚫리는 <b>액션</b>영화</h3>
				<div id=div5></div>
				</div>
				
				<div class="category">
				<h3>같이 모험을 떠나봐요~ <b>어드벤처</b></h3>
				<div id=div6></div>
				</div>
			  
				
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div><!-- /.container-fluid -->
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
		<div>주식회사 TeamFive | 대표  송지현| 팀원 김상두 이재혁 박다솔 김주희 | 부산광역시 남구 용당동 부경대용당캠퍼스 공학 6관 | <br/>
		사업자등록번호 8282-2424 | 통신판매업 신고번호 제 2020-부산용당-2020호  <br/>
		대표번호 051-629-5233 <br/>
		 개인정보 처리 방침</div>
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
<!-- Bootstrap -->
<script src="/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- jQuery UI -->
<script src="/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- AdminLTE App -->
<script src="/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/dist/js/demo.js"></script>
<!-- Page specific script -->
</body>
</html>
