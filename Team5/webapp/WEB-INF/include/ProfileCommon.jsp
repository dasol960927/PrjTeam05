<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        

<style>    
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
  vertical-align:middle;
}

/* Hide default HTML checkbox */
.switch input {display:none;}

/* The slider */
.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;	
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);  
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;  
}

.slider.round:before {
  border-radius: 50%;
}

p {
	margin:0px;
	display:inline-block;
	font-size:15px;
	font-weight:bold;
}
</style>

   
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">

            <!-- Profile Image -->
            <div class="card card-primary card-outline">
              <div class="card-body box-profile">
              <a href="/">Home</a>
                <div class="text-center">
                  <img class="profile-user-img img-fluid img-circle"
                       src="/img/panda.jpg"
                       alt="User profile picture">    
                </div>
				
                <h3 class="profile-username text-center">${ memberVo.mName }&nbsp;&nbsp;&nbsp;님</h3>

                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                  	<br/>
                    <b>찜한 영화</b> <p class="float-right" >&nbsp;&nbsp;&nbsp;편</p><a class="float-right" href="/LIKE/List?mId=${memberVo.mId}">${memberVo.cntl}</a> 
                  </li>
                  <li class="list-group-item">
                  	<br/>
                    <b>잔여캐시</b> <p class="float-right" >&nbsp;&nbsp;&nbsp;원</p><a class="float-right" >${memberVo.mCash}</a> 
                  </li>
                  <li class="list-group-item">
                  	<br/>
                    <b>구매내역</b>
                    <%-- <a class="float-right" href="/PUR/purFilm?mId=${memberVo.mId}">구매하기</a> --%>
                    <p class="float-right" >&nbsp;건&nbsp;&nbsp;</p>
                    <a class="float-right" href="/PUR/List?mId=${memberVo.mId}">${memberVo.cntp}</a>
                  </li>
                  <li class="list-group-item">
                  	<br/>
                    <b>충전내역</b> 
                    <a class="float-right" href="/DPS/Deposit1?mId=${memberVo.mId}">충전하기</a> 
                    <p class="float-right">&nbsp;건&nbsp;&nbsp;</p> 
                    <a class="float-right" href="/DPS/List?mId=${memberVo.mId}">${memberVo.cntd}</a>  
                  </li>
                 <li class="list-group-item">
                  	<br/>
                    <b>내 한줄평</b> 
                    <a class="float-right" href="/REVIEW/MyGrdList?mId=${memberVo.mId}">보러가기</a>                      
                  </li>
                 <li class="list-group-item">
                  	<br/>
                    <b>내 리뷰</b> 
                    <a class="float-right" href="/REVIEW/MyRevList?mId=${memberVo.mId}">보러가기</a>                      
                  </li>
                 <li class="list-group-item">
                 
                  	<br/>
                    <b>내 한줄평/리뷰 공개</b> 
                <c:choose> 
                	<c:when test="${memberVo.openChk eq 'O'.charAt(0)}">                        
					<label class="switch float-right">
					  <input type="checkbox" id="openChk" checked="checked" class="float-right">
					  <span class="slider round float-right"></span>
					</label>
					<p class="onoff float-right" id="off" style="display:none;">&nbsp;&nbsp;&nbsp;비공개</p>
					<p class="onoff float-right" id="on" >&nbsp;&nbsp;&nbsp;공개</p>
					<input type="hidden" id="mId" value="${memberVo.mId}" />
					</c:when>
                	<c:otherwise>
                	<p class="onoff float-right" id="off" >&nbsp;&nbsp;&nbsp;비공개</p>
					<p class="onoff float-right" id="on" style="display:none;">&nbsp;&nbsp;&nbsp;공개</p>                        
					<label class="switch float-right">
					  <input type="checkbox" id="openChk" class="float-right">
					  <span class="slider round float-right"></span>
					</label>
					<input type="hidden" id="mId" value="${memberVo.mId}" />
					</c:otherwise>				
				</c:choose>					
					<script>
						
						var check = $("input[type='checkbox']");
						
						var mId = $('#mId').val();
						
						check.click(function(){
							$(".onoff").toggle();
							
							//alert(mId);
							
					         $.ajax({
					             url : '/openChkUpdate',
					             data : {
					                mId : mId
					             },
					             dataType : 'json',
					             type : 'get',
					             success : function(data){
					                alert("변경했습니다");					            	
					             },
					             error : function(xhr){
					                alert("error: " + xhr.status + "," + xhr.textStatus);
					             } 
					             
					          });							
							
						});
					</script>
					  			                  
                  </li>                                                                        
                </ul>
				<br/>
                <a href="/updateForm?mId=${ memberVo.mId }" class="btn btn-primary btn-block"><b>회원정보 수정</b></a>
                <br/>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

           <!-- About Me Box -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">About Me</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <strong><i class="fas fa-user mr-1"></i>닉네임</strong>
                <p class="text-muted">
                  ${memberVo.mNickName}
                </p>
                <hr>
                <strong><i class="fas fa-user mr-1"></i> 성별</strong>
                <p class="text-muted">${memberVo.mGender}</p>
                <hr>
                <strong><i class="fas fa-user mr-1"></i> 생년월일</strong>
                <p class="text-muted">
                  <span class="tag tag-info">${memberVo.mBdate}</span>
                </p>
                <hr>
                <strong><i class="fas fg-lg fa-phone mr-1"></i> 전화번호</strong>

                <p class="text-muted">${memberVo.mPhone}</p>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
      			
      			
