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
<%@ include file="/WEB-INF/include/ReviewCommonGrd.jsp" %>
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
<script>


   $(function(){
      
         var hidRevIdx = $("#hidRevIdx").val();
         /*            
         $('#order1').on('click', function(){
                      
               var order1  = $('#order1').text();
                          
               var docId = $('#docId').val();
               var filmId = $('#filmId').val();
               var filmSeq = $('#filmSeq').val();
               var mId = $('#mId').val();
               var filmPrice = $('#filmPrice').val();
               
               alert(docId);
               
               var datas = new Object();      
            
               datas.gubun='A'; datas.docId=docId; datas.filmId=filmId; datas.filmSeq=filmSeq; datas.mId=mId; datas.filmPrice=filmPrice;
               
               var jsonDatas = JSON.stringify(datas);
               var data = JSON.parse(jsonDatas);
               alert(jsonDatas);
               alert(data);   

               $.ajax({
                  url : '/REVIEW/grdList',
                  data : data,
                  dataType : 'json',
                  type : 'get',
                  success : function(data){
                     
                     alert('성공이다');
                  },
                  error : function(xhr){
                     alert("error: " + xhr.status + "," + xhr.textStatus);
                  } 
                  
               });               
                  
               
               // if문 주석
                if(order1 == '공감순'){
                     datas.gubun='A'; datas.docId=docId; datas.filmId=filmId; datas.filmSeq=filmSeq; datas.mId=mId; datas.filmPrice=filmPrice;
                  }else if(order2 == '최신순'){
                     datas.gubun='B'; datas.docId=docId; datas.filmId=filmId; datas.filmSeq=filmSeq; datas.mId=mId; datas.filmPrice=filmPrice;
                  }else if(order3 == '평점높은순'){
                     datas.gubun='C'; datas.docId=docId; datas.filmId=filmId; datas.filmSeq=filmSeq; datas.mId=mId; datas.filmPrice=filmPrice;
                  }else if(order3 == '평점낮은'){
                     datas.gubun='D'; datas.docId=docId; datas.filmId=filmId; datas.filmSeq=filmSeq; datas.mId=mId; datas.filmPrice=filmPrice;
                  } 
    
               
               
            });
         */
      
      $('.cGood').on('click', function(){
         alert("맞음");
         
         $.ajax({
            url : '/REVIEW/insGrdCnt',
            data : {
               sGubun : 'G', revIdx : hidRevIdx, docId : '${docId}', fimlId : '${filmId}', 
               filmSeq : '${filmSeq}', filmYear : '${filmYear}', mId : '${login.mId}'
            },
            dataType : 'json',
            type : 'get',
            success : function(data){
               
               alert('success');
            },
            error : function(xhr){
               alert("error: " + xhr.status + "," + xhr.textStatus);
            } 
            
         });
         
      });
      
      
   });   
   

</script>
</head>
<body class="hold-transition sidebar-mini">

          <div class="row mt-4">
            <nav class="w-100">
              <div class="nav nav-tabs" id="product-tab" role="tablist">
                <a class="nav-item nav-link" id="product-desc-tab"  href="/filmReview?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmSeq}&mId=${login.mId}&genre=<%= (String)request.getParameter("genre")%>" >영화설명</a>
                <a class="nav-item nav-link" id="product-comments-tab"  href="/REVIEW/grdList?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}&filmPrice=${fVo.filmPrice}&genre=<%= (String)request.getParameter("genre")%>"  style="background-color:#878787; color:#ECFFFF">평점</a>
                <a class="nav-item nav-link" id="product-rating-tab"  href="/REVIEW/revList?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}&genre=<%= (String)request.getParameter("genre")%>">리뷰</a>
              </div>
            </nav>
            <div class="tab-content p-3" id="nav-tabContent" >

             <div class="tab-pane fade show active" id="product-desc" role="tabpanel" aria-labelledby="product-desc-tab">
             <h2 id="max"></h2>
             <img src="/img/man.jpg" alt="man" /><span id="man"></span>
             <img src="/img/woman.jpg" alt="woman" /><span id="woman"></span>
             <div id="container" style="width: 40%; ">
               <canvas id="canvas"></canvas>
             </div>
                          
               <table id="example1" class="table table-bordered table-striped">
                 <thead>                  
                   <tr>
                     <th style="width: 100px">한줄평</th>
                     <th>총  ${oCnt} 건 
<!--                      <span id="order1">공감순</span>
                     <span id="order2">최신순</span>
                     <span id="order3">평점높은순</span>
                     <span id="order4">평점낮은순</span> 
                     <input type="hidden" id="docId" value="${docId}" />
                     <input type="hidden" id="filmId" value="${filmId}" />
                     <input type="hidden" id="filmSeq" value="${filmSeq}" />
                     <input type="hidden" id="mId" value="${login.mId}" />
                     <input type="hidden" id="filmPrice" value="${fVo.filmPrice}" />-->
              
              <input type="button" value="내 한줄평 작성하기" class="btn btn-blcok btn-info btn-lg" 
            onclick="window.open('/REVIEW/insertGrdForm?mId=${login.mId}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}', '팝업창이름', 'width=500, height=500','location=no', 'resizable=no')">
             
             </th>
                   </tr>
                 </thead>
                 <tbody>
               <c:forEach var="revVo" items="${grdList}">
            <tr>               
                   <td width="300px">  
                         <%@ include file="/WEB-INF/include/star.jsp" %>
                   </td>
                   <td width="700px">
                   ${revVo.grdConts}<br/>
                   <a href="#" onclick="window.open('/REVIEW/userWriteList?mNickName=${revVo.mNickName}', '팝업창이름', 'width=700, height=700','location=no', 'resizable=no'); return false;">${revVo.mId}</a>
                   &nbsp;${revVo.revDate}<br/>                   
                   <c:choose>
                   <c:when test="${revVo.symGubun eq 'G'.charAt(0)}">
                   <%-- <i class="fas fa-thumbs-up" id="good" style="color:green;"></i>: <a href="/REVIEW/insGrdCnt?sGubun=G&revIdx=${revVo.revIdx}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmSeq}&mId=${login.mId}">${revVo.goodCnt}</a> 
                   <i class="fas fa-thumbs-up" id="bad" style="transform: scaleY(-1); color:gray;"></i>: <a href="/REVIEW/insGrdCnt?sGubun=B&revIdx=${revVo.revIdx}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmSeq}&mId=${login.mId}">${revVo.badCnt}</a> --%>
                   <i class="fas fa-thumbs-up" style="color:green;"></i>:${revVo.goodCnt}
                   <i class="fas fa-thumbs-up" style="transform: scaleY(-1); color:gray;">:${revVo.badCnt}</i>
                   </c:when>
                   <c:when test="${revVo.symGubun eq 'B'.charAt(0)}">
                   <%-- <i class="fas fa-thumbs-up" id="good" style="color:gray;"></i>: <a href="/REVIEW/insGrdCnt?sGubun=G&revIdx=${revVo.revIdx}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmSeq}&mId=${login.mId}">${revVo.goodCnt}</a></span> 
                   <i class="fas fa-thumbs-up" id="bad" style="transform: scaleY(-1); color:green;"></i>: <a href="/REVIEW/insGrdCnt?sGubun=B&revIdx=${revVo.revIdx}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmSeq}&mId=${login.mId}">${revVo.badCnt}</a> --%>
                   <i class="fas fa-thumbs-up" style="color:green;"></i>:${revVo.goodCnt}
                   <i class="fas fa-thumbs-up" style="transform: scaleY(-1); color:gray;">:${revVo.badCnt}</i>                   
                   </c:when>
                   <c:otherwise>
<%--                    <i class="fas fa-thumbs-up" id="good" style="color:gray;"></i>: <a href="/REVIEW/insGrdCnt?sGubun=G&revIdx=${revVo.revIdx}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmSeq}&mId=${login.mId}">${revVo.goodCnt}</a> 
                   <i class="fas fa-thumbs-up" id="bad" style="transform: scaleY(-1); color:gray;"></i>: <a href="/REVIEW/insGrdCnt?sGubun=B&revIdx=${revVo.revIdx}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmSeq}&mId=${login.mId}">${revVo.badCnt}</a> --%>
                   <span class="cGood"><i class="fas fa-thumbs-up" style="color:gray;"></i>:${revVo.goodCnt}</span> 
                   <span class="cBad"><i class="fas fa-thumbs-up" style="transform: scaleY(-1); color:gray;"></i>:${revVo.badCnt}</span>                   
                   <input type = "hidden" id = "hidRevIdx" value = "${revVo.revIdx}"/>                   
                   </c:otherwise>                                      
                   </c:choose>
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



<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js"></script>
<script src="/js/utils.js"></script>
<script>
$(function(){
	   
    var docIdVal = '${docId}';
     
     $.ajax({
         url : '/Chart/Max',
         type: 'GET',
         data: {'docId' : docIdVal},
         datatype: 'json',
         success : function(data) {      
            $.each(data, function(index, item){
               if(item == null){
                  $('#max').html('평점이 아직 작성되지 않았습니다.');
               }else{
                  $('#max').html('이 영화는 ' + item.str  + item.mGender + '가 좋아하는 영화입니다');
               }
            });
               
         }, 
            error : function(xhr) {
               alert('가장좋아하는 데이터'+ xhr.status + '' + xhr.textStatus);
            }
         });
     
     
     $.ajax({
         url : '/Chart/Gender',
         type: 'GET',
         data: {'docId' : docIdVal},
         datatype: 'json',
         success : function(data) {      
            $.each(data, function(index, item){
               if(item.mGender=='남자'){                  
                  $('#man').html('남자   ★' + item.avgGrdScore);
               }else{                  
                  $('#woman').html('여자 ★' + item.avgGrdScore);
               }
            });
               
         }, 
            error : function(xhr) {
               alert('남녀데이터'+ xhr.status + '' + xhr.textStatus);
            }
         });
     
     
     $.ajax({
        url : '/Chart/Grd',
         type: 'GET',
         data: {'docId' : docIdVal},
         datatype: 'json',
         success : function(datas) {
            console.log(datas);
                var labelList     = [];
                var dataList      = [];

             $.each ( datas , function(index, item) {
                   
                labelList.push(item.str);
                dataList.push(item.avgGrdScore);
             
                console.log(labelList);
                console.log(dataList);
             });
             
             
            var horizontalBarChartData = {
                labels: labelList,
                datasets: [{
                   backgroundColor: [
                        window.chartColors.red,
                        window.chartColors.orange,
                        window.chartColors.yellow,
                        window.chartColors.green,
                        window.chartColors.blue,
                        window.chartColors.blue
                     ],
                   borderWidth: 1,
                   data: dataList
                }]
             
             };
            
          
             //var ctx = $('#canvas').getContext('2d');
             var config  = new Chart($('#canvas'), {
                type: 'bar',
                data: horizontalBarChartData,
                options: {
                   indexAxis: 'y',
                   // Elements options apply to all of the options unless overridden in a dataset
                   // In this case, we are setting the border of each horizontal bar to be 2px wide
                   elements: {
                      rectangle: {
                         borderWidth: 2,
                      }
                   },
                   responsive: true,
                   legend: {
                      display: false,
                   },
                   title: {
                      display: true,
                      text: '연령대별 평균 평점'
                   }
                }
             });

          

            
     
         }, 
         error : function(xhr) {
            alert('막대그래프데이터'+ xhr.status + '' + xhr.textStatus);
         }
     
      })

});
</script>

<%@ include file="/WEB-INF/include/doughnutChart.jsp" %>
</body>
</html>