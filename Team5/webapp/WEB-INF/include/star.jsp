<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<style>
.starR1 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat -52px 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR2 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR1.on {
	background-position: 0 0;
}

.starR2.on {
	background-position: -15px 0;
}
.starRev{width:170px; height:50px;}
</style>

	<c:choose>
		<c:when test="${revVo.grdScore eq 0.5}">
			  <div class="starRev" style="width:auto;">
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
				  <span id="val" style="font-weight:bold; font-size:20px;" value="${revVo.grdScore}">${revVo.grdScore}</span>				  
			</div>			
		</c:when>
		<c:when test="${revVo.grdScore eq 1.0}">
			  <div class="starRev" style="width:auto;">
				  <span class="starR1 on">별1</span>
				  <span class="starR2 on">별2</span>
				  <span class="starR1">별3</span>
				  <span class="starR2">별4</span>
				  <span class="starR1">별5</span>
				  <span class="starR2">별6</span>
				  <span class="starR1">별7</span>
				  <span class="starR2">별8</span>
				  <span class="starR1">별9</span>
				  <span class="starR2">별10</span>
				  <span id="val" style="font-weight:bold; font-size:20px;" value="${revVo.grdScore}">${revVo.grdScore}</span>				  
			</div>			
		</c:when>
		<c:when test="${revVo.grdScore eq 1.5}">
			  <div class="starRev" style="width:auto;">
				  <span class="starR1 on">별1</span>
				  <span class="starR2 on">별2</span>
				  <span class="starR1 on">별3</span>
				  <span class="starR2">별4</span>
				  <span class="starR1">별5</span>
				  <span class="starR2">별6</span>
				  <span class="starR1">별7</span>
				  <span class="starR2">별8</span>
				  <span class="starR1">별9</span>
				  <span class="starR2">별10</span>
<<<<<<< HEAD
				  <span id="val" style="font-weight:bold; font-size:20px; "value="${revVo.grdScore}" >${revVo.grdScore}</span>				  
=======
				  <span id="val" style="font-weight:bold; font-size:20px;" value="${revVo.grdScore}">${revVo.grdScore}</span>				  
>>>>>>> branch 'master' of https://github.com/dasol960927/PrjTeam05
			</div>			
		</c:when>
		<c:when test="${revVo.grdScore eq 2.0}">
			  <div class="starRev" style="width:auto;">
				  <span class="starR1 on">별1</span>
				  <span class="starR2 on">별2</span>
				  <span class="starR1 on">별3</span>
				  <span class="starR2 on">별4</span>
				  <span class="starR1">별5</span>
				  <span class="starR2">별6</span>
				  <span class="starR1">별7</span>
				  <span class="starR2">별8</span>
				  <span class="starR1">별9</span>
				  <span class="starR2">별10</span>
				  <span id="val" style="font-weight:bold; font-size:20px;" value="${revVo.grdScore}">${revVo.grdScore}</span>				  
			</div>			
		</c:when>
		<c:when test="${revVo.grdScore eq 2.5}">
			  <div class="starRev" style="width:auto;">
				  <span class="starR1 on">별1</span>
				  <span class="starR2 on">별2</span>
				  <span class="starR1 on">별3</span>
				  <span class="starR2 on">별4</span>
				  <span class="starR1 on">별5</span>
				  <span class="starR2">별6</span>
				  <span class="starR1">별7</span>
				  <span class="starR2">별8</span>
				  <span class="starR1">별9</span>
				  <span class="starR2">별10</span>
				  <span id="val" style="font-weight:bold; font-size:20px;" value="${revVo.grdScore}">${revVo.grdScore}</span>				  
			</div>			
		</c:when>
		<c:when test="${revVo.grdScore eq 3.0}">
			  <div class="starRev" style="width:auto;">
				  <span class="starR1 on">별1</span>
				  <span class="starR2 on">별2</span>
				  <span class="starR1 on">별3</span>
				  <span class="starR2 on">별4</span>
				  <span class="starR1 on">별5</span>
				  <span class="starR2 on">별6</span>
				  <span class="starR1">별7</span>
				  <span class="starR2">별8</span>
				  <span class="starR1">별9</span>
				  <span class="starR2">별10</span>
				  <span id="val" style="font-weight:bold; font-size:20px;" value="${revVo.grdScore}">${revVo.grdScore}</span>				  
			</div>			
		</c:when>
		<c:when test="${revVo.grdScore eq 3.5}">
			  <div class="starRev" style="width:auto;">
				  <span class="starR1 on">별1</span>
				  <span class="starR2 on">별2</span>
				  <span class="starR1 on">별3</span>
				  <span class="starR2 on">별4</span>
				  <span class="starR1 on">별5</span>
				  <span class="starR2 on">별6</span>
				  <span class="starR1 on">별7</span>
				  <span class="starR2">별8</span>
				  <span class="starR1">별9</span>
				  <span class="starR2">별10</span>
				  <span id="val" style="font-weight:bold; font-size:20px;" value="${revVo.grdScore}">${revVo.grdScore}</span>				  
			</div>			
		</c:when>
		<c:when test="${revVo.grdScore eq 4.0}">
			  <div class="starRev" style="width:auto;">
				  <span class="starR1 on">별1</span>
				  <span class="starR2 on">별2</span>
				  <span class="starR1 on">별3</span>
				  <span class="starR2 on">별4</span>
				  <span class="starR1 on">별5</span>
				  <span class="starR2 on">별6</span>
				  <span class="starR1 on">별7</span>
				  <span class="starR2 on">별8</span>
				  <span class="starR1">별9</span>
				  <span class="starR2">별10</span>
				  <span id="val" style="font-weight:bold; font-size:20px;" value="${revVo.grdScore}">${revVo.grdScore}</span>				  
			</div>			
		</c:when>
		<c:when test="${revVo.grdScore eq 4.5}">
			  <div class="starRev" style="width:auto;">
				  <span class="starR1 on">별1</span>
				  <span class="starR2 on">별2</span>
				  <span class="starR1 on">별3</span>
				  <span class="starR2 on">별4</span>
				  <span class="starR1 on">별5</span>
				  <span class="starR2 on">별6</span>
				  <span class="starR1 on">별7</span>
				  <span class="starR2 on">별8</span>
				  <span class="starR1 on">별9</span>
				  <span class="starR2">별10</span>
				  <span id="val" style="font-weight:bold; font-size:20px;" value="${revVo.grdScore}">${revVo.grdScore}</span>				  
			</div>			
		</c:when>
		<c:when test="${revVo.grdScore eq 5.0}">
			  <div class="starRev" style="width:auto;">
				  <span class="starR1 on">별1</span>
				  <span class="starR2 on">별2</span>
				  <span class="starR1 on">별3</span>
				  <span class="starR2 on">별4</span>
				  <span class="starR1 on">별5</span>
				  <span class="starR2 on">별6</span>
				  <span class="starR1 on">별7</span>
				  <span class="starR2 on">별8</span>
				  <span class="starR1 on">별9</span>
				  <span class="starR2 on">별10</span>
				  <span id="val" style="font-weight:bold; font-size:20px;" value="${revVo.grdScore}">${revVo.grdScore}</span>				  
			</div>			
		</c:when>
		<c:otherwise>
			  <div class="starRev" style="width:auto;">
				  <span class="starR1">별1</span>
				  <span class="starR2">별2</span>
				  <span class="starR1">별3</span>
				  <span class="starR2">별4</span>
				  <span class="starR1">별5</span>
				  <span class="starR2">별6</span>
				  <span class="starR1">별7</span>
				  <span class="starR2">별8</span>
				  <span class="starR1">별9</span>
				  <span class="starR2">별10</span>
				  <span id="val" style="font-weight:bold; font-size:20px;" value="${revVo.grdScore}">${revVo.grdScore}</span>				  
			</div>			
		</c:otherwise>																
	</c:choose>		
				