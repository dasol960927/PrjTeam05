<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
li{list-style:none;}
.clearfix { overflow: auto; }
.clearfix::after {content: ""; clear: both; display: table; }
.clear{clear: both;}    
.gallery{width: 900px; margin: 20px auto; border: 1px solid #ccc; overflow: hidden; padding-left:0; }
.gallery ul{width: 300%; position: relative; left: -300px;}
.gallery ul li {float: left; width: 225px; height: 340px; box-sizing: border-box; padding: 15px; text-align: center; line-height: 340px;}


.g_item{width: 860px; margin: 0 auto; text-align: center;}
.g_item ul li{display: inline-block; margin-right: 10px; background: #ccc; width: 10px; height: 10px; border-radius: 50%;}
.g_item ul li.on{background: #f00;}

</style>
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


<script>
function genreText(string) {
	var str = string.split(',');
	
	return str;
}

var movieId = '<%= (String)request.getParameter("filmId")%>'
var movieSeq = '<%= (String)request.getParameter("filmSeq")%>'
var genreVal = '<%= (String)request.getParameter("genre")%>'

var genre = genreText(genreVal);

//console.log(movieId);
//console.log(movieSeq);
//console.log(genre[0]);
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
			'genre=' + genre[0] + '&createDts=2019&listCount=10';
	$.ajax({
		url : url,
		type : 'get',
		dataType : "json",
		success : function(data) {
			//console.log(data);
			var json = data.Data[0].Result;
			//console.log(data);
			var html  = '';
			$.each(json, function(index, item) {
				
				var tit = title(item.titleEtc); //제목 문자열 자르기				

				//포스터
				var posterVal = '';
				var pos = poster(item.posters); //포스터 문자열 자르기
				if(pos == ''){
					posterVal = '<img src="/img/PosterReady.jpg" alt="포스터 준비중"/>';
				}else{
					posterVal = '<a href="/filmReview?docId=' + data.Data[0].Result[0].DOCID + 
					'&filmId=' + data.Data[0].Result[0].movieId + 
					'&filmSeq=' + data.Data[0].Result[0].movieSeq + 
					'&filmYear=' + data.Data[0].Result[0].prodYear + '"><img src="' + pos[0] + '"/></a>';
				}

				html+=              '<li><div class="img">';
				html+= 				posterVal;
				html+=              '<b>' + tit[0] + '</b></div></li>';
			                
				});
			$('#divTest').html(html);
			
		},
		error : function(xhr) {
			alert(xhr.status + '' + xhr.textStatus);
	  	}
	});
});

</script>