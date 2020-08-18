<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>FlimCritics | DepositTable</title>
<style>

table, th, td {
	border:1px solid black;
	border-collapse: collapse;	
}

table { width:800px; margin:0 auto; }

</style>  
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
                    <b>찜한 영화</b> <p class="float-right" >&nbsp;&nbsp;&nbsp;편</p><a class="float-right" href="#">${memberVo.cntl}</a> 
                  </li>
                  <li class="list-group-item">
                  	<br/>
                    <b>잔여캐시</b> <p class="float-right" >&nbsp;&nbsp;&nbsp;원</p><a class="float-right" >${memberVo.mCash}</a> 
                  </li>
                  <li class="list-group-item">
                  	<br/>
                    <b>구매내역</b> <p class="float-right" >&nbsp;&nbsp;&nbsp;건</p><a class="float-right" href="/PUR/List?mId=${memberVo.mId}">${memberVo.cntp}</a>
                  </li>
                  <li class="list-group-item">
                  	<br/>
                    <b>충전내역</b> <a class="float-right" href="/DPS/Deposit1?mId=${memberVo.mId}">충전하기</a> <p class="float-right">&nbsp;&nbsp;건&nbsp;&nbsp;</p> <a class="float-right" href="/DPS/List?mId=${memberVo.mId}">${memberVo.cntd}</a>  
                  </li>
                </ul>
				<br/>
                <a href="/updateForm?mId=${ login.mId }" class="btn btn-primary btn-block"><b>회원정보 수정</b></a>
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
      			
		      	<div>		
              <div class="card-body">
              	<h1>${memberVo.mName }님의 충전하기</h1>
				<form action="/DPS/Deposit2?mId=${mId}" method="POST">
                <table id="example2" class="table table-bordered table-hover">
                  <thead>
                  <tr>
                    <th>결제금액</th>
                    <th>결제방식</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
					<td>
						<input type="text" name="dPay" placeholder="1000만원 미만 금액을 입력하세요" size="30"/>
					</td>
					<td>
						<input type="radio" name="dComId" value="COM001" id="card"    checked/><label for="card">카드</label>
						<input type="radio" name="dComId" value="COM002" id="kakaopay" /><label for="kakaopay">카카오페이</label>
						<input type="radio" name="dComId" value="COM003" id="bank"     /><label for="bank">무통장입금</label>		
					</td>
					</tr>
                  </tbody>
                  <tfoot>
                  <tr>
                    <th colspan="2" style="text-align:right;">
					<input type="submit" value="확인" />
					</th>
                  </tr>
                  </tfoot>
                </table>
				</form>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
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
