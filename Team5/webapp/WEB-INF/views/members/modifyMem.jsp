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
<script>
	$(function(){
		$("#btnDel").on('click', function(){
			if(confirm("정말 탈퇴하시겠습니까 ?") == true){
				$(location).attr("href", "/delete?mId=${login.mId }");
		        alert("탈퇴되었습니다");
		    }
		    else{
		        return ;
		    }

		})
		
		
	});
</script>

<body class="hold-transition sidebar-mini">
<div class="wrapper">
 
       	  <%@ include file="/WEB-INF/include/ProfileCommon.jsp" %>		
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
			  <input type="text" class="form-control" name="mNickName" value="${ memberVo.mNickName}" readonly/>
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
				
				<!-- <input type="button" class="btn btn-primary btn-block" id = "btnDel" onclick="javascript:location.href='./delete'" value="탈퇴"/> -->
				<input type="button" class="btn btn-primary btn-block" id = "btnDel" value="탈퇴"/>
				
			  </div>
			  <!-- /.col -->
			</div>
		</form>    
		  						
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  <!-- /.content-wrapper -->
   <%@ include file="/WEB-INF/include/footer.jsp" %>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
</body>
</html>
