<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>FilmCritics | Registration Page</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$(function(){
	
	//아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$('#mIdChk').on('click', function(){
		var mIdVal = $('#mId').val();
		alert(mIdVal);
		$.ajax({
			url : '/mIdCheck',
			type: 'get',
			data: {'mId' : mIdVal},
			datatype: 'json',
			success : function(data) {
				alert(data);	
				console.log(data);
				if (data == 1) {
						$('#mIdResult').text('중복된 아이디 입니다');
						$('#mIdResult').css('color', 'red');
						$('#mIdResult').css('font-weight', 'bold');
					} 
					 else if(mIdVal == ''){
							$('#mIdResult').text('아이디를 입력해주세요');
							$('#mIdResult').css('color', 'green');
							$('#mIdResult').css('font-weight', 'bold');
						
					} else {
						$('#mIdResult').text('가능한 아이디입니다');
						$('#mIdResult').css('color', 'blue');
						$('#mIdResult').css('font-weight', 'bold');
					}
				}, error : function() {
						console.log('실패');
				}
			});
		});
			
	});
</script>
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <a href="/"><b>FilmCritics SignUp</b></a>
  </div>

  <div class="card">
    <div class="card-body register-card-body">
      <p class="login-box-msg">회원가입</p>

      <form action="/registerMember" method="post">
        <div class="input-group mb-3">
          <input type="text" class="form-control" name="mName" id="mName" placeholder="이름" required>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="email" class="form-control" name="mId" id="mId" placeholder="FilmCritics@gmail.com">
          <button id="mIdChk" class="badge badge-success">중복확인</button>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
              <div id="mIdResult">결과</div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" name="mPass" id="mPass" placeholder="비밀번호" required>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" name="mPassRe" id="mPassRe" placeholder="비밀번호 재확인" required>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="text" class="form-control" name="mNickName" id="mNickName" placeholder="닉네임" required>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="text" class="form-control" name="mPhone" id="mPhone" placeholder="ex)010-1111-2222" required>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lg fa-phone"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <div class="form-control">
          <input type="radio"  id="Male" name="mGender" value="남자"><label for="Male">&nbsp;남자</label>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="radio"  id="Female" name="mGender" value="여자"><label for="Female">&nbsp;여자</label>
          </div>
            <div class="input-group-append">
            <div class="input-group-text">
             <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="text" class="form-control" name="mBdate" id="mBdate" placeholder="ex)19901231" required>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="agreeTerms" name="terms" value="agree">
              <label for="agreeTerms">
               <a href="#">약관</a>에 동의합니다
              </label>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-4">
            <input type="submit" class="btn btn-primary btn-block" value="회원가입 "/>
          </div>
          <!-- /.col -->
        </div>
      </form>

      <div class="social-auth-links text-center">
        <p>--------------------- OR ---------------------</p>
        <a href="#" class="btn btn-block btn-primary">
          <i class="fab fa-facebook mr-2"></i>
          Facebook으로 시작하기
        </a>
        <a href="#" class="btn btn-block btn-danger">
          <i class="fab fa-google-plus mr-2"></i>
          Google로 시작하기
        </a>
      </div>

      <a href="/login" class="text-center">이미 회원이신가요?</a>
    </div>
    <!-- /.form-box -->
  </div><!-- /.card -->
</div>
<!-- /.register-box -->

<!-- jQuery -->
<script src="/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/dist/js/adminlte.min.js"></script>
</body>
</html>
