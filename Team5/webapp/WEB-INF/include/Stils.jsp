<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
var movieId = '<%= (String)request.getParameter("filmId")%>';
var movieSeq = '<%= (String)request.getParameter("filmSeq")%>';

//포스터, 스틸컷 url
function poster(string) {
	var str = string.split('|');
	
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
			console.log(data);
			var json = data.Data[0];
			//console.log(json);
			
			var list;
			var exit= false;
			var first   = '';
			var second  = '';
			var third   = '';
			var fourth  = '';
			var fifth   = '';
			
				$.each(json, function(index, item) {
					list = json.Result;
					//console.log(json.Result);
										
					$.each(list, function(index, item) {

						//스틸컷
						var stllsVal = '';
						var stl = poster(item.stlls); //스틸컷 문자열 자르기
						if(stl == ""){
							stllsVal += '<img src="/img/ready.jpg" alt="스틸컷 준비중"/>';
						}else{
							for(var i=0; i<5; i++) {
								stllsVal +='<img src="'+stl[i]+'"/>';
							}
						}
						
						if(poster(item.stlls)==""){
							first   += '<img src="/img/ready.jpg" alt="스틸컷 준비중"/>';
						}else{							
							first   += '<img src="'+stl[0]+'" alt="스틸컷1"/>';
						}
						
						if(poster(item.stlls)==""){
							second   += '<img src="/img/ready.jpg" alt="스틸컷 준비중"/>';
						}else{							
							second   += '<img src="'+stl[1]+'" alt="스틸컷2"/>';
						}
						
						
						if(poster(item.stlls)==""){
							third   += '<img src="/img/ready.jpg" alt="스틸컷 준비중"/>';
						}else{							
							third   += '<img src="'+stl[2]+'" alt="스틸컷3"/>';
						}
						
						if(poster(item.stlls)==""){
							fourth   += '<img src="/img/ready.jpg" alt="스틸컷 준비중"/>';
						}else{							
							fourth   += '<img src="'+stl[3]+'" alt="스틸컷4"/>';
						}
						
						if(poster(item.stlls)==""){
							fifth   += '<img src="/img/ready.jpg" alt="스틸컷 준비중"/>';
						}else{							
							fifth   += '<img src="'+stl[4]+'" alt="스틸컷5"/>';
						}

						
			            exit = true; //이중 ajax 빠져나오기
					  });
					  if(exit){ return false;} //이중 ajax 빠져나오기
				});
			$('#first').html(first);
			$('#second').html(second);
			$('#third').html(third);
			$('#fourth').html(fourth);
			$('#fifth').html(fifth);
			
		},
		error : function(xhr) {
			alert(xhr.status + '' + xhr.textStatus);
	  	}
	});
		
});
</script>
<style>
*{margin:0; padding:0; }
#slider-wrap{
    width:250px;
    height:150px;
    position:relative;
    overflow:hidden;
}

#slider-wrap ul#slider{
    width:100%;
    height:100%;
    
    position:absolute;
    top:0;
    left:0;     
}

#slider-wrap ul#slider li{
    float:left;
    position:relative;
    width:250px;
    height:150px;   
    list-style:none;
}

#slider-wrap ul#slider li > div{
    position:absolute;
    top:20px;
    left:35px;  
}

#slider-wrap ul#slider li > div h3{
    font-size:36px;
    text-transform:uppercase;   
}

#slider-wrap ul#slider li > div span{
    font-family: Neucha, Arial, sans serif;
    font-size:21px;
}

#slider-wrap ul#slider li img{
    display:block;
    width:100%;
  height: 100%;
}


/*btns*/
.btns{
    position:absolute;
    width:50px;
    height:60px;
    top:50%;
    margin-top:-25px;
    line-height:57px;
    text-align:center;
    cursor:pointer; 
    background:rgba(0,0,0,0.1);
    z-index:100;
    
    
    -webkit-user-select: none;  
    -moz-user-select: none; 
    -khtml-user-select: none; 
    -ms-user-select: none;
    
    -webkit-transition: all 0.1s ease;
    -moz-transition: all 0.1s ease;
    -o-transition: all 0.1s ease;
    -ms-transition: all 0.1s ease;
    transition: all 0.1s ease;
}

.btns:hover{
    background:rgba(0,0,0,0.3); 
}

#next{right:-50px; border-radius:7px 0px 0px 7px;}
#previous{left:-50px; border-radius:0px 7px 7px 7px;}
#counter{
    top: 5px; 
    left:15px; 
    width:auto;
    position:absolute;
    color:yellow;
}

#slider-wrap.active #next{right:0px;}
#slider-wrap.active #previous{left:0px;}


/*bar*/
#pagination-wrap{
    min-width:20px;
    margin-top:350px;
    margin-left: auto; 
    margin-right: auto;
    height:15px;
    position:relative;
    text-align:center;
}

#pagination-wrap ul {
    width:100%;
}

#pagination-wrap ul li{
    margin: 0 4px;
    display: inline-block;
    width:5px;
    height:5px;
    border-radius:50%;
    background:#fff;
    opacity:0.5;
    position:relative;
  top:0;
  
  
}

#pagination-wrap ul li.active{
  width:12px;
  height:12px;
  top:3px;
    opacity:1;
    box-shadow:rgba(0,0,0,0.1) 1px 1px 0px; 
}


/*ANIMATION*/
#slider-wrap ul, #pagination-wrap ul li{
    -webkit-transition: all 0.3s cubic-bezier(1,.01,.32,1);
    -moz-transition: all 0.3s cubic-bezier(1,.01,.32,1);
    -o-transition: all 0.3s cubic-bezier(1,.01,.32,1);
    -ms-transition: all 0.3s cubic-bezier(1,.01,.32,1);
    transition: all 0.3s cubic-bezier(1,.01,.32,1); 
}

</style>


<div id="slider-wrap">
			<ul id="slider">
           		<li id="first"></li>
           		<li id="second"></li>
           		<li id="third"></li>
           		<li id="fourth"></li>
           		<li id="fifth"></li>
			</ul>

			<!--controls-->
			<div class="btns" id="next">
				<i class="fa fa-arrow-right"></i>
			</div>
			<div class="btns" id="previous">
				<i class="fa fa-arrow-left"></i>
			</div>
			<div id="counter"></div>

			<div id="pagination-wrap">
				<ul>
				</ul>
			</div>
			<!--controls-->

		</div>
		
		
<script>
//current position
var pos = 0;
//number of slides
var totalSlides = $('#slider-wrap ul li').length;
//get the slide width
var sliderWidth = $('#slider-wrap').width();

$(document).ready(function() {

	/*****************
	 BUILD THE SLIDER
	 *****************/
	//set width to be 'x' times the number of slides
	$('#slider-wrap ul#slider').width(sliderWidth * totalSlides);

	//next slide    
	$('#next').click(function() {
		slideRight();
	});

	//previous slide
	$('#previous').click(function() {
		slideLeft();
	});

	/*************************
	 //*> OPTIONAL SETTINGS
	 ************************/
	//automatic slider
	var autoSlider = setInterval(slideRight, 3000);

	//for each slide 
	$.each($('#slider-wrap ul li'), function() {

		//create a pagination
		var li = document.createElement('li');
		$('#pagination-wrap ul').append(li);
	});

	//counter
	countSlides();

	//pagination
	pagination();

	//hide/show controls/btns when hover
	//pause automatic slide when hover
	$('#slider-wrap').hover(function() {
		$(this).addClass('active');
		clearInterval(autoSlider);
	}, function() {
		$(this).removeClass('active');
		autoSlider = setInterval(slideRight, 3000);
	});

});//DOCUMENT READY

/***********
 SLIDE LEFT
 ************/
function slideLeft() {
	pos--;
	if (pos == -1) {
		pos = totalSlides - 1;
	}
	$('#slider-wrap ul#slider').css('left', -(sliderWidth * pos));

	//*> optional
	countSlides();
	pagination();
}

/************
 SLIDE RIGHT
 *************/
function slideRight() {
	pos++;
	if (pos == totalSlides) {
		pos = 0;
	}
	$('#slider-wrap ul#slider').css('left', -(sliderWidth * pos));

	//*> optional 
	countSlides();
	pagination();
}

/************************
 //*> OPTIONAL SETTINGS
 ************************/
function countSlides() {
	$('#counter').html(pos + 1 + ' / ' + totalSlides);
}

function pagination() {
	$('#pagination-wrap ul li').removeClass('active');
	$('#pagination-wrap ul li:eq(' + pos + ')').addClass('active');
}
</script>