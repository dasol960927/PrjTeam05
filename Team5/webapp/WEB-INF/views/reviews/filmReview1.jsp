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

               <table id="example1" class="table table-bordered table-striped">
                 <thead>                  
                   <tr>
                     <th style="width: 100px">한줄평</th>
                     <th>총 : 00건&nbsp;&nbsp;&nbsp; 
				  
				  <input type="button" value="내 한줄평 작성하기" class="btn btn-blcok btn-info btn-lg" 
				onclick="window.open('/REVIEW/insertGrdForm?mId=${login.mId}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}', '팝업창이름', 'width=500, height=500','location=no', 'resizable=no')">
				 
				 </th>
                   </tr>
                 </thead>
                 <tbody>
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
                 </tbody>
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
 <!-- page script -->
<script>
  $(function () {
    $("#example1").DataTable({
      "responsive": true,
      "autoWidth": false,
    });
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
</script>

<%@ include file="/WEB-INF/include/doughnutChart.jsp" %>
</body>
</html>