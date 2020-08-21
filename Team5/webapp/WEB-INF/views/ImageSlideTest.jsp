<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ImageSliderTest</title>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <%@ include file="/WEB-INF/include/admin.jsp" %>

<script>
var movieId = '<%= (String)request.getParameter("filmId")%>'
var movieSeq = '<%= (String)request.getParameter("filmSeq")%>'

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
			var html  = '';
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
							for(var i=0; i<3; i++) {
								stllsVal +='<img src="'+stl[i]+'"/>';
							}
						}

						
						html+=                '<div class="w3-display-container mySlides">'+ '<img src="'+stl[0]+'"/>' + '</div>';
						html+=                '<div class="w3-display-container mySlides">'+ '<img src="'+stl[1]+'"/>' + '</div>';
						html+=                '<div class="w3-display-container mySlides">'+ '<img src="'+stl[2]+'"/>' + '</div>';
			                
			            exit = true; //이중 ajax 빠져나오기
					  });
					  if(exit){ return false;} //이중 ajax 빠져나오기
				});
			$('#here').html(html);
			
		},
		error : function(xhr) {
			alert(xhr.status + '' + xhr.textStatus);
	  	}
	});
	

</script>
  
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/lib/w3.css">
<body>

<div class="w3-content" style="max-width:800px;position:relative" id="here">


<a class="w3-btn-floating w3-hover-dark-grey" style="position:absolute;top:52%;left:0;border:1px solid black;" onclick="plusDivs(-1)">❮</a>
<a class="w3-btn-floating w3-hover-dark-grey" style="position:absolute;top:52%;right:0;border:1px solid black;" onclick="plusDivs(1)">❯</a>

</div>

<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length} ;
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>

</body>
</body>
</html>