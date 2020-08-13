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
					 	html += '<div>';
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
		     	  'actor=' + actorVal + '&listCount=5&sort=prodYear,1';
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
						posterVal = '<img src="/img/ReadytoPoster.jpg" alt="포스터 준비중"/>';
					}else{
						posterVal = '<a href="/filmReview?docId=' + item.DOCID + 
								'&filmId=' + item.movieId + 
								'&filmSeq=' + item.movieSeq + 
								'&filmYear=' + item.prodYear + '"><img src="' + pos[0] + '"/></a>';
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

				var html = '';
				$.each(js, function(index, item) {				
					var posterVal = '';
					var pos = poster(item.posters); //포스터 문자열 자르기
					if(pos == ''){
						posterVal = '<img src="/img/PosterReady.jpg" alt="포스터 준비중"/>';
					}else{
						posterVal = '<a href="/filmReview"><img src="' + pos[0] + '"/></a>';
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

getBoxOffice('20200812', 'div0');
getActor('강동원', 'div1');
getActor('손예진', 'div2');
getDirector('봉준호','div3');
getDirector('박찬욱','div4');
getGenre('액션','div5')
getGenre('어드벤처','div6');

</script>
</head>
<body>
	<h3>박스오피스</h3>
	<div id=div0>
	</div>
	<h3>강동원배우</h3>
	<div id=div1>
	</div>
	<h3>손예진배우</h3>
	<div id=div2>
	</div>
	<h3>봉준호감독</h3>
	<div id=div3>
	</div>
	<h3>박찬욱감독</h3>
	<div id=div4>
	</div>
	<h3>액션장르</h3>
	<div id=div5>
	</div>
	<h3>어드벤처장르</h3>
	<div id=div6>
	</div>
</body>
</html>