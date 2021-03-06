<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>FilmCritics | Login</title>
  <%@ include file="/WEB-INF/include/admin.jsp" %>

   <script type="text/javascript">
  
   $(document).ready(function(){
  		$("#btnLogin").click(function(){
  			var mId   = $("#mId").val();
  			var mPass = $("#mPass").val();
  			var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
  			
  			var ID = mId.indexOf("@");
  			
  			if(mId == ""){
  				
  				$("#loginCheck").text('아이디를 입력하세요.');
 				$("#loginCheck").css('color', 'red'); 	
 				$("#loginCheck").css('font-weight', 'bold'); 	
  				$("#mId").focus();
  				return false;
  			}
  			
  			if(ID < 7){
 				$("#loginCheck").text('아이디는 7자 이상으로 입력 가능 합니다.');
 				$("#loginCheck").css('color', 'red'); 	
 				$("#loginCheck").css('font-weight', 'bold'); 
 				$("#mId").focus();
 				return false;
 			}
  			
  			if(exptext.test(mId)==false){
  				//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
  				$("#loginCheck").text('이메일형식이 올바르지 않습니다.');
 				$("#loginCheck").css('color', 'red'); 	
 				$("#loginCheck").css('font-weight', 'bold'); 
  				$("#mId").focus();
  				return false;
  			}
 				
  			if(mPass == ""){
  				$("#loginCheck").text('비밀번호를 입력하세요.');
 				$("#loginCheck").css('color', 'red'); 	
 				$("#loginCheck").css('font-weight', 'bold'); 
  				$("#mPass").focus();
  				return;
  			}
  			
  		    if(mPass.length < 4 || mPass.length > 12){
           		$("#loginCheck").text('비밀번호는 4~12자 이내로 입력 가능 합니다');
				$("#loginCheck").css('color', 'red'); 	
				$("#loginCheck").css('font-weight', 'bold'); 
               $("#mPass").focus();
               return false;
            }
  			
  		});
  	});	
  
  </script>
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="/"><b>FilmCritics </b>Login</a>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">로그인</p>

       <form action="/loginCheck" method="post">
        <div class="input-group mb-3">
          <input type="email" class="form-control" name="mId" id="mId" placeholder="FilmCritics@gmail.com">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" name="mPass" id="mPass" placeholder="비밀번호">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-8">
            <div id="loginCheck" class="icheck-primary">
              <c:if test="${msg == false}">
		        <p style="color:#f00">로그인 실패</p>
		      </c:if>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-4">
            <input type="submit" class="btn btn-primary btn-block" id="btnLogin" onclick="loginCheck()" value="로그인"/>
          </div>
          <!-- /.col -->
        </div>
       
      </form>

      <div class="social-auth-links text-center mb-3">
        <p>--------------------- OR ---------------------</p>
        <a href="#" class="btn btn-block btn-primary">
          <i class="fab fa-facebook mr-2"></i> Facebook으로 시작하기
        </a>
        <a href="#" class="btn btn-block btn-danger">
          <i class="fab fa-google-plus mr-2"></i> Google로 시작하기
        </a>
      </div>
      <!-- /.social-auth-links -->

      <p class="mb-0">
        <a href="/registerForm" class="text-center">회원가입</a>
      </p>
      <p class="mb-0">
        <a href="/find_idForm" class="text-center">아이디/비밀번호 찾기</a>
      </p>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

</body>
</html>
