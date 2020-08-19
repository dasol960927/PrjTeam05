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

.btn{

  background-color: #878787;
  border: none;
  color: white;
  padding: 10px 15px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
</style>
<script language="javaScript">

	
	
	function btnToggle(index){
		
						
			
			//window.location.href='#tblToggle';
			
			//$("#tblToggle").toggle();
            if($('.vo2.' + index).css('display') == 'none'){
                $('.vo2.' + index).show();
            }else{
                $('.vo2.' + index).hide();
            }
	
		
	}
	
	
	$(document).ready(function(){
		
		$(".vo2").css("display", "none");		
		
	});
	
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
                <a class="nav-item nav-link" id="product-desc-tab"  href="/filmReview?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmSeq}"  >영화설명</a>
                <a class="nav-item nav-link" id="product-comments-tab"  href="/REVIEW/grdList?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}" >리뷰</a>
                <a class="nav-item nav-link" id="product-rating-tab"  href="/REVIEW/revList?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}" style="background-color:#878787; color:#ECFFFF">평점</a>
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
 				 
 				 <form action="/REVIEW/insRevLvl1?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}" method="post">	             
                 <tr>             	   
              	   <td colspan="4" >              	   		
              	   		댓글 : 총 ${oCnt}   <a href="#">새로고침(네이버영화에서는 img파일사용)</a>
              	   		              	   		
              	   		<input type="submit" class="btn" value="답글 달기" />              	   			
						<input type="hidden" name="revIdx" value="${revIdx}" />
						<input type="hidden" name="revLvl" value="${revLvl}" />
						<input type="hidden" name="mId" value="${login.mId}" />            	   			  						            	   		              	   		              	                 	   	
              	   </td>   
 				 </tr>                 
                 <tr>
                   <td colspan="4">             	   
              	   	 <textarea id="revLvl1" name="revConts" cols="200" rows="2"
              	   	 style="resize:none" 
              	   	 placeholder="댓글을 남겨주세요.영화와 상관없는 내용은 약관에 의해 제재를 받을 수 있습니다">
              	   	 </textarea>
              	   </td>
 				 </tr>
 				 </form>
 				 
 				 
 				 				   				 
 				 <c:forEach var="revVo1" items="${revList1}"> 				 
 		 							 	
	 				 <tr>
	 				 	<td colspan="1">${revVo1.mId}</td>
	 				 	<td colspan="2">${revVo1.revConts}</td>
	 				 	<td colspan="1">
	 				 	${revVo1.symId}
	 				 	${revVo1.symGubun}
	 				 	좋아요:<a href="/REVIEW/insRev12Cnt?sGubun=G&revLvl=${revLvl}&lvl0Idx=${revIdx}&revIdx=${revVo1.revIdx}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}">${revVo1.goodCnt}</a>&nbsp;&nbsp;
	 				 	싫어요:<a href="/REVIEW/insRev12Cnt?sGubun=B&revLvl=${revLvl}&lvl0Idx=${revIdx}&revIdx=${revVo1.revIdx}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}">${revVo1.badCnt}</a>
	 				 	</td> 				 	
	 				 </tr>
	 				
 				 
 				 <form action="/REVIEW/insRevLvl2?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}" method="post"> 	
	                 <tr class="vo2 ${ revVo1.revIdx }" >
	                   <td colspan="3">             	   
	              	   	 <textarea id="revLvl2" name="revConts" cols="200" rows="2"
	              	   	 	style="resize:none" 
	              	   	 	placeholder="댓글을 남겨주세요.영화와 상관없는 내용은 약관에 의해 제재를 받을 수 있습니다">
	              	   	 </textarea>
	              	   </td>
	              	   <td colspan="1">
	              	   		<input class="btn" type="submit" name="revConts" value="답글 달기" />
	              	   		
	              	   		<input type="hidden" name="lvl0Idx" value="${revIdx}" />
	              	   		<input type="hidden" name="revLvl" value="${revLvl}" />
	              	   			              	   		
	              	   		<input type="hidden" name="revIdx" value="${revVo1.revIdx}" />
	              	   		<input type="hidden" name="mId" value="${login.mId}" />
	              	   </td>
	 				 </tr>	 				 
	 				 
	 				 
 				 </form>
 				  		
 				 <c:set var="count" value="0" />		 
 				  				 
					<c:forEach var="revVo2" items="${revList2}">			
	 				 	<c:choose>					
							<c:when test="${revVo1.revIdx eq revVo2.parentIdx}">
							
							<tr class="vo2 ${ revVo1.revIdx }">
								<td colspan="1"></td>			
			 				   	<td colspan="1"><span>${revVo2.mId}</span></td>
			 				 	<td colspan="2"><span>${revVo2.revConts}</span></td>
		 				 	</tr>
		 				 	<c:set var="count" value="${count + 1}" />
		 				 				 					 	
		 				 	</c:when>		 				 	
		 			    </c:choose>   
											 			    
				 </c:forEach>
		 			<tr>
		 			
	 				 	<c:choose>					
							<c:when test="${count eq 0}">		 			
				 				<td colspan="4">
				 				<input type="button" id="btnToggle" value="답글작성" onclick="btnToggle('${ revVo1.revIdx }')"/>
				 				</td>
		 				 	</c:when>
		 				 	<c:otherwise>
				 				<td colspan="4">
				 				<input type="button" id="btnToggle" value="답글${ count }개" onclick="btnToggle('${ revVo1.revIdx }')"/>
				 				</td>		 				 	
		 				 	</c:otherwise>		 				 	
		 			    </c:choose>
		 			       		 					
		 			</tr>
		 			 				 	 			    
	 			 </c:forEach>	 				 	
 				
 				<!-- 
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
	 			  -->
	 			 		                
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

<%@ include file="/WEB-INF/include/footer.jsp" %>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<%@ include file="/WEB-INF/include/doughnutChart.jsp" %>
</body>
</html>
