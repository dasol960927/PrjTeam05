<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>FilmCritics | FindId</title>
  <%@ include file="/WEB-INF/include/admin.jsp" %>
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="/"><b>Film Critics</b></a>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">아이디를 잊으셨나요? <br/>이름과 전화번호를 입력해주세요</p>

      <form action="/find_Id" method="post">
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="이름" id="mName" name="mName" required>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
          </div>
          <div class="input-group mb-3">
		  <input type="text" class="form-control" placeholder="010-1234-5678" id="mPhone" name="mPhone" required>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lg fa-phone"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-12">
           <button id="submit" class="btn btn-primary btn-block">아이디 찾기</button>
          </div>
          <!-- /.col -->
        </div>
      </form>
      <p class="mt-3 mb-1">
        <a href="/login">로그인</a>
      </p>
      <p class="mb-0">
        <a href="/registerForm" class="text-center">회원가입</a>
      </p>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

</body>
</html>
