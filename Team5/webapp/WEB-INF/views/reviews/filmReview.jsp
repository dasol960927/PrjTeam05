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



          <div class="row mt-4">
            <nav class="w-100">
              <div class="nav nav-tabs" id="product-tab" role="tablist">
                <a class="nav-item nav-link" id="product-desc-tab"  href="/filmReview?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmSeq}" style="background-color:#878787; color:#ECFFFF">영화설명</a>
                <a class="nav-item nav-link" id="product-comments-tab"  href="/REVIEW/grdList?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}">리뷰</a>
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