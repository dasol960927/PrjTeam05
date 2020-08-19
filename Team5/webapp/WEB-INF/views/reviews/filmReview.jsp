<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>FilmCritics | FilmReview</title>
<<<<<<< HEAD
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Font Awesome -->
<link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet" href="/dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
.starR1 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat -52px 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR2 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR1.on {
	background-position: 0 0;
}

.starR2.on {
	background-position: -15px 0;
}
</style>
<script>
var movieId = '<%= (String)request.getParameter("filmId")%>'
var movieSeq = '<%= (String)request.getParameter("filmSeq")%>'
//alert(movieId);
//alert(movieSeq);

//console.log(movieId);
//console.log(movieSeq);

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
	var url = 'http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=14RGX39B77HG1YYJ5L70&'+
			'&movieId=' + movieId + 
			'&movieSeq=' + movieSeq;
	var v1 = '';
	$.ajax({
		url : url,
		type : 'get',
		dataType : "json",
		success : function(data) {
			//console.log(data);
			var json = data.Data[0];
			//console.log(json);

			var list;
			var exit= false;
			var html  = '';
			var html2 = '';
			var html3 = '';
				$.each(json, function(index, item) {
					list = json.Result;
					console.log(json.Result);
										
					$.each(list, function(index, item) {
						var tit = title(item.titleEtc); //제목 문자열 자르기
						
						//스틸컷
						var stllsVal = '';
						var stl = poster(item.stlls); //스틸컷 문자열 자르기
						if(stl == ""){
							stllsVal += '<img src="/img/ready.jpg" alt="스틸컷 준비중"/>';
						}else{
							for(var i=0; i<3; i++) {
								stllsVal +='<img src="'+stl[i]+'"/>';
							}
						}

						
						//포스터
						var posterVal = '';
						var pos = poster(item.posters); //포스터 문자열 자르기
						if(pos == ''){
							posterVal = '<img src="/img/PosterReady.jpg" class="product-image" alt="포스터 준비중"/>';
						}else{
							posterVal = '<img src="' + pos[0] + '" class="product-image" alt="포스터"/>';
						}
						
						//배우
						if(item.actors.actor[4] == null){
							var actorVal = '추가예정';
						}else{
							actorVal  = nullCheck(item.actors.actor[0].actorNm) + ', ';
							actorVal += nullCheck(item.actors.actor[1].actorNm) + ', ';
							actorVal += nullCheck(item.actors.actor[2].actorNm) + ', ';
							actorVal += nullCheck(item.actors.actor[3].actorNm) + ', ';
							actorVal += nullCheck(item.actors.actor[4].actorNm);
			            }
						


						html+=              '<h3 class="d-inline-block d-sm-none">Films Review</h3>'
						html+=              '<div class="col-12">';
						html+=                posterVal;
						html+=              '</div>';
						html+=              '<div class="col-12 product-image-thumbs">';
						html+=                '<div class="product-image-thumb">'+ '<img src="'+stl[0]+'"/>' + '</div>';
						html+=                '<div class="product-image-thumb">'+ '<img src="'+stl[1]+'"/>' + '</div>';
						html+=                '<div class="product-image-thumb">'+ '<img src="'+stl[2]+'"/>' + '</div>';
						html+=              '</div>';

						html2+=              '<h3 class="my-3">' + tit[0] + '</h3>';
			            html2+= 			 '<p>배우:' + actorVal + '<br/> 감독 :' + item.directors.director[0].directorNm + '<br/> 개봉일: ' + item.repRlsDate + '</p>';
			            html2+=				 '<hr>';
			                
			            html3 += nullCheck(item.plots.plot[0].plotText);
			            exit = true; //이중 ajax 빠져나오기
					  });
					  if(exit){ return false;} //이중 ajax 빠져나오기
				});
			$('#here').html(html);
			$('#here2').html(html2);
			$('#here3').html(html3);
			
		},
		error : function(xhr) {
			alert(xhr.status + '' + xhr.textStatus);
	  	}
	});
	
	$("#divBtnLike").on("click", function(){
		var loginMid = '${login.mId}';
		var docId = '${fVo.docId}';
		$.ajax({
			url : '/Like',
			data : {mId : loginMid, docId : docId },
			dataType : 'json',
			type : 'get',
			success : function(data){
				if(data.likeChk == 'N'){
					$("#btnLike").css("color","black");
					alert("찜 취소됐쪙 ~~ ><");
				}else{
					$("#btnLike").css("color", "red");
					alert("찜 됐쪙~! ><");
				}
			},
			error : function(xhr){
				alert("error: " + xhr.status + "," + xhr.textStatus);
			}
		})
	});
	

});

</script>
<style>
.starRev{width:170px; height:50px;}
</style>

<%@ include file="/WEB-INF/include/admin.jsp" %>
<%@ include file="/WEB-INF/include/ReviewCommon.jsp" %>

</head>

<body class="hold-transition sidebar-mini">
<!-- Site wrapper -->
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
            <h1>영화 감상</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/">Home</a></li>
              <li class="breadcrumb-item active">Film Review </li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card card-solid">
        <div class="card-body">
          <div class="row" >
			<div class="col-12 col-sm-6" id="here">
            
           
            </div>
            <div class="col-12 col-sm-6">
            <span id="here2">
    
             </span>
				<!-- DONUT CHART -->
	            <div class="card card-danger">
	              <div class="card-header">
	                <h3 class="card-title">연령별 리뷰수</h3>
	
	                <div class="card-tools">
	                  <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
	                </div>
	              </div>
	              <div class="card-body">
	                <canvas id="donutChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
	              </div>
	              <!-- /.card-body -->
	            </div>
	            <!-- /.card -->

              <h4 class="mt-3">영화 <small>별점</small></h4>
			  <div class="starRev">
				  <span class="starR1 on">별1</span>
				  <span class="starR2">별2</span>
				  <span class="starR1">별3</span>
				  <span class="starR2">별4</span>
				  <span class="starR1">별5</span>
				  <span class="starR2">별6</span>
				  <span class="starR1">별7</span>
				  <span class="starR2">별8</span>
				  <span class="starR1">별9</span>
				  <span class="starR2">별10</span>
				</div>

				<br>
				<br>

				<div class="bg-gray">
					<h2 class="mb-0">영화가격 : ${fVo.filmPrice }P</h2>
					<br>
					<h4 class="mt-0">잔여 캐시 : ${ login.mCash }P</h4>
				</div>

              <div class="mt-4">
              
             <div id="btns" style="width:700px; height: 80px; clear:both;">
             
             <c:choose>
              <c:when test="${likeChk eq 'Y'}">
                <div class="btn btn-default btn-lg btn-flat" id = "divBtnLike" style="float:left; margin-left:5px; height: 48px;">
                  <i class="fas fa-heart fa-lg mr-2" id = "btnLike" style="color:red"></i>찜하기 
                  <%-- <a href="/Like?mId=${ login.mId }&docId=${fVo.docId }"></a> --%>
               </div>
              </c:when>
              <c:otherwise>
                <div class="btn btn-default btn-lg btn-flat" id = "divBtnLike" style="float:left; margin-left:5px; height: 48px;">
                  <i class="fas fa-heart fa-lg mr-2" id = "btnLike"></i>찜하기
                  <%-- <a href="/Like?mId=${ login.mId }&docId=${docId }">찜하기</a> --%>
               </div>
              </c:otherwise>
             </c:choose>
                
                <div class="btn btn-primary btn-lg btn-flat" style="float:left; margin-left:5px;">
                  <i class="fas fa-cart-plus fa-lg mr-2"></i> 
                    	<a href="/DPS/List?mId=${login.mId }" style="color:white;">포인트 충전</a>
                </div>
                <div class="btn btn-primary btn-lg btn-flat" style="float:left; margin-left:5px;">
                  <i class="far fa-credit-card"></i> 

                    	<a href="/PUR/purFilm?mId=${login.mId }&docId=${fVo.docId}&filmPrice=${fVo.filmPrice}" style="color:white;">구매하기</a>
                </div>
				
			 </div>

                </div>                           
				</div>



              <div class="mt-4 product-share">
                <a href="#" class="text-gray">
                  <i class="fab fa-facebook-square fa-2x"></i>
                </a>
                <a href="#" class="text-gray">
                  <i class="fab fa-twitter-square fa-2x"></i>
                </a>
                <a href="#" class="text-gray">
                  <i class="fas fa-envelope-square fa-2x"></i>
                </a>
                <a href="#" class="text-gray">
                  <i class="fas fa-rss-square fa-2x"></i>
                </a>
              </div>

            </div>

          <div class="row mt-4">
            <nav class="w-100">
              <div class="nav nav-tabs" id="product-tab" role="tablist">
                <a class="nav-item nav-link" id="product-desc-tab"  href="/filmReview?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmSeq}" style="background-color:#878787; color:#ECFFFF">영화설명</a>
                <a class="nav-item nav-link" id="product-comments-tab"  href="/REVIEW/grdList?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}">리뷰</a>
                <a class="nav-item nav-link" id="product-rating-tab"  href="/REVIEW/revList?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}">평점</a>
              </div>
            </nav>
            <div class="tab-content p-3" id="nav-tabContent" >

				 <div class="tab-pane fade show active" id="product-desc" role="tabpanel" aria-labelledby="product-desc-tab"><span id="here3"></span></div>
            </div>
          </div>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


<div id = ttest style="clear:both;">
	<%@ include file="/WEB-INF/include/ReviewTest.jsp" %>
	<div id = divTest style="width:220px; height:330px;"></div>
</div>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<<<<<<< HEAD
<!-- jQuery -->
<script src="/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="/plugins/chart.js/Chart.min.js"></script>
<!-- AdminLTE App -->
<script src="/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/dist/js/demo.js"></script>
 <script>
 $('.starRev span').click(function(){
  $(this).parent().children('span').removeClass('on');
  $(this).addClass('on').prevAll('span').addClass('on');
  return false;
});
 </script>
<script>
  $(function () {
	  
	  var docIdVal = '${docId}';
	  
	  $.ajax({
			url : '/Chart/Gender',
			type: 'GET',
			data: {'docId' : docIdVal},
			datatype: 'json',
			success : function(datas) {
					$.each(datas, function(index, item){
						//alert(item.mGender + "," + item.cntGrdScore);
						
					});
			}, 
				error : function(xhr) {
					//alert('차트데이터'+ xhr.status + '' + xhr.textStatus);
				}
			});
	  
    /* ChartJS
     * -------
     * Here we will create a few charts using ChartJS
     */
=======
<%@ include file="/WEB-INF/include/footer.jsp" %>
<%@ include file="/WEB-INF/include/doughnutChart.jsp" %>
>>>>>>> branch 'master' of https://github.com/dasol960927/PrjTeam05





</body>
</html>