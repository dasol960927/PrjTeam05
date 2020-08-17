<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>FilmCritics | FilmReview</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
.starR1{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}

table{
    border: 1px solid #444444;
    border-collapse: collapse;
}
th, td{
    border: 1px solid #444444;
    padding: 10px;

}

#Contents{
      width:1000px;
      height:40px;      
      padding:0 5px;
      overflow:hidden;
      text-overflow:ellipsis;
      
}

#pContents{
	padding: 3px;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2; /* 라인수 */
    -webkit-box-orient: vertical;
    word-wrap:break-word; 
    line-height: 1.2em;
    height: 2.4em; /* line-height 가 1.2em 이고 3라인을 자르기 때문에 height는 1.2em * 3 = 3.6em */
}

.link1{
	color:blue;
	font-weight:bold;	
}

.link2{
	color:black;	
}

a.link1:hover{text-decoration:underline;}
a.link2:hover{text-decoration:underline;}
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
		async: false,
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

			            exit = true; //이중 ajax 빠져나오기
					  });
					  if(exit){ return false;} //이중 ajax 빠져나오기
				});
			$('#here').html(html);
			$('#here2').html(html2);
			
		},
		error : function(xhr) {
			alert(xhr.status + '' + xhr.textStatus);
	  	}
	});
});
</script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script language="javaScript">

	function btnToggle(){
		
		$("#btnToggle").click(function(){				
			
			//window.location.href='#tblToggle';
			
			$("#tblToggle").toggle();			
		});
		
	}

</script>
</head>
<body class="hold-transition sidebar-mini">
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
          <div class="row">
            <div class="col-12 col-sm-6">
              <h3 class="d-inline-block d-sm-none">Films Review</h3>
              <div class="col-12">
                <img src="http://file.koreafilm.or.kr/thm/02/00/05/62/tn_DPK016088.jpg" class="product-image" alt="Product Image">
              </div>
              <div class="col-12 product-image-thumbs">
                <div class="product-image-thumb "><img src="http://file.koreafilm.or.kr/thm/01/copy/00/54/37/tn_DST692321.jpg" alt="Product Image"></div>
                <div class="product-image-thumb" ><img src="http://file.koreafilm.or.kr/thm/01/copy/00/54/37/tn_DST692322.jpg" alt="Product Image"></div>
                <div class="product-image-thumb" ><img src="http://file.koreafilm.or.kr/thm/01/copy/00/54/37/tn_DST692323.jpg" alt="Product Image"></div>
              </div>
            </div>
            <div class="col-12 col-sm-6">
              <h3 class="my-3">다만 악에서 구하소서</h3>
              <p>출연진: 황정민, 이정재, 박정민, 박소이, 최희서 <br/> 감독 :홍원찬 <br/> 개봉일: 2020.08.05</p>

              <hr>
				<!-- DONUT CHART -->
	            <div class="card card-danger">
	              <div class="card-header">
	                <h3 class="card-title">연령별 평점</h3>
	
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

              <h4 class="mt-3">영화 <small>별점</small></h4>
			  <div class="starRev">
				  <span class="starR1 on">★</span>
				  <span class="starR2">★</span>
				  <span class="starR1">★</span>
				  <span class="starR2">★</span>
				  <span class="starR1">★</span>
				  <span class="starR2">★</span>
				  <span class="starR1">★</span>
				  <span class="starR2">★</span>
				  <span class="starR1">★</span>
				  <span class="starR2">★</span>
				  <script>
				  $('.starRev span').click(function(){
					  $(this).parent().children('span').removeClass('on');
					  $(this).addClass('on').prevAll('span').addClass('on');
					  return false;
					});
				  </script>
				</div>

              <div class="bg-gray py-2 px-3 mt-4">
                <h2 class="mb-0">
                  3000 P
                </h2>
                <h4 class="mt-0">
                  <small>${login.mName }님의 잔여금액:&nbsp;&nbsp;&nbsp; ${login.mCash }P</small>
                </h4>
              </div>

              <div class="mt-4">
	        	<div id="btns" style="width:700px; height: 80px; clear:both;">
	              <div class="info-box mb-3 bg-success" style="width:180px; height:70px; margin-right:15px; float:left;">
					  <span class="info-box-icon"><i class="far fa-heart"></i></span>
					  <div class="info-box-content">
					    <a href="/Likelist" style="color:white;">찜하기</a>
					</div>
	              </div>
	              
	                <div class="btn btn-primary btn-lg btn-flat" style="float:left; width:180px; height:70px; margin-left:5px;">
	                  <i class="fas fa-cart-plus fa-lg mr-2"></i> 
	                    	<a href="/DPS/List?mId=${memberVo.mId }" style="color:white;">포인트 충전</a>
	                </div>
	                <div class="btn btn-primary btn-lg btn-flat" style="float:left; width:180px; height:70px; margin-left:5px;">
	                  <i class="far fa-credit-card"></i> 
	                    	<a href="#" style="color:white;">구매하기</a>
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
          </div>
          <div class="row mt-4">
            <nav class="w-100">
              <div class="nav nav-tabs" id="product-tab" role="tablist">
                <a class="nav-item nav-link" id="product-desc-tab"  href="/?docId=K22319&filmId=K&filmSeq=22319&filmYear=2020"  >영화설명</a>
                <a class="nav-item nav-link" id="product-comments-tab"  href="/REVIEW/grdList?docId=K22319" >리뷰</a>
                <a class="nav-item nav-link" id="product-rating-tab"  href="/REVIEW/revList?docId=K22319" style="background-color:#878787; color:#ECFFFF">평점</a>
              </div>
            </nav>
            <div class="tab-content p-3" id="nav-tabContent" >
              <table> 
                <tr>
                  <th width="50px">제목&nbsp;&nbsp;&nbsp;</th>
                  <th width="400px"> ${revVo.revTitle} </th>
                  <th width="150px"> 작성자 / 작성일 </th>
                  <th width="300px"> ${revVo.mId} / ${revVo.revDate} </th>                                    
                </tr>    
                 
                 <tr>             	   
              	   <td colspan="4" width="1000px">
              	   		${revVo.revConts}              	                 	   
              	   </td>   
 				 </tr>	             
                 <tr>             	   
              	   <td colspan="4" >              	   		
              	   		댓글 : 0   <a href="#">새로고침(네이버영화에서는 img파일사용)</a>
              	   		<input type="button" name="revLvl1Submit" value="등록" />  						            	   		              	   		              	                 	   
              	   </td>   
 				 </tr>                 
                 <tr>
                   <td colspan="4">             	   
              	   	 <textarea id="revLvl1" name="revLvl1" cols="200" rows="2"
              	   	 style="resize:none" 
              	   	 placeholder="댓글을 남겨주세요.영화와 상관없는 내용은 약관에 의해 제재를 받을 수 있습니다">
              	   	 </textarea>
              	   </td>
 				 </tr>
 				 
 				 
				<!--   				 
 				 <c:forEach var="revVo1" items="${revList1}">
	 				 <tr>
	 				 	<td>${revVo1.mId}</td>
	 				 	<td>${revVo1.revConts}</td>
	 				 	<td>
	 				 	<input type="button" id="btnToggle" value="토글버튼" onclick="btnToggle()"/>
	 				 	</td>
	 				 </tr>
 				  	
 				 
 				 <c:forEach var="revVo2" items="${revList2}">
	 				 
	 				 	<c:choose>					
							<c:when test="${revVo1.revIdx eq revVo2.parentIdx}">
							<tr id="tblToggle">			
			 				   	<td colspan="1"><span>${revVo2.mId}</span></td>
			 				 	<td colspan="3"><span>${revVo2.revConts}</span></td>
			 				</tr>		 	
		 				 	</c:when>		 				 	
		 			    </c:choose>
											 			    
				 </c:forEach>	 			    
	 			 </c:forEach>	 				 	
 				 -->
 				 <c:forEach var="revVo" items="${revList}">
	 				 <tr>
	 				 	<td>${revVo.mId}</td>
	 				 	<td>${revVo.revConts}</td>
	 				 	<td>
	 				 	<input type="button" id="btnToggle" value="토글버튼" onclick="btnToggle()"/>
	 				 	</td>
	 				 </tr>				 
 				 
	 				 	<c:choose>					
							<c:when test="${revVo.revIdx eq revVo.parentIdx}">
							<tr id="tblToggle">			
			 				   	<td colspan="1"><span>${revVo.mId}</span></td>
			 				 	<td colspan="3"><span>${revVo.revConts}</span></td>
			 				</tr>		 	
		 				 	</c:when>		 				 	
		 			    </c:choose> 				 
	 			 </c:forEach> 		
	 			 
	 			 		                
              </table> 
            </div>
          </div>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 1.0.0
    </div>
    <div>고객센터(이용 및 결제 문의) cs@teamfive.co.kr • 051-629-5232 (유료) <br/>
		 제휴	및 대외 협력 contact@teamfive.com • 051-629-5232 (유료)</div>
		<div>주식회사 TeamFive | 대표 송지현 | 팀원 김상두 이재혁 박다솔 김주희 | 부산광역시 남구 용당동 부경대용당캠퍼스 공학 6관 | <br/>
		사업자등록번호 8282-2424 | 통신판매업 신고번호 제 2020-부산용당-2020호  <br/>
		대표번호 051-629-5233 <br/>
		 개인정보 처리 방침</div>
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="/plugins/chart.js/Chart.min.js"></script>
<!-- AdminLTE App -->
<script src="/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/dist/js/demo.js"></script>

<script>
  $(function () {
    /* ChartJS
     * -------
     * Here we will create a few charts using ChartJS
     */

    //-------------
    //- DONUT CHART -
    //-------------
    // Get context with jQuery - using jQuery's .get() method.
    var donutChartCanvas = $('#donutChart').get(0).getContext('2d')
    var donutData        = {
      labels: [
          '10대', 
          '20대',
          '30대', 
          '40대', 
          '50대', 
          '60대 이상', 
      ],
      datasets: [
        {
          data: [700,500,400,600,300,100],
          backgroundColor : ['#f56954', '#00a65a', '#f39c12', '#00c0ef', '#3c8dbc', '#d2d6de'],
        }
      ]
    }
    var donutOptions     = {
      maintainAspectRatio : false,
      responsive : true,
    }
    //Create pie or douhnut chart
    // You can switch between pie and douhnut using the method below.
    var donutChart = new Chart(donutChartCanvas, {
      type: 'doughnut',
      data: donutData,
      options: donutOptions      
    })

  });

</script>
</body>
</html>
