<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous">
</script>
<script>
function poster(string) {
	var str = string.split('|');
	
	return str;
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
				console.log(js);
				
				var html = '';
				$.each(js, function(index, item) {				
					var posterVal = '';
					var pos = poster(item.posters); //포스터 문자열 자르기
					if(pos == ''){
						posterVal = '<img src="/img/ReadyToPoster.jpg" alt="포스터 준비중"/>';
					}else{
						posterVal = '<a href="#"><img src="' + pos[0] + '"/></a>';
					}
					
					html += '<div>';
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

//감독
function getDirector(directorVal, divId) {
	$(function(){
		var url = 'http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=14RGX39B77HG1YYJ5L70&' + 
		     	  'director=' + directorVal + '&listCount=5&sort=prodYear,1';
		$.ajax({
			url : url,
			type : 'get',
			dataType : "json",
			success : function(data) {
				//console.log(data);
				
				var js = data.Data[0].Result;
				console.log(js);
				
				var html = '';
				$.each(js, function(index, item) {				
					var posterVal = '';
					var pos = poster(item.posters); //포스터 문자열 자르기
					if(pos == ''){
						posterVal = '<img src="/img/ReadyToPoster.jpg" alt="포스터 준비중"/>';
					}else{
						posterVal = '<a href="#"><img src="' + pos[0] + '"/></a>';
					}
					
					html += '<div>';
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


getActor('송강호', 'div1');
getActor('김윤석', 'div2');
getDirector('봉준호','div3');
getDirector('박찬욱','div4');
</script>
</head>
<body>
	<h3>송강호배우</h3>
	<div id=div1>
	</div>
	<h3>김윤석배우</h3>
	<div id=div2>
	</div>
	<h3>봉준호감독</h3>
	<div id=div3>
	</div>
	<h3>박찬욱감독</h3>
	<div id=div4>
	</div>
</body>
</html>