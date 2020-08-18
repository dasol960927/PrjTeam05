<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>FilmCritics | FilmReview</title>
<%@ include file="/WEB-INF/include/admin.jsp" %>
<%@ include file="/WEB-INF/include/ReviewCommon.jsp" %>
<style>
table{
    border: 1px solid #444444;
    border-collapse: collapse;
}
th, td{
    border: 1px solid #444444;
    padding: 10px;

}
</style>
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
          <div class="row" >
			<div class="col-12 col-sm-6" id="here">
            
           
            </div>
            <div class="col-12 col-sm-6">
            <span id="here2">
    
             </span>
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
                <a class="nav-item nav-link" id="product-desc-tab"  href="/filmReview?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmSeq}" >영화설명</a>
                <a class="nav-item nav-link" id="product-comments-tab"  href="/REVIEW/grdList?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}"  style="background-color:#878787; color:#ECFFFF">리뷰</a>
                <a class="nav-item nav-link" id="product-rating-tab"  href="/REVIEW/revList?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}">평점</a>
              </div>
            </nav>
            <div class="tab-content p-3" id="nav-tabContent" >

				 <div class="tab-pane fade show active" id="product-desc" role="tabpanel" aria-labelledby="product-desc-tab">
				  <table> 
                <tr>
                  <th width="100px">한줄평</th>
                  <th width="900px">
                    총 : 00건&nbsp;&nbsp;&nbsp; 
                  		
					<input type="button" value="내 한줄평 작성하기" 
					onclick="window.open('/REVIEW/insertGrdForm?mId=${login.mId}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}', '팝업창이름', 'width=500, height=500','location=no', 'resizable=no')">
                  </th>                                    
                </tr> 
                
                 <c:forEach var="revVo" items="${grdList}">
                 <tr>	            
              	   <td width="300px">
              	   		<%  %>
              	   		${revVo.grdScore}
              	   </td>
              	   <td width="700px">
              	   ${revVo.grdConts}<br/>
              	   ${revVo.mId}&nbsp;${revVo.revDate}<br/>
              	   좋아요 : <a href="#">${revVo.goodCnt}</a> 싫어요 : <a href="#">${revVo.badCnt}</a>
              	   </td>   
 				 </tr>	             
                 </c:forEach>
               
   </table> 
				 </div>

            </div>
          </div>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
	</div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

<%@ include file="/WEB-INF/include/footer.jsp" %>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->


 <script>
 $('.starRev span').click(function(){
  $(this).parent().children('span').removeClass('on');
  $(this).addClass('on').prevAll('span').addClass('on');
  return false;
});
 </script>
 <script>
 $('.starRev span').click(function(){
  $(this).parent().children('span').removeClass('on');
  $(this).addClass('on').prevAll('span').addClass('on');
  return false;
});
 </script>

<%@ include file="/WEB-INF/include/doughnutChart.jsp" %>
</body>
</html>