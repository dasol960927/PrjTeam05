<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>FlimCritics | Main</title>
 
  <%@ include file="/WEB-INF/include/admin.jsp" %>
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic&display=swap" rel="stylesheet">

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


function getBoxOffice(date, divId) {
	function kmdbApi(movieNm,openDt) {
		var v1 = '';
		var mId = $("#mId").val();
		var kDate = movieDate(openDt);
		var KMDbUrl = 'http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=14RGX39B77HG1YYJ5L70'
				+'&releaseDts=' + kDate + '&title='+ movieNm;
		
		$.ajax({
			url : KMDbUrl,
			type : 'get',
			dataType : "json",
			async: false, //값을 리턴시 해당코드를 추가하여 동기로 변경
			success : function(data) {
				//console.log(data);
				var TotalCount = data.Data[0].Count;
				v1 = '<img src="/img/PosterReady.jpg" alt="포스터 준비중"/>';
				if(TotalCount == 0){
					v1 = '<img src="/img/PosterReady.jpg" alt="포스터 준비중"/>';
				}else{
					if(TotalCount > 0){
						for(var i=0;i<TotalCount;i++){
							if(kDate == data.Data[0].Result[i].repRlsDate){
								pos = poster(data.Data[0].Result[i].posters);
								v1 = '<a href="/filmReview?docId=' + data.Data[0].Result[i].DOCID + 
								'&filmId=' + data.Data[0].Result[i].movieId + 
								'&filmSeq=' + data.Data[0].Result[i].movieSeq + 
								'&filmYear=' + data.Data[0].Result[i].prodYear + 
								'&genre='+ data.Data[0].Result[i].genre + 
								'&mId=' + mId + '"><img src="' + pos[0] + '"/></a>';
							}else{
								pos = '';
							}
						}
					}else{
						pos = poster(data.Data[0].Result[0].posters);
						v1 = '<a href="/filmReview?docId=' + data.Data[0].Result[i].DOCID + 
						'&filmId=' + data.Data[0].Result[i].movieId + 
						'&filmSeq=' + data.Data[0].Result[i].movieSeq + 
						'&filmYear=' + data.Data[0].Result[i].prodYear + 
						'&genre='+ data.Data[0].Result[i].genre +
						'&mId=' + mId + '"><img src="' + pos[0] + '"/></a>';
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
				  //console.log(data);
				  var list = data.boxOfficeResult.dailyBoxOfficeList;
				  //console.log(list);
				  var html = '';
				  $.each(list, function(index, item) {
					 	html += '<div class="col-sm-2">';
						html += kmdbApi(item.movieNm,item.openDt);
		               	html += '<p>' + item.movieNm + '</p>';
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
		var mId = $("#mId").val();
		
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
				//var mId = '${login.mId}';
				$.each(js, function(index, item) {				
					var posterVal = '';
					var pos = poster(item.posters); //포스터 문자열 자르기
					if(pos == ''){
						posterVal = '<img src="/img/PosterReady.jpg" alt="포스터 준비중"/>';
					}else{
						posterVal = '<a href="/filmReview?docId=' + item.DOCID + 
								'&filmId=' + item.movieId + 
								'&filmSeq=' + item.movieSeq + 
								'&filmYear=' + item.prodYear +
								'&genre=' + item.genre + 
								'&mId=' + mId + '"><img src="' + pos[0] + '"/></a>';
					}
					
					html += '<div class="col-sm-2">';
					html += posterVal + '<br>';
		            html += '<p>'+ item.title + '</p>';
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

//감독
function getDirector(directorVal, divId) {
	$(function(){
		var mId = $("#mId").val();
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
						posterVal = '<a href="/filmReview?docId=' + item.DOCID + 
						'&filmId=' + item.movieId + 
						'&filmSeq=' + item.movieSeq + 
						'&filmYear=' + item.prodYear + 
						'&genre=' + item.genre + 
						'&mId=' + mId + '"><img src="' + pos[0] + '"/></a>';
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
		var mId = $("#mId").val();
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
						posterVal = '<a href="/filmReview?docId=' + item.DOCID + 
						'&filmId=' + item.movieId + 
						'&filmSeq=' + item.movieSeq + 
						'&filmYear=' + item.prodYear + 
						'&genre=' + item.genre + 
						'&mId=' + mId + '"><img src="' + pos[0] + '"/></a>';
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

// 어제 날짜 구하기
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
getGenre('미스터리','div6');

</script>

<style>
	.category{width:1200px; height:100%; clear:both; }
	.col-sm-2{width:321px; height:350px;  padding:0px; margin:1px; float:left; }
	#div0, #div1, #div2, #div3, #div3, #div4, #div5, #div6 {width:1300px; height:800px;}
	h3{font-family: 'Black Han Sans', sans-serif;
		font-family: 'Nanum Gothic', sans-serif;}
</style>

</head>
<body class="hold-transition sidebar-mini">
<input type = "hidden" id = "mId" value = "${login.mId }"/>
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
                <div>
                	<p style="font-size:20px; font-weight:bold; color:#659D35;">
                      <MARQUEE bgColor="99ffcc">지금까지 <p style="color:#ff3300; display:inline;">★${revVo.oTot}개의 평가가</p> 쌓였습니다(한줄평 : ${revVo.oTotGrd}개 리뷰 : ${revVo.oTotRev}개) </MARQUEE>
                   </p>  
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
				<h3>올 여름을 시원하게 <b>미스터리</b></h3>
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
