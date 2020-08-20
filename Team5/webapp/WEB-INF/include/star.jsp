<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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