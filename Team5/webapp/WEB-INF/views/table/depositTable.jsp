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
              <a href="/">Home</a>
                <div class="text-center">
                  <img class="profile-user-img img-fluid img-circle"
                       src="/img/User.jpg"
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
      			
      			
      			
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->

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
