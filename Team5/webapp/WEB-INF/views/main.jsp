<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>FilmCritics | Main</title>
 
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

//장르
function genreText(string) {
   var str = string.split(',');
   
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
        	console.log('kmdb'); 
            console.log(data);
            
            var TotalCount = data.Data[0].Count;
            v1 = '<img src="/img/PosterReady.jpg" alt="포스터 준비중"/></a>';
            if(TotalCount == 0){
               for(var i=0;i<TotalCount;i++){
                  if(kDate == data.Data[0].Result[i].repRlsDate){
                     var gen = genreText(data.Data[0].Result[i].genre);
                     v1 = '<a href="/filmReview?docId=' + data.Data[0].Result[i].DOCID + 
                     '&filmId=' + data.Data[0].Result[i].movieId + 
                     '&filmSeq=' + data.Data[0].Result[i].movieSeq + 
                     '&filmYear=' + data.Data[0].Result[i].prodYear + 
                     '&genre='+ gen[0] + 
                     '&mId=' + mId + '"><img src="/img/PosterReady.jpg" alt="포스터 준비중"/></a>';
                  }
               }
            }else{
               if(TotalCount > 0){
                  for(var i=0;i<TotalCount;i++){
                     if(kDate == data.Data[0].Result[i].repRlsDate){
                        var gen = genreText(data.Data[0].Result[i].genre);
                        pos = poster(data.Data[0].Result[i].posters);
                        v1 = '<a href="/filmReview?docId=' + data.Data[0].Result[i].DOCID + 
                        '&filmId=' + data.Data[0].Result[i].movieId + 
                        '&filmSeq=' + data.Data[0].Result[i].movieSeq + 
                        '&filmYear=' + data.Data[0].Result[i].prodYear + 
                        '&genre='+ gen[0] + 
                        '&mId=' + mId + '"><img src="' + pos[0] + '"/></a>';
                     }else{
                        pos = '';
                     }
                  }
               }else{
                  pos = poster(data.Data[0].Result[0].posters);
                  var gen = genreText(data.Data[0].Result[i].genre);
                  v1 = '<a href="/filmReview?docId=' + data.Data[0].Result[i].DOCID + 
                  '&filmId=' + data.Data[0].Result[i].movieId + 
                  '&filmSeq=' + data.Data[0].Result[i].movieSeq + 
                  '&filmYear=' + data.Data[0].Result[i].prodYear + 
                  '&genre='+ gen[0] +
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
        	   console.log('kobis');
        	   console.log(data);
              var list = data.boxOfficeResult.dailyBoxOfficeList;
              //console.log(list);
              var html = '';
              $.each(list, function(index, item) {
                 //console.log(item.movieNm)
                  html += '<li><div class="img">';
                  html += kmdbApi(item.movieNm,item.openDt); + '<br>';
                     html += '<p>' + item.movieNm + '</p>';
                     html += '<li></div>';
              });
              $('#'+divId).html(html);
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
                  var gen = genreText(item.genre);
                  posterVal = '<a href="/filmReview?docId=' + item.DOCID + 
                  '&filmId=' + item.movieId + 
                  '&filmSeq=' + item.movieSeq + 
                  '&filmYear=' + item.prodYear +
                  '&genre=' + gen[0] + 
                  '&mId=' + mId + '"><img src="/img/PosterReady.jpg" alt="포스터 준비중"/></a>';
               }else{
                  var gen = genreText(item.genre);
                  posterVal = '<a href="/filmReview?docId=' + item.DOCID + 
                        '&filmId=' + item.movieId + 
                        '&filmSeq=' + item.movieSeq + 
                        '&filmYear=' + item.prodYear +
                        '&genre=' + gen[0] + 
                        '&mId=' + mId + '"><img src="' + pos[0] + '"/></a>';
               }
               
      
               html += '<li><div class="img">';
               html += posterVal + '<br>';
                  html += '<b>' + item.title + '</b>';
                  html += '<li></div>';
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
                  var gen = genreText(item.genre);
                  posterVal = '<a href="/filmReview?docId=' + item.DOCID + 
                     '&filmId=' + item.movieId + 
                     '&filmSeq=' + item.movieSeq + 
                     '&filmYear=' + item.prodYear +
                     '&genre=' + gen[0] + 
                     '&mId=' + mId + '"><img src="/img/PosterReady.jpg" alt="포스터 준비중"/></a>';
               }else{
                  var gen = genreText(item.genre);
                  posterVal = '<a href="/filmReview?docId=' + item.DOCID + 
                  '&filmId=' + item.movieId + 
                  '&filmSeq=' + item.movieSeq + 
                  '&filmYear=' + item.prodYear + 
                  '&genre=' + gen[0] + 
                  '&mId=' + mId + '"><img src="' + pos[0] + '"/></a>';
               }
               
               html += '<li><div class="img">';
               html += posterVal + '<br>';
                  html += '<b>' + item.title + '</b>';
                  html += '<li></div>';
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
                  var gen = genreText(item.genre);
                  posterVal = '<a href="/filmReview?docId=' + item.DOCID + 
                     '&filmId=' + item.movieId + 
                     '&filmSeq=' + item.movieSeq + 
                     '&filmYear=' + item.prodYear +
                     '&genre=' + gen[0] + 
                     '&mId=' + mId + '"><img src="/img/PosterReady.jpg" alt="포스터 준비중"/></a>';
               }else{
                  var gen = genreText(item.genre);
                  posterVal = '<a href="/filmReview?docId=' + item.DOCID + 
                  '&filmId=' + item.movieId + 
                  '&filmSeq=' + item.movieSeq + 
                  '&filmYear=' + item.prodYear + 
                  '&genre=' + gen[0] + 
                  '&mId=' + mId + '"><img src="' + pos[0] + '"/></a>';
               }
               html += '<li><div class="img">';
               html += posterVal + '<br>';
                  html += '<b>' + item.title + '</b>';
                  html += '<li></div>';
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
getBoxOffice(today, 'ul0');
getActor('박정민', 'ul1');
getActor('손예진', 'ul2');
getDirector('봉준호','ul3');
getDirector('박찬욱','ul4');
getGenre('액션','ul5')
getGenre('미스터리','ul6');

</script>

<style>
.category{width:100%; }
h3{font-family: 'Black Han Sans', sans-serif;
      font-family: 'Nanum Gothic', sans-serif;}

li{list-style:none;}
.clearfix { overflow: auto; }
.clearfix::after {content: ""; clear: both; display: table; }
.clear{clear: both;}    
.gallery{width: 900px; margin: 20px auto; border: 1px solid #ccc; overflow: hidden; padding-left:0; }
.gallery ul{width: 300%; position: relative; left: -300px; }
.gallery ul li {float: left; box-sizing: border-box; text-align: center;}


.g_item{width: 860px; margin: 0 auto; text-align: center;}
.g_item ul li{display: inline-block; margin-right: 10px; background: #ccc; width: 10px; height: 10px; border-radius: 50%;}
.g_item ul li.on{background: #f00;}
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
         <div class="col-sm-2">
         <h3>현재 상영하는 영화</h3>
               <div class="gallery">
                   <ul class="clearfix" id="ul0">
                   
                   </ul>
                     </div>
                <div class="g_item">
                   <ul>
                      <li class="on"></li>
                      <li></li>
                      <li></li>
                      <li></li>
                   </ul>
                 </div>
              </div>
         </div>
         
         <div class="category">    
         <div class="col-sm-2">
         <h3>믿고 보는<b>박정민</b>배우</h3>
               <div class="gallery">
                   <ul class="clearfix" id="ul1">
                   
                   </ul>
                     </div>
                <div class="g_item">
                   <ul>
                      <li class="on"></li>
                      <li></li>
                      <li></li>
                      <li></li>
                   </ul>
                 </div>
              </div>
         </div>
         
         <div class="category">    
         <div class="col-sm-2">
         <h3>믿고 보는<b>손예진</b>배우</h3>
               <div class="gallery">
                   <ul class="clearfix" id="ul2">
                   
                   </ul>
                     </div>
                <div class="g_item">
                   <ul>
                      <li class="on"></li>
                      <li></li>
                      <li></li>
                      <li></li>
                   </ul>
                 </div>
              </div>   
              </div>         
         
          <div class="category">    
         <div class="col-sm-2">
         <h3>Made by<b>봉준호</b>감독</h3>
               <div class="gallery">
                   <ul class="clearfix" id="ul3">
                   
                   </ul>
                     </div>
                <div class="g_item">
                   <ul>
                      <li class="on"></li>
                      <li></li>
                      <li></li>
                      <li></li>
                   </ul>
                 </div>
              </div>
              </div>
              
              
               <div class="category">    
             <div class="col-sm-2">
         <h3>Made by<b>박찬욱</b>감독</h3>
               <div class="gallery">
                   <ul class="clearfix" id="ul4">
                   
                   </ul>
                     </div>
                <div class="g_item">
                   <ul>
                      <li class="on"></li>
                      <li></li>
                      <li></li>
                      <li></li>
                   </ul>
                 </div>
              </div>
         </div>
         
          <div class="category">    
          <div class="col-sm-2">
         <h3>속이 뻥 뚫리는 <b>액션</b>영화</h3>
               <div class="gallery">
                   <ul class="clearfix" id="ul5">
                   
                   </ul>
                     </div>
                <div class="g_item">
                   <ul>
                      <li class="on"></li>
                      <li></li>
                      <li></li>
                      <li></li>
                   </ul>
                 </div>
              </div>
              </div>

          <div class="category">    
          <div class="col-sm-2">
         <h3>올 여름을 시원하게 <b>미스터리</b></h3>
               <div class="gallery">
                   <ul class="clearfix" id="ul6">
                   
                   </ul>
                     </div>
                <div class="g_item">
                   <ul>
                      <li class="on"></li>
                      <li></li>
                      <li></li>
                      <li></li>
                   </ul>
                 </div>
              </div>
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




<script>
var gall  = setInterval(galleryFun, 2000);
var inter = true;
var idx = 2;

 function galleryFun(){
   
    $(".gallery ul").animate({
      "left":-300*idx+"px"
    },300);
   $(".g_item ul li").eq(idx-1).addClass("on").siblings().removeClass("on");
   idx++;
   if(idx> $(".gallery ul li").length-3){
     $(".gallery ul").animate({
       "left":0
     },0);
     idx=0;
     
   }
 }
 
 
 $(".gallery , .g_item").hover(function(){
   if(inter==true){
     clearInterval(gall);
     inter=false;
   }
 },function(){
   if(inter==false){
     gall  = setInterval(galleryFun, 2000);
     inter=true;
   }
   
 });
 

 $(".g_item ul li").on('click',function(){
   $(this).addClass("on").siblings().removeClass("on");
   idx = $(this).index()+1;
   $(".gallery ul").animate({
      "left":-300*idx+"px"
    },1000);
   
 });
 
</script>
</body>
</html>