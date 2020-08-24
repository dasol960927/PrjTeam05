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
</head>

<body class="hold-transition sidebar-mini">

          <div class="row mt-4">
            <nav class="w-100">
              <div class="nav nav-tabs" id="product-tab" role="tablist">
                <a class="nav-item nav-link" id="product-desc-tab"  href="/filmReview?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmSeq}&mId=${login.mId}&genre=<%= (String)request.getParameter("genre")%>" >영화설명</a>
                <a class="nav-item nav-link" id="product-comments-tab"  href="/REVIEW/grdList?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}&genre=<%= (String)request.getParameter("genre")%>"  >평점</a>
                <a class="nav-item nav-link" id="product-rating-tab"  href="/REVIEW/revList?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}&genre=<%= (String)request.getParameter("genre")%>" style="background-color:#878787; color:#ECFFFF">리뷰</a>
              </div>
            </nav>
            <div class="tab-content p-3" id="nav-tabContent" >

				 <div class="tab-pane fade show active" id="product-desc" role="tabpanel" aria-labelledby="product-desc-tab">
                <table id="example2" class="table table-bordered table-hover">
                  <thead>
                  <tr>
                    <th  width="100px">리뷰&nbsp;&nbsp;&nbsp;</th>
                    <th width="900px">총 ${oCnt} 개 
                    
				  <input type="button" value="내 리뷰 작성하기" class="btn btn-blcok btn-info btn-lg" 
				onclick="window.open('/REVIEW/insertRevForm?mId=${login.mId}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}', '팝업창이름', 'width=1000, height=1000','location=no', 'resizable=no')">
				    </th>                    
                  </tr>
                  </thead>
                  <tbody>
                 <c:forEach var="revVo" items="${revList}">
                 <tr>             	   
              	   <td colspan="2" >
              	   <a class="link1" href="/REVIEW/reviewRead?revIdx=${revVo.revIdx}&revLvl=${revVo.revLvl}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}">${revVo.revTitle}</a>
              	   &nbsp;&nbsp;${revVo.mId}&nbsp;&nbsp;${revVo.revDate}&nbsp;&nbsp;추천:${revVo.goodCnt}
              	   
              	   <a class="link2" href="/REVIEW/reviewRead?revIdx=${revVo.revIdx}&revLvl=${revVo.revLvl}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}"><p id="pContents">${revVo.revConts}</p></a>
              	   <br/>              	   
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
<%@ include file="/WEB-INF/include/doughnutChart.jsp" %>
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
<!-- 영화 이미지슬라이더 -->
<script>
var gall  = setInterval(galleryFun, 2000);
var inter = true;
var idx = 2;

 function galleryFun(){
   
    $(".gallery ul").animate({
      "left":-300*idx+"px"
    },300);
   $(".g_item ul li").eq(idx-1).addClass("on").siblings().removeClass("on");
   idx++;
   if(idx> $(".gallery ul li").length-3){
     $(".gallery ul").animate({
       "left":0
     },0);
     idx=0;
     
   }
 }
 
 
 $(".gallery , .g_item").hover(function(){
   if(inter==true){
     clearInterval(gall);
     inter=false;
   }
 },function(){
   if(inter==false){
     gall  = setInterval(galleryFun, 2000);
     inter=true;
   }
   
 });
 

 $(".g_item ul li").on('click',function(){
   $(this).addClass("on").siblings().removeClass("on");
   idx = $(this).index()+1;
   $(".gallery ul").animate({
      "left":-300*idx+"px"
    },1000);
   
 });
 
</script>
</body>
</html>


