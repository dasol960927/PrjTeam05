<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
console.log(genre[0]);
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
			'genre=' + genre[0] + '&createDts=2019&listCount=5';
	$.ajax({
		url : url,
		type : 'get',
		dataType : "json",
		success : function(data) {
			//console.log(data);
			var json = data.Data[0].Result;
			console.log(data);
			var html  = '';
			html+= '<div style="float:left;">'
			$.each(json, function(index, item) {
				
				var tit = title(item.titleEtc); //제목 문자열 자르기				

				//포스터
				var posterVal = '';
				var pos = poster(item.posters); //포스터 문자열 자르기
				if(pos == ''){
					posterVal = '<img src="/img/PosterReady.jpg" class="product-image" alt="포스터 준비중"/>';
				}else{
					posterVal = '<img src="' + pos[0] + '" class="product-image" alt="포스터"/>';
				}

				
				html+=                posterVal;
				html+=              '<p>' + tit[0] + '</p>';
			    
			                
				});
			html+=				 '</div>';
			$('#divTest').html(html);
			
		},
		error : function(xhr) {
			alert(xhr.status + '' + xhr.textStatus);
	  	}
	});
});

</script>