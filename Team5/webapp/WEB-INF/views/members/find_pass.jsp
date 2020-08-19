<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>FlimCritics | DepositTable</title>
  <%@ include file="/WEB-INF/include/admin.jsp" %>
</head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<body class="hold-transition sidebar-mini">
<div class="wrapper">
 
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">
	<div class="card">
        <div class="card-header">
          <h3 class="card-title">비밀번호 수정</h3>
          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fas fa-minus"></i></button>
          </div>
        </div>
        <div class="card-body">
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
			<input type="submit" class="btn btn-primary btn-block" value="수정"/>
		</form>    		  		
        </div>
        <!-- /.card-body -->
        <div class="card-footer">
          	<a href="/login">로그인</a><br/>
        </div>
        <!-- /.card-footer-->
      </div>
      <!-- /.card -->	
          </div>
          <!-- /.col -->          									
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
</body>
</html>
