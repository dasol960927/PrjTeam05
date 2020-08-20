<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ImageSliderTest</title>
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
					
					html += '<div class="w3-display-container mySlides">';
					html += posterVal;
		            html += '<div class="w3-display-bottomleft w3-large w3-container w3-padding-hor-16 w3-black">'+ item.title + '</div>';
		            html += '</div>';
				});
				html += '<a class="w3-btn-floating w3-hover-dark-grey" style="position:absolute;top:52%;left:0;background-color:tomato;" onclick="plusDivs(-1)">★</a>';
				html += '<a class="w3-btn-floating w3-hover-dark-grey" style="position:absolute;top:52%;right:0;background-color:tomato;" onclick="plusDivs(1)">★</a>';
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
					html += posterVal;
		            html += '<div class="w3-display-bottomleft w3-large w3-container w3-padding-hor-16 w3-black">' + item.title + '</div>';
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
					html += '<li><div class="img">';
					html += posterVal + '<br>';
		            html += '<b>' + item.title + '</b>';
		            html += '</div></li>';
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
getActor('박정민', 'here');
getActor('손예진', 'dd');
getDirector('봉준호','div3');
getDirector('박찬욱','div4');
getGenre('액션','hi')
getGenre('미스터리','div6');

</script>
<style>
li{list-style:none;}
.clearfix { overflow: auto; }
.clearfix::after {content: ""; clear: both; display: table; }
.clear{clear: both;}    
.gallery{width: 900px; margin: 20px auto; border: 1px solid #ccc; overflow: hidden; padding-left:0; }
.gallery ul{width: 300%; position: relative; left: -300px;}
.gallery ul li {float: left; width: 300px; height: 180px; box-sizing: border-box; padding: 15px; text-align: center; line-height: 150px;}
.gallery ul li .img{border: 3px solid #ccc;}

.g_item{width: 900px; margin: 0 auto; text-align: center;}
.g_item ul li{display: inline-block; margin-right: 10px; background: #ccc; width: 10px; height: 10px; border-radius: 50%;}
.g_item ul li.on{background: #f00;}
</style>
</head>
<body>

<div class="w3-content" id="here" style="width:230px; border:1px solid black;">
</div>




<div class="gallery">
 <ul class="clearfix" id="hi">
   
 </ul>
</div>

<div class="g_item">
  <ul>
    <li class="on"></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
  </ul>
</div>




<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = $(".mySlides");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length} ;
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>


<!-- 자동 -->
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



