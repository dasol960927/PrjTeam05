<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>FilmCritics | FilmReview</title>
<%@ include file="/WEB-INF/include/admin.jsp"%>
<%@ include file="/WEB-INF/include/ReviewCommon.jsp"%>
<style>
table {
   border: 1px solid #444444;
   border-collapse: collapse;
}

th, td {
   border: 1px solid #444444;
   padding: 10px;
}

.orderby{
   cursor:pointer;
}
</style>
<script>
/* a href="/REVIEW/insGrdCnt?sGubun=G&revIdx=${revVo.revIdx}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmSeq}&mId=${login.mId} */
   $(function(){
      var hidRevIdxG = $("#hidRevIdxG").val();   
      var hidRevIdxB = $("#hidRevIdxB").val();   
      var hidRevIdxN = $("#hidRevIdxN").val();   
      //alert(hidRevIdxN);
      
      $('.cGoodG').on('click', function(){
         $.ajax({
            url : '/REVIEW/insGrdCnt',
            data : {
               sGubun : 'G', revIdx : hidRevIdxG, docId : '${docId}', fimlId : '${filmId}', 
               filmSeq : '${filmSeq}', filmYear : '${filmYear}', mId : '${login.mId}'
            },
            dataType : 'json',
            type : 'get',
            success : function(data){
               var goodCnt = $('#goodTextG').text();
               //green : rgb(0, 128, 0);
               //alert($('#thumbGood').css('color'))
               if($('#thumbGoodG').css('color') != 'rgb(0, 128, 0)' && $('#thumbBadG').css('color') != 'rgb(255, 0, 0)'){
                  var cnt = Number(goodCnt) + 1;
                  $('#thumbGoodG').css('color', 'green');
                  $('#goodTextG').text(cnt);
                  //return false;
                  
               }else if($('#thumbGoodG').css('color') == 'rgb(0, 128, 0)'){
                  alert('이미 공감하셨습니다');
                  //return false;                  
               }else if($('#thumbBadG').css('color') == 'rgb(255, 0, 0)'){
                  alert('이미 비공감하셨습니다');
                  //return false;
               }
               
            },
            error : function(xhr){
               alert("error: " + xhr.status + "," + xhr.textStatus);
            } 
            
         });
         
      });
      
      $('.cBadG').on('click', function(){
         $.ajax({
            url : '/REVIEW/insGrdCnt',
            data : {
               sGubun : 'B', revIdx : hidRevIdxG, docId : '${docId}', fimlId : '${filmId}', 
               filmSeq : '${filmSeq}', filmYear : '${filmYear}', mId : '${login.mId}'
            },
            dataType : 'json',
            type : 'get',
            success : function(data){
               //red : rgb(255, 0, 0);
               //alert($('#thumbBad').css('color'))
               var badCnt = $('#badTextG').text();
               
               if($('#thumbGoodG').css('color') != 'rgb(0, 128, 0)' && $('#thumbBadG').css('color') != 'rgb(255, 0, 0)'){
                  var cnt = Number(badCnt) + 1;
                  $('#thumbBadG').css('color', 'red');
                  $('#badTextG').text(cnt);
                  //return false;
                  
               }else if($('#thumbGoodG').css('color') == 'rgb(0, 128, 0)'){
                  alert('이미 공감하셨습니다');
                  //return false;                  
               }else if($('#thumbBadG').css('color') == 'rgb(255, 0, 0)'){
                  alert('이미 비공감하셨습니다');
                  //return false;
               }
               
            },
            error : function(xhr){
               alert("error: " + xhr.status + "," + xhr.textStatus);
            } 
            
         });
      })
      
      $('.cGoodB').on('click', function(){      
         $.ajax({
            url : '/REVIEW/insGrdCnt',
            data : {
               sGubun : 'G', revIdx : hidRevIdxB, docId : '${docId}', fimlId : '${filmId}', 
               filmSeq : '${filmSeq}', filmYear : '${filmYear}', mId : '${login.mId}'
            },
            dataType : 'json',
            type : 'get',
            success : function(data){
               var goodCnt = $('#goodTextB').text();
               //green : rgb(0, 128, 0);
               //alert($('#thumbGood').css('color'))
               if($('#thumbGoodB').css('color') != 'rgb(0, 128, 0)' && $('#thumbBadB').css('color') != 'rgb(255, 0, 0)'){
                  var cnt = Number(goodCnt) + 1;
                  $('#thumbGoodB').css('color', 'green');
                  $('#goodTextB').text(cnt);
                  //return false;
                  
               }else if($('#thumbGoodB').css('color') == 'rgb(0, 128, 0)'){
                  alert('이미 공감하셨습니다');
                  //return false;                  
               }else if($('#thumbBadB').css('color') == 'rgb(255, 0, 0)'){
                  alert('이미 비공감하셨습니다');
                  //return false;
               }
               
            },
            error : function(xhr){
               alert("error: " + xhr.status + "," + xhr.textStatus);
            } 
            
         });
         
      });
      
      $('.cBadB').on('click', function(){
         $.ajax({
            url : '/REVIEW/insGrdCnt',
            data : {
               sGubun : 'B', revIdx : hidRevIdxB, docId : '${docId}', fimlId : '${filmId}', 
               filmSeq : '${filmSeq}', filmYear : '${filmYear}', mId : '${login.mId}'
            },
            dataType : 'json',
            type : 'get',
            success : function(data){
               //red : rgb(255, 0, 0);
               //alert($('#thumbBad').css('color'))
               var badCnt = $('#badTextB').text();
               
               if($('#thumbGoodB').css('color') != 'rgb(0, 128, 0)' && $('#thumbBadB').css('color') != 'rgb(255, 0, 0)'){
                  var cnt = Number(badCnt) + 1;
                  $('#thumbBadB').css('color', 'red');
                  $('#badTextB').text(cnt);
                  //return false;
                  
               }else if($('#thumbGoodB').css('color') == 'rgb(0, 128, 0)'){
                  alert('이미 공감하셨습니다');
                  //return false;                  
               }else if($('#thumbBadB').css('color') == 'rgb(255, 0, 0)'){
                  alert('이미 비공감하셨습니다');
                  //return false;
               }
               
            },
            error : function(xhr){
               alert("error: " + xhr.status + "," + xhr.textStatus);
            } 
            
         });
      });
      
      $('#btnGrd').on('click', function(){
          $.ajax({
             url : '/REVIEW/checkRev',
             data : { mId : '${login.mId}', docId : '${docId}', revGubun : 'S'},
             dataType : 'text',
             type : 'get',
             success : function(data){
                if(data != 'NULL'){
                   alert(data)
                }else
                   window.open('/REVIEW/insertGrdForm?mId=${login.mId}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&genre=<%= (String)request.getParameter("genre")%>', '팝업창이름', 'width=500, height=500','location=no', 'resizable=no')
             },
             error : function(xhr){
                alert("error: " + xhr.status + "," + xhr.textStatus);
             }
          })
      })   
   });
   
   
   function cGoodN(idx) {
      
      var hidRevIdxN = $('#goodTextN' + idx ).text();
      
      $.ajax({
         url : '/REVIEW/insGrdCnt',
         data : {
            sGubun : 'G', revIdx : idx, docId : '${docId}', fimlId : '${filmId}', 
            filmSeq : '${filmSeq}', filmYear : '${filmYear}', mId : '${login.mId}'
         },
         dataType : 'json',
         type : 'get',
         success : function(data){
            var goodCnt = $('#goodTextN' + idx).text();
            //green : rgb(0, 128, 0);
            //alert($('#thumbGood').css('color'))
            if($('#thumbGoodN' + idx).css('color') != 'rgb(0, 128, 0)' && $('#thumbBadN'  + idx).css('color') != 'rgb(255, 0, 0)'){
               var cnt = Number(goodCnt) + 1;
               $('#thumbGoodN' + idx).css('color', 'green');
               $('#goodTextN' + idx).text(cnt);
               //return false;;
               
            }else if($('#thumbGoodN' + idx).css('color') == 'rgb(0, 128, 0)'){
               alert('이미 공감하셨습니다');
               //return false;                  
            }else if($('#thumbBadN' + idx).css('color') == 'rgb(255, 0, 0)'){
               alert('이미 비공감하셨습니다');
               //return false;
            }
            
         },
         error : function(xhr){
            alert("error: " + xhr.status + "," + xhr.textStatus);
         } 
         
      });
   }
   
   function cBadN(idx) {
      
      var hidRevIdxN = $('#badTextN' + idx ).text();
            
      $.ajax({
         url : '/REVIEW/insGrdCnt',
         data : {
            sGubun : 'B', revIdx : idx, docId : '${docId}', fimlId : '${filmId}', 
            filmSeq : '${filmSeq}', filmYear : '${filmYear}', mId : '${login.mId}'
         },
         dataType : 'json',
         type : 'get',
         success : function(data){
            var goodCnt = $('#badTextN' + idx).text();
            //green : rgb(0, 128, 0);
            //alert($('#thumbGood').css('color'))
            if($('#thumbGoodN' + idx).css('color') != 'rgb(0, 128, 0)' && $('#thumbBadN'  + idx).css('color') != 'rgb(255, 0, 0)'){
               var cnt = Number(goodCnt) + 1;
               $('#thumbBadN' + idx).css('color', 'red');
               $('#badTextN' + idx).text(cnt);
               //return false;;
               
            }else if($('#thumbGoodN' + idx).css('color') == 'rgb(0, 128, 0)'){
               alert('이미 공감하셨습니다');
               //return false;                  
            }else if($('#thumbBadN' + idx).css('color') == 'rgb(255, 0, 0)'){
               alert('이미 비공감하셨습니다');
               //return false;
            }
            
         },
         error : function(xhr){
            alert("error: " + xhr.status + "," + xhr.textStatus);
         } 
         
      });
   }   

</script>
</head>
<body class="hold-transition sidebar-mini">

   <div class="row mt-4">
    <nav class="w-100">
      <div class="nav nav-tabs" id="product-tab" role="tablist">
         <a class="nav-item nav-link" id="product-desc-tab"
            href="/filmReview?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmSeq}&mId=${login.mId}&genre=<%= (String)request.getParameter("genre")%>">영화설명</a>
         <a class="nav-item nav-link" id="product-comments-tab"
            href="/REVIEW/grdList?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}&filmPrice=${fVo.filmPrice}&genre=<%= (String)request.getParameter("genre")%>"
            style="background-color: #878787; color: #ECFFFF">평점</a> 
         <a class="nav-item nav-link" id="product-rating-tab"
            href="/REVIEW/revList?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}&genre=<%= (String)request.getParameter("genre")%>">리뷰</a>
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


      <br>
      <div><h5>관람객 평점 &nbsp;&nbsp;총 ${oCnt} 건 &nbsp;&nbsp;<input type="button" value="내 평점 등록" id="btnGrd" class="btn btn-primary btn-lg btn-flat"></h5></div>
      
      
      <span class = "orderby">
      <a href="/REVIEW/grdList?odGubun=odSym&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}&filmPrice=${fVo.filmPrice}/#product-comments-tab">
      공감순</a></span>&nbsp;&nbsp;&nbsp;&nbsp;
      
      <span class = "orderby">
      <a href="/REVIEW/grdList?odGubun=odDate&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}&filmPrice=${fVo.filmPrice}/#product-comments-tab">
      최신순</a></span>&nbsp;&nbsp;&nbsp;&nbsp;
      
      <span class = "orderby">
      <a href="/REVIEW/grdList?odGubun=odHighGrd&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}&filmPrice=${fVo.filmPrice}/#product-comments-tab">
      평점 높은 순</a></span>&nbsp;&nbsp;&nbsp;&nbsp;
      
      <span class = "orderby">
      <a href="/REVIEW/grdList?odGubun=odLowGrd&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}&filmPrice=${fVo.filmPrice}/#product-comments-tab">
      평점 낮은 순</a></span>&nbsp;&nbsp;&nbsp;&nbsp;
         <table id="example1" class="table table-bordered table-striped">
         <%-- <thead>
                  <tr>
                     <th style="width: 100px">한줄평</th>
                     <th>총 ${oCnt} 건&nbsp;&nbsp;&nbsp;</th>
                  </tr>
            </thead> --%>
         <tbody>
            <c:forEach var="revVo" items="${grdList}">
               <tr>
                  <td width="300px"><%@ include file="/WEB-INF/include/star.jsp"%></td>
                  <td width="700px">${revVo.grdConts}<br />
                     <a href="#" onclick="window.open('/REVIEW/userWriteList?mNickName=${revVo.mNickName}', '팝업창이름', 'width=700, height=700','location=no', 'resizable=no'); return false;">${revVo.mId}</a>&nbsp;${revVo.revDate}<br /> 
                     <c:choose>
                        <c:when test="${revVo.symGubun eq 'G'.charAt(0)}">
                           <%-- <i class="fas fa-thumbs-up" id="good" style="color:green;"></i>: <a href="/REVIEW/insGrdCnt?sGubun=G&revIdx=${revVo.revIdx}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmSeq}&mId=${login.mId}">${revVo.goodCnt}</a> 
                   <i class="fas fa-thumbs-up" id="bad" style="transform: scaleY(-1); color:gray;"></i>: <a href="/REVIEW/insGrdCnt?sGubun=B&revIdx=${revVo.revIdx}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmSeq}&mId=${login.mId}">${revVo.badCnt}</a> --%>
                           <span class="cGoodG"><i class="fas fa-thumbs-up" id="thumbGoodG" style="color: green; cursor: pointer"></i></span>&nbsp;&nbsp;
                           <span id="goodTextG">${revVo.goodCnt}</span>&emsp;
                           
                           <span class="cBadG"><i class="fas fa-thumbs-up"   id="thumbBadG" style="transform: scaleY(-1); color: gray; cursor: pointer"></i></span>&nbsp;&nbsp;
                           <span id="badTextG">${revVo.badCnt}</span>
                           <input type="hidden" id="hidRevIdxG" value="${revVo.revIdx}" />
                        </c:when>
                        <c:when test="${revVo.symGubun eq 'B'.charAt(0)}">
                           <%-- <i class="fas fa-thumbs-up" id="good" style="color:gray;"></i>: <a href="/REVIEW/insGrdCnt?sGubun=G&revIdx=${revVo.revIdx}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmSeq}&mId=${login.mId}">${revVo.goodCnt}</a></span> 
                   <i class="fas fa-thumbs-up" id="bad" style="transform: scaleY(-1); color:green;"></i>: <a href="/REVIEW/insGrdCnt?sGubun=B&revIdx=${revVo.revIdx}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmSeq}&mId=${login.mId}">${revVo.badCnt}</a> --%>
                           <span class="cGoodB"><i class="fas fa-thumbs-up" id="thumbGoodB" style="color: gray; cursor: pointer"></i></span>&nbsp;&nbsp;
                           <span id="goodTextB">${revVo.goodCnt}</span>&emsp;
                              
                           <span class="cBadB"><i class="fas fa-thumbs-up"   id="thumbBadB" style="transform: scaleY(-1); color: red; cursor: pointer"></i></span>&nbsp;&nbsp;
                           <span id="badTextB">${revVo.badCnt}</span>
                           <input type="hidden" id="hidRevIdxB" value="${revVo.revIdx}" />
                        </c:when>
                        <c:otherwise>
                           <%--                    <i class="fas fa-thumbs-up" id="good" style="color:gray;"></i>: <a href="/REVIEW/insGrdCnt?sGubun=G&revIdx=${revVo.revIdx}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmSeq}&mId=${login.mId}">${revVo.goodCnt}</a> 
                   <i class="fas fa-thumbs-up" id="bad" style="transform: scaleY(-1); color:gray;"></i>: <a href="/REVIEW/insGrdCnt?sGubun=B&revIdx=${revVo.revIdx}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmSeq}&mId=${login.mId}">${revVo.badCnt}</a> --%>
                           <span class="cGoodN" id="${revVo.revIdx}G" onclick="javascript:cGoodN(${revVo.revIdx})">
                           <i class="fas fa-thumbs-up" id="thumbGoodN${revVo.revIdx }"   style="color: gray; cursor: pointer"></i></span>&nbsp;&nbsp;
                           <span id="goodTextN${revVo.revIdx}">${revVo.goodCnt}</span>&emsp;
                           
                           <span class="cBadN" id="${revVo.revIdx}B" onclick="javascript:cBadN(${revVo.revIdx})">
                           <i class="fas fa-thumbs-up" id="thumbBadN${revVo.revIdx }" style="transform: scaleY(-1); color: gray; cursor: pointer"></i></span>&nbsp;&nbsp;
                           <span id="badTextN${revVo.revIdx}">${revVo.badCnt}</span>
                           <%-- <input type = "hidden" id = "hidRevIdxN" value = "${revVo.revIdx}" onclick="javascript:abc('${ revVo.revIdx }G, ')" /> --%>
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

   <%@ include file="/WEB-INF/include/footer.jsp"%>

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


   <%@ include file="/WEB-INF/include/doughnutChart.jsp"%>
</body>
</html>