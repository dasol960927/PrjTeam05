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
			console.log(data);
			var json = data.Data[0];
			//console.log(json);

			var list;
			var exit= false;
			var html  = '';
			var html2 = '';
			var html3 = '';
				$.each(json, function(index, item) {
					list = json.Result;
					//console.log(json.Result);
										
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
						html+=                '<div class="product-image-thumb">'+ '<img src="'+stl[3]+'"/>' + '</div>';
						html+=                '<div class="product-image-thumb">'+ '<img src="'+stl[4]+'"/>' + '</div>';
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
	
	$("#divBtnLike").on("click", function(){
		var loginMid = '${login.mId}';
		var docId = '${fVo.docId}';
		$.ajax({
			url : '/Like',
			data : {mId : loginMid, docId : docId },
			dataType : 'json',
			type : 'get',
			success : function(data){
				if(data.likeChk == 'N'){
					$("#btnLike").css("color","black");
					alert("찜 취소되었습니다");
				}else{
					$("#btnLike").css("color", "red");
					alert("찜이 되었습니다");
				}
			},
			error : function(xhr){
				alert("error: " + xhr.status + "," + xhr.textStatus);
			}
		})
	});
});
</script>



<!-- 구매버튼 -->
<script>
   $(function(){
      $('#btnPur').on('click', function(){
         if(confirm("구매하시겠습니까 ?") == true){
            var vmId = '${login.mId}';
            var vdocId = '${fVo.docId}';
            var vfilmPrice = '${fVo.filmPrice}';
            
            $.ajax({
               url : '/PUR/purFilm',
               data : {mId : vmId, docId : vdocId, filmPrice : vfilmPrice},
               dataType : 'json',
               type : 'get',
               success : function(data){
                  var oErrMsg = data.model.oErrMsg;
                  var oOverlapFilm = data.model.oOverlapFilm;
                  
                  if(oErrMsg == null){
                     if(oOverlapFilm == null){
                        alert('구매 되었습니다.');
                     }else
                        alert(oOverlapFilm);
                  }else
                     alert(oErrMsg);
               },
               error : function(xhr){
                  alert("error: " + xhr.status + "," + xhr.textStatus);
               }
               
            })
            /* 
            $(location).attr("href", "/PUR/purFilm?mId=${login.mId }&docId=${fVo.docId}&filmPrice=${fVo.filmPrice}");
              alert("구매되었습니다");
               */
          }
          else{
              return ;
          }
      })
   })
   
   
</script>



<input type = "hidden" id = "mId" value = "${login.mId }"/>
<!-- Site wrapper -->
<div class="wrapper">
    <!-- SEARCH FORM -->
    <form class="form-inline ml-3" method="POST" action="/FilmSearch">
      <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" type="search" placeholder="영화작품 제목을 검색해보세요."  size="50" aria-label="Search" id="keyword" name="keyword">
        <div class="input-group-append">
          <button class="btn btn-navbar" type="submit">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>영화 감상</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/">Home</a></li>
              <li class="breadcrumb-item active">Film Review </li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card card-solid">
        <div class="card-body">
          <div class="row" >
			<div class="col-12 col-sm-6" id="here">
            
           
            </div>
            <div class="col-12 col-sm-6">
            <span id="here2">
    
             </span>
				<!-- DONUT CHART -->
	            <div class="card card-danger">
	              <div class="card-header">
	                <h3 class="card-title">연령별 리뷰수</h3>
	
	                <div class="card-tools">
	                  <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
	                </div>
	              </div>
	              <div class="card-body">
	                <canvas id="donutChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
	              </div>
	              <!-- /.card-body -->
	            </div>
	            <!-- /.card -->

              <h4 class="mt-3">영화</h4>
			  <div class="starRev">
				  <span class="starR1 on">별1</span>
				  <span class="starR2 on">별2</span>
				  <small style="font-weight:bold; font-size:25px;">: ${oAvg}</small> <small>참여 : </small> <small>${oCnt}</small><small>명</small>				  				  
   			  </div>				
				<br>
				<br>

				<div class="bg-gray">
					<h2 class="mb-0">영화가격 : ${fVo.filmPrice }P</h2>
					<br>
					<h4 class="mt-0">잔여 캐시 : ${ mVo.mCash }P</h4>
				</div>

              <div class="mt-4">
              
             <div id="btns" style="width:700px; height: 80px; clear:both;">
             
             <c:choose>
              <c:when test="${likeChk eq 'Y'}">
                <div class="btn btn-default btn-lg btn-flat" id = "divBtnLike" style="float:left; margin-left:5px; height: 48px;">
                  <i class="fas fa-heart fa-lg mr-2" id = "btnLike" style="color:red"></i>찜하기 
                  <%-- <a href="/Like?mId=${ login.mId }&docId=${fVo.docId }"></a> --%>
               </div>
              </c:when>
              <c:otherwise>
                <div class="btn btn-default btn-lg btn-flat" id = "divBtnLike" style="float:left; margin-left:5px; height: 48px;">
                  <i class="fas fa-heart fa-lg mr-2" id = "btnLike"></i>찜하기
                  <%-- <a href="/Like?mId=${ login.mId }&docId=${docId }">찜하기</a> --%>
               </div>
              </c:otherwise>
             </c:choose>
                
                <div class="btn btn-primary btn-lg btn-flat" style="float:left; margin-left:5px;">
                  <i class="fas fa-cart-plus fa-lg mr-2"></i> 
                    	<a href="/DPS/List?mId=${login.mId }" style="color:white;">포인트 충전</a>
                </div>
                <div class="btn btn-primary btn-lg btn-flat" style="float:left; margin-left:5px;">
                  <i class="far fa-credit-card" id = "btnPur" ></i>구매하기

                    	 <%--<a href="/PUR/purFilm?mId=${login.mId }&docId=${fVo.docId}&filmPrice=${fVo.filmPrice}" style="color:white;">구매하기</a>--%>
                </div>
				
			 </div>

                </div>                           
				</div>

              <div class="mt-4 product-share">
                <a href="#" class="text-gray">
                  <i class="fab fa-facebook-square fa-2x"></i>
                </a>
                <a href="#" class="text-gray">
                  <i class="fab fa-twitter-square fa-2x"></i>
                </a>
                <a href="#" class="text-gray">
                  <i class="fas fa-envelope-square fa-2x"></i>
                </a>
                <a href="#" class="text-gray">
                  <i class="fas fa-rss-square fa-2x"></i>
                </a>
              </div>

            </div>
