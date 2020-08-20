<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>FilmCritics | FilmReview</title>

<%@ include file="/WEB-INF/include/admin.jsp" %>
<%@ include file="/WEB-INF/include/ReviewCommon.jsp" %>

</head>

<body class="hold-transition sidebar-mini">

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

              <h4 class="mt-3">영화 <small>별점</small></h4>
			  <div class="starRev">
				  <span class="starR1 on">별1</span>
				  <span class="starR2">별2</span>
				  <span class="starR1">별3</span>
				  <span class="starR2">별4</span>
				  <span class="starR1">별5</span>
				  <span class="starR2">별6</span>
				  <span class="starR1">별7</span>
				  <span class="starR2">별8</span>
				  <span class="starR1">별9</span>
				  <span class="starR2">별10</span>
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
                  <i class="far fa-credit-card"></i> 

                    	<a href="/PUR/purFilm?mId=${login.mId }&docId=${fVo.docId}&filmPrice=${fVo.filmPrice}" style="color:white;">구매하기</a>
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

          <div class="row mt-4">
            <nav class="w-100">
              <div class="nav nav-tabs" id="product-tab" role="tablist">
                <a class="nav-item nav-link" id="product-desc-tab"  href="/filmReview?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmSeq}" style="background-color:#878787; color:#ECFFFF">영화설명</a>
                <a class="nav-item nav-link" id="product-comments-tab"  href="/REVIEW/grdList?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}">리뷰</a>
                <a class="nav-item nav-link" id="product-rating-tab"  href="/REVIEW/revList?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}">평점</a>
                <!-- 맨 마지막에 mId만 적용, 나머지도 바꿔야됨 -->
              </div>
            </nav>
            <div class="tab-content p-3" id="nav-tabContent" >

				 <div class="tab-pane fade show active" id="product-desc" role="tabpanel" aria-labelledby="product-desc-tab"><span id="here3"></span></div>
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



	<%@ include file="/WEB-INF/include/ReviewTest.jsp" %>
	<div class="gallery">
	 	<ul class="clearfix">
	 		<span id="divTest"></span>	
	 	</ul>
	 </div>
	 
	 <div class="g_item">
	 	<ul>
	 		<li class="on"></li>
	 		<li></li>
	 		<li></li>
	 		<li></li>
	 		<li></li>
	 	</ul>
	 </div>


  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->


<%@ include file="/WEB-INF/include/footer.jsp" %>
<%@ include file="/WEB-INF/include/doughnutChart.jsp" %>

</body>
</html>