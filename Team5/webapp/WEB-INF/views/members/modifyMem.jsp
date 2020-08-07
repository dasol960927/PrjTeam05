<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>FlimCritics | DepositTable</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>

<body class="hold-transition sidebar-mini">
<div class="wrapper">
 
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">

            <!-- Profile Image -->
            <div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <div class="text-center">
                  <img class="profile-user-img img-fluid img-circle"
                       src="/dist/img/user4-128x128.jpg"
                       alt="User profile picture">
                </div>

                <h3 class="profile-username text-center">김상두</h3>

                <p class="text-muted text-center">Software Engineer</p>

                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>찜한 영화</b> <a class="float-right">1,322</a>
                  </li>
                  <li class="list-group-item">
                    <b>포인트</b> <a class="float-right">543</a>
                  </li>
                  <li class="list-group-item">
                    <b>충전방식</b> <a class="float-right">카카오페이</a>
                  </li>
                </ul>

                <a href="/DPS/List?mId=AAAA" class="btn btn-primary btn-block"><b>충전내역 및 충전</b></a>
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
                <strong><i class="fas fa-book mr-1"></i> Education</strong>

                <p class="text-muted">
                  B.S. in Computer Science from the University of Tennessee at Knoxville
                </p>

                <hr>

                <strong><i class="fas fa-map-marker-alt mr-1"></i> Location</strong>

                <p class="text-muted">Malibu, California</p>

                <hr>

                <strong><i class="fas fa-pencil-alt mr-1"></i> Skills</strong>

                <p class="text-muted">
                  <span class="tag tag-danger">UI Design</span>
                  <span class="tag tag-success">Coding</span>
                  <span class="tag tag-info">Javascript</span>
                  <span class="tag tag-warning">PHP</span>
                  <span class="tag tag-primary">Node.js</span>
                </p>

                <hr>

                <strong><i class="far fa-file-alt mr-1"></i> Notes</strong>

                <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fermentum enim neque.</p>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->          			
		<form action="/update" method="post">
			<div class="input-group mb-3">
			  <input type="email" class="form-control" name="mId" value="${ memberVo.mId}" readonly />
			  <div class="input-group-append">
				<div class="input-group-text">
				  <span class="fas fa-envelope"></span>
				</div>
			  </div>
			</div>
			<div class="input-group mb-3">
			  <input type="text" class="form-control" name="mPass" value="${ memberVo.mPass }" />
			  <div class="input-group-append">
				<div class="input-group-text">
				  <span class="fas fa-lock"></span>
				</div>
			  </div>
			</div>
			<div class="input-group mb-3">
			  <input type="text" class="form-control" name="mName" value="${ memberVo.mName }" readonly/>
			  <div class="input-group-append">
				<div class="input-group-text">
				  <span class="fas fa-user"></span>
				</div>
			  </div>
			</div>
			<div class="input-group mb-3">
			  <input type="text" class="form-control" name="mGender" value="${ memberVo.mGender }" readonly/>
			  <div class="input-group-append">
				<div class="input-group-text">
				  <span class="fas fa-user"></span>
				</div>
			  </div>
			</div>
				<div class="input-group mb-3">
			  <input type="text" class="form-control" name="mBdate" value="${ memberVo.mBdate }" readonly/>
			  <div class="input-group-append">
				<div class="input-group-text">
				  <span class="fas fa-user"></span>
				</div>
			  </div>
			</div>
			<div class="row">
			  <!-- /.col -->
			  <div class="col-4">
				<input type="submit" class="btn btn-primary btn-block" value="수정"/>
			  </div>
			  <!-- /.col -->
			</div>
		</form>      						
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 1.0.0
    </div>

		<div>고객센터(이용 및 결제 문의) cs@teamfive.co.kr • 051-629-5232 (유료) <br/>
		 제휴	및 대외 협력 contact@teamfive.com • 051-629-5232 (유료)</div>
		<div>주식회사 TeamFive | 대표 송지현 | 팀원 김상두 이재혁 박다솔 김주희 | 부산광역시 남구 용당동 부경대용당캠퍼스 공학 6관 | <br/>
		사업자등록번호 8282-2424 | 통신판매업 신고번호 제 2020-부산용당-2020호  <br/>
		대표번호 051-629-5233 <br/>
		 개인정보 처리 방침11</div>
		 
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/dist/js/demo.js"></script>
</body>
</html>
