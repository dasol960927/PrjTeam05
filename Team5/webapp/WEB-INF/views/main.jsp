<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FlimCritics Main</title>
<script src="https://code.jquery.com/jquery-3.5.1.js">
</script>
<style>
	header {clear:both;}
	
	#logo {width:200px; height:100px;}
	.login { display:block;  border:3px solid #B9B9BD; border-radius:20px;
		 color:#353535; text-decoration:none;
		width:130px; height:46px; line-height:46px;
		 text-align:center; float:left;
	}
	.login:hover{
		background-color:#B9B9BD;
		color:white;
	}
	
	#wrap {width:1920px; height:5000px; clear:both;}
	#div1  {width:1200px; clear:both;}
	.film { width:400px; border:1px solid black; float:left;
		margin: 10px;
	}
	.poster {width:220px; height:360px;}
	p {font-weight:bold;}
	#footer{
		height:300px;
		background-color:#1C1D1F; color:#848485;
	}
</style>
<script>

	$(function(){
		
			$.ajax({
				url		:'/getMovieJson',
				dataType: 'json',
				success : function(data){
		               console.log(data);

		               var list = data.boxOfficeResult.dailyBoxOfficeList;
		               var html = '';
		               $.each(list, function(index, dailyBoxOffice){    
		                  console.log(dailyBoxOffice);
		                  html+= '<div class="film">';
		                  html+= '<a href="/filmReview"><img class="poster" src="https://ssl.pstatic.net/imgmovie/mdi/mit110/1516/151646_P01_144220.jpg" alt="poster"/></a>';
		                  html+= '<p>' + dailyBoxOffice.movieNm + '</p>';
		                  html+= '<p>' + dailyBoxOffice.openDt + '</p>';
		                  html+= '</div>';
		               });
		               $('#div1').html(html);
		            },
				error	: function(xhr){
					console.log(xhr);
					alert('오류' + xhr.status);
				}
			});
		
		
			
			/*
	$.ajax({
		url : '/getNaver',
		dataType : 'json',
		success : function(data) {

			//alert(data);
			console.log(data);
			alert(data);
			var list = data.items;
			var item = data.items[0];
			var html = '';
			$.each(function(index, items){
				
			 	html+= '<div class="film">';
				html += '<a href="/chart"><img class="poster" src="' + item.image + ' alt="poster"/></a>';
               	html+= '<p>' + items.title + '</p>';
                html+= '<p>' + items.director + '</p>';
                html+= '<p>' + items.actor + '</p>';
                html+= '</div>';
			});
		},
		error : function(xhr) {
			console.log(xhr);
			alert('오류' + xhr.status);
		}
	});
*/


/*
		// XML 사용법
		$('#btn2').on(
				'click',
				function(e) {
					$.ajax({
						url : '/getMovieXml',
						dataType : 'xml',
						success : function(xml) {
							console.log(xml);
							alert(xml);
							var html = '';
							$(xml).find('dailyBoxOffice').each(
									function(index) {
										console.log($(this));
										html += '<div class="poster">';
										html += '<p>영화이름: '
												+ $(this).find('movieNm')
														.text() + '</p>';
										html += '<p>영화코드: '
												+ $(this).find('movieCd')
														.text() + '</p>';
										html += '</div>';
									});
							$('#div1').html(html);

						},
						error : function(xhr) {
							console.log(xhr);
							alert('오류' + xhr.status);
						}
					})
				});
				
*/



	});
</script>
</head>
<body>
<header>
	<img id="logo" src="/img/logo.jpg" alt="logo"/>
	<form action="" method="POST" id="search">
	<input type="text" name="searchWord" placeholder="작품 제목, 배우, 감독을 검색해보세요." size="50"/>
	<input type="submit" value="검색"/>
	</form>
	<a class="login" href="/login">로그인/회원가입</a>
</header>
<div id="wrap">
	<h3>현재상영영화</h3>
	<div id="div1">
	</div>
</div>
<footer>
	<div id="footer">
		<div>고객센터(이용 및 결제 문의) cs@teamfive.co.kr • 051-629-5232 (유료) <br/>
		 제휴	및 대외 협력 contact@teamfive.com • 051-629-5232 (유료)</div>
		<div>주식회사 TeamFive | 대표 송지현 | 부산광역시 남구 용당동 부경대용당캠퍼스 공학 6관 | <br/>
		사업자등록번호 8282-2424 | 통신판매업 신고번호 제 2020-부산용당-2020호  <br/>
		대표번호 051-629-5233 <br/>
		 개인정보 처리 방침</div>
	</div>
</footer>

</body>
</html>