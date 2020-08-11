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
  crossorigin="anonymous"></script>
<style>
   .box {  border:1px solid black;
       margin:5px;
   }
</style>
<script>

//gallery에서 값 받아오기
var keywordGet = '<%= (String)request.getParameter("keyword")%>'
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
	var url = 'http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=14RGX39B77HG1YYJ5L70&title='+ keywordGet;
	var v1 = '';
	$.ajax({
		url : url,
		type : 'get',
		dataType : "json",
		async: false,
		data : {title : keywordGet},
		success : function(data) {
			//console.log(data);
			var json = data.Data[0];
			//console.log(json);

			var list;
			var exit= false;
			var html = '';
			
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
								stllsVal +='<a href="#"><img src="'+stl[i]+'"/></a>';
							}
						}

						//포스터
						var posterVal = '';
						var pos = poster(item.posters); //포스터 문자열 자르기
						if(pos == ''){
							posterVal = '<img src="/img/Aha.jpg" alt="포스터 준비중"/>';
						}else{
							posterVal = '<a href="#"><img src="' + pos[0] + '"/></a>';
						}
						
						//배우
						if(item.actors.actor[4] == null){
							var actorVal = '추가예정';
						}else{
							actorVal  = nullCheck(item.actors.actor[0].actorNm) + ', ';
							actorVal += nullCheck(item.actors.actor[1].actorNm) + ', ';
							actorVal += nullCheck(item.actors.actor[2].actorNm) + ', ';
							actorVal += nullCheck(item.actors.actor[3].actorNm) + ', ';
							actorVal += nullCheck(item.actors.actor[4].actorNm)
			            }
						
						html += '<div>';
						html += posterVal + '<br>';
						html += stllsVal;
			            html += '<p>제목 : ' + tit[1] + '</p>';
			           	html += '<p>감독 : ' + item.directors.director[0].directorNm + '</p>';
			           	html += '<p>배우 : ' +  actorVal + '</p>';
			           	html += '<p>줄거리 : ' + nullCheck(item.plots.plot[0].plotText) + '</p>';
		               	html += '<p>개봉일자 : ' + item.repRlsDate + '</p>';
			            html += '</div>';
			                
			            exit = true; //이중 ajax 빠져나오기
					  });
					  if(exit){ return false;} //이중 ajax 빠져나오기
				});
			$('#div1').html(html);
		},
		error : function(xhr) {
			alert(xhr.status + '' + xhr.textStatus);
	  	}
	});
});

</script>
</head>
<body>
	<div id=div1>
	</div>
</body>
</html>