<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>이미지 슬라이드</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
li{list-style:none;}
.clearfix { overflow: auto; }
.clearfix::after {content: ""; clear: both; display: table; }
.clear{clear: both;}    
.gallery{width: 900px; margin: 20px auto; border: 1px solid #ccc; overflow: hidden; padding-left:0; }
.gallery ul{width: 300%; position: relative; left: -300px;}
.gallery ul li {float: left; width: 215px; height: 330px; box-sizing: border-box; padding: 15px; text-align: center; line-height: 150px;}


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
</head>
<body>
	<h1>이미지슬라이드 시작</h1>
	 <div class="gallery">
	 	<ul class="clearfix">
	 		<li><div class="img">하지마라고!!!</div></li>		
	 		<li><div class="img">하지마라고!</div></li>		
	 		<li><div class="img">하지마라고!</div></li>		
	 		<li><div class="img">하지마라고!</div></li>		
	 		<li><div class="img">하지마라고!</div></li>		
	 		<li><div class="img">하지마라고!</div></li>		
	 		<li><div class="img">하지마라고!</div></li>		
	 		<li><div class="img">하지마라고!</div></li>		
	 		<li><div class="img">하지마라고!</div></li>		
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
</body>
</html>