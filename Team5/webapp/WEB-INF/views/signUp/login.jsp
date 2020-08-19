
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  			if(mId == ""){
  				alert("아이디를 입력하세요.");
  				$("#mId").focus();
  				return;
  			}
  			if(mPass == ""){
  				alert("비밀번호를 입력하세요.");
  				$("#mPass").focus();
  				return;
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
            <div class="icheck-primary">
              <input type="checkbox" id="remember">
              <label for="remember">
                	로그인 유지
              </label>
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
