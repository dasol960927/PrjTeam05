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

#btnAdd{

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

          <div class="row mt-4">
            <nav class="w-100">
              <div class="nav nav-tabs" id="product-tab" role="tablist">
                <a class="nav-item nav-link" id="product-desc-tab"  href="/filmReview?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmSeq}&mId=${login.mId}"  >영화설명</a>
                <a class="nav-item nav-link" id="product-comments-tab"  href="/REVIEW/grdList?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}" >리뷰</a>
                <a class="nav-item nav-link" id="product-rating-tab"  href="/REVIEW/revList?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}" style="background-color:#878787; color:#ECFFFF">평점</a>
              </div>
            </nav>
            <div class="tab-content p-3" id="nav-tabContent" >

             
                <table id="example2" class="table table-bordered table-hover">
                  <thead>
                  <tr>
                    <th width="10%">제목&nbsp;&nbsp;&nbsp;</th>
                    <th width="20%"> ${revVo.revTitle} </th>
                    <th width="30%"> 작성자 / 작성일 </th>
                    <th width="40%"> ${revVo.mId} / ${revVo.revDate} </th>     
                  </tr>
                  </thead>
                  <tbody>

                 <tr>             	   

                    <tr>             	   

              	   <td colspan="4" width="100%">

              	   		${revVo.revConts}              	                 	   
              	   </td>   
 				 </tr>
 				  				 
 				 <form action="/REVIEW/insRevLvl1?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}" method="post">	             
                 <tr>             	   
              	   <td colspan="5" >              	   		
              	   		댓글 : 총 ${oCnt}   <a href="#">새로고침(네이버영화에서는 img파일사용)</a>
              	   		              	   		
              	   		<input type="submit" id="btnAdd" value="답글 달기" />              	   			
						<input type="hidden" name="revIdx" value="${revIdx}" />
						<input type="hidden" name="revLvl" value="${revLvl}" />
						<input type="hidden" name="mId" value="${login.mId}" />            	   			  						            	   		              	   		              	                 	   	
              	   </td>   
 				 </tr>                 
                 <tr>
                   <td colspan="5">             	   
              	   	 <textarea id="revLvl1" name="revConts" cols="200" rows="2"
              	   	 style="resize:none" placeholder="댓글을 남겨주세요.영화와 상관없는 내용은 약관에 의해 제재를 받을 수 있습니다"></textarea>
              	   </td>
 				 </tr>
 				 </form>
 				  				 
 				 				   				 
 				 <c:forEach var="revVo1" items="${revList1}"> 				 
 		 							 	
	 				 <tr>
	 				 	<td colspan="1">${revVo1.mId}</td>
	 				 	<td colspan="3">${revVo1.revConts}</td>
	 				 	<td colspan="1">
	 				 	<%-- ${revVo1.symId}
	 				 	${revVo1.symGubun} --%>
	 				<c:choose>
	 				 	<c:when test="${revVo1.symGubun eq 'G'.charAt(0)}">
	 				 	<br />	 				 	
	 				 	<i class="fas fa-thumbs-up" id="good" style="color:green;"></i>:<a href="/REVIEW/insRev12Cnt?sGubun=G&revLvl=${revLvl}&lvl0Idx=${revIdx}&revIdx=${revVo1.revIdx}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}">${revVo1.goodCnt}</a>	 				 	
	 				 	<br />	 				 	
	 				 	<i class="fas fa-thumbs-up" id="bad" style="transform: scaleY(-1); color:gray;"></i>:<a href="/REVIEW/insRev12Cnt?sGubun=B&revLvl=${revLvl}&lvl0Idx=${revIdx}&revIdx=${revVo1.revIdx}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}">${revVo1.badCnt}</a>
	 				 	</c:when>
	 				 	<c:when test="${revVo1.symGubun eq 'B'.charAt(0)}">
	 				 	<br />
	 				 	<i class="fas fa-thumbs-up" id="good" style="color:gray;"></i>:<a href="/REVIEW/insRev12Cnt?sGubun=G&revLvl=${revLvl}&lvl0Idx=${revIdx}&revIdx=${revVo1.revIdx}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}">${revVo1.goodCnt}</a>
	 				 	<br />	 				 	
	 				 	<i class="fas fa-thumbs-up" id="bad" style="transform: scaleY(-1); color:green;"></i>:<a href="/REVIEW/insRev12Cnt?sGubun=B&revLvl=${revLvl}&lvl0Idx=${revIdx}&revIdx=${revVo1.revIdx}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}">${revVo1.badCnt}</a>
	 				 	</c:when>	 				 	
	 				 	<c:otherwise>	 				 	
	 				 	<br />	 				 	
	 				 	<i class="fas fa-thumbs-up" id="good" style="color:gray;"></i>:<a href="/REVIEW/insRev12Cnt?sGubun=G&revLvl=${revLvl}&lvl0Idx=${revIdx}&revIdx=${revVo1.revIdx}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}">${revVo1.goodCnt}</a>	 				 	
	 				 	<br />	 				 	
	 				 	<i class="fas fa-thumbs-up" id="bad" style="color:gray; transform: scaleY(-1);"></i>:<a href="/REVIEW/insRev12Cnt?sGubun=B&revLvl=${revLvl}&lvl0Idx=${revIdx}&revIdx=${revVo1.revIdx}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}">${revVo1.badCnt}</a>	 				 	
	 				 	</c:otherwise>
	 				</c:choose>
	 				 	</td> 				 	
	 				 </tr>
	 				
 				 
 				 <form action="/REVIEW/insRevLvl2?docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}" method="post"> 	
	                 <tr class="vo2 ${ revVo1.revIdx }" >
	                   <td colspan="4">             	   
	              	   	 <textarea id="revLvl2" name="revConts" cols="200" rows="2" style="resize:none" 
	              	   	 	placeholder="댓글을 남겨주세요.영화와 상관없는 내용은 약관에 의해 제재를 받을 수 있습니다"></textarea>
	              	   </td>
	              	   <td colspan="1">
	              	   		<input id="btnAdd" type="submit" name="revConts" value="답글 달기" />
	              	   		
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
			 				 	<td colspan="1">
			 				 	<span>
			 				 	<%-- ${revVo2.symId}
			 				 	${revVo2.symGubun} --%>
			 				 	<c:choose>
			 				 	<c:when test="${revVo2.symGubun eq 'G'.charAt(0)}">
			 				 	<i class="fas fa-thumbs-up" id="good" style="color:green;"></i>:<a href="/REVIEW/insRev12Cnt?sGubun=G&revLvl=${revLvl}&lvl0Idx=${revIdx}&revIdx=${revVo2.revIdx}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}">${revVo2.goodCnt}</a>
			 				 	<br />
			 				 	<i class="fas fa-thumbs-up" id="bad" style="transform: scaleY(-1); color:gray;"></i>:<a href="/REVIEW/insRev12Cnt?sGubun=B&revLvl=${revLvl}&lvl0Idx=${revIdx}&revIdx=${revVo2.revIdx}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}">${revVo2.badCnt}</a>
			 				 	</c:when>
			 				 	<c:when test="${revVo2.symGubun eq 'B'.charAt(0)}">
			 				 	<i class="fas fa-thumbs-up" id="good" style="color:gray;"></i>:<a href="/REVIEW/insRev12Cnt?sGubun=G&revLvl=${revLvl}&lvl0Idx=${revIdx}&revIdx=${revVo2.revIdx}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}">${revVo2.goodCnt}</a>
			 				 	<br />
			 				 	<i class="fas fa-thumbs-up" id="bad" style="transform: scaleY(-1); color:green;"></i>:<a href="/REVIEW/insRev12Cnt?sGubun=B&revLvl=${revLvl}&lvl0Idx=${revIdx}&revIdx=${revVo2.revIdx}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}">${revVo2.badCnt}</a>			 				 	
			 				 	</c:when>
			 				 	<c:otherwise>
			 				 	<i class="fas fa-thumbs-up" id="good" style="color:gray;"></i>:<a href="/REVIEW/insRev12Cnt?sGubun=G&revLvl=${revLvl}&lvl0Idx=${revIdx}&revIdx=${revVo2.revIdx}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}">${revVo2.goodCnt}</a>
			 				 	<br />
			 				 	<i class="fas fa-thumbs-up" id="bad" style="transform: scaleY(-1); color:gray;"></i>:<a href="/REVIEW/insRev12Cnt?sGubun=B&revLvl=${revLvl}&lvl0Idx=${revIdx}&revIdx=${revVo2.revIdx}&docId=${docId}&filmId=${filmId}&filmSeq=${filmSeq}&filmYear=${filmYear}&mId=${login.mId}">${revVo2.badCnt}</a>			 				 	
			 				 	</c:otherwise>
			 				 	</c:choose>			 				 	
			 				 	</span>
			 				 	</td>
		 				 	</tr>
		 				 	<c:set var="count" value="${count + 1}" />
		 				 				 					 	
		 				 	</c:when>		 				 	
		 			    </c:choose>   
											 			    
				 </c:forEach>
		 			<tr>
		 			
	 				 	<c:choose>					
							<c:when test="${count eq 0}">		 			
				 				<td colspan="5">
				 				<input type="button" id="btnToggle" value="답글작성" onclick="btnToggle('${ revVo1.revIdx }')"/>
				 				</td>
		 				 	</c:when>
		 				 	<c:otherwise>
				 				<td colspan="5">
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
                  </tbody>
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
