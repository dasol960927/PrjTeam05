<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.starR1 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat -52px 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR2 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR1.on {
	background-position: 0 0;
}

.starR2.on {
	background-position: -15px 0;
}
.starRev{width:170px; height:50px;}
</style>
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

//제목 자르기
function title(string) {
	var str = string.split('^');
	
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
			//console.log(data);
			var json = data.Data[0];
			//console.log(json);

			var list;
			var exit= false;
			var html  = '';
			var html2 = '';
			var html3 = '';
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
								stllsVal +='<img src="'+stl[i]+'"/>';
							}
						}

						
						//포스터
						var posterVal = '';
						var pos = poster(item.posters); //포스터 문자열 자르기
						if(pos == ''){
							posterVal = '<img src="/img/PosterReady.jpg" class="product-image" alt="포스터 준비중"/>';
						}else{
							posterVal = '<img src="' + pos[0] + '" class="product-image" alt="포스터"/>';
						}
						
						//배우
						if(item.actors.actor[4] == null){
							var actorVal = '추가예정';
						}else{
							actorVal  = nullCheck(item.actors.actor[0].actorNm) + ', ';
							actorVal += nullCheck(item.actors.actor[1].actorNm) + ', ';
							actorVal += nullCheck(item.actors.actor[2].actorNm) + ', ';
							actorVal += nullCheck(item.actors.actor[3].actorNm) + ', ';
							actorVal += nullCheck(item.actors.actor[4].actorNm);
			            }
						


						html+=              '<h3 class="d-inline-block d-sm-none">Films Review</h3>'
						html+=              '<div class="col-12">';
						html+=                posterVal;
						html+=              '</div>';
						html+=              '<div class="col-12 product-image-thumbs">';
						html+=                '<div class="product-image-thumb">'+ '<img src="'+stl[0]+'"/>' + '</div>';
						html+=                '<div class="product-image-thumb">'+ '<img src="'+stl[1]+'"/>' + '</div>';
						html+=                '<div class="product-image-thumb">'+ '<img src="'+stl[2]+'"/>' + '</div>';
						html+=              '</div>';

						html2+=              '<h3 class="my-3">' + tit[0] + '</h3>';
			            html2+= 			 '<p>배우:' + actorVal + '<br/> 감독 :' + item.directors.director[0].directorNm + '<br/> 개봉일: ' + item.repRlsDate + '</p>';
			            html2+=				 '<hr>';
			                
			            html3 += nullCheck(item.plots.plot[0].plotText);
			            exit = true; //이중 ajax 빠져나오기
					  });
					  if(exit){ return false;} //이중 ajax 빠져나오기
				});
			$('#here').html(html);
			$('#here2').html(html2);
			$('#here3').html(html3);
			
		},
		error : function(xhr) {
			alert(xhr.status + '' + xhr.textStatus);
	  	}
	});
});

</script>
