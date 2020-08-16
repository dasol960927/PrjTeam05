<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>

//null 체크
function nullCheck(string) {
   var checkValue;
   if(string == ""){
      checkValue = '추가예정';
   }else{
      checkValue = string;
   }
   return checkValue;
}

//제목 자르기
function title(string) {
   var str = string.split('^');
   
   return str;
}

$(function(){
	
	var filmId = $(".filmId");
	var filmSeq = $(".filmSeq");
	
	for (var i = 0; i < filmId.length; i++) {
	var seq = $(filmSeq[i]).val();
	var url = 'http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=14RGX39B77HG1YYJ5L70&'+
    '&movieId=' + $(filmId[i]).val() + 
    '&movieSeq=' + seq;
   var v1 = '';
   $.ajax({
      url : url,
      type : 'get',
      dataType : "json",
      success : function(data) {
         //console.log(data);
         var json = data.Data[0];
         //console.log(json);

         var list;
         var exit= false;
         var html  = '';
            $.each(json, function(index, item) {
               list = json.Result;
               console.log(json.Result);
                              
               $.each(list, function(index, item) {
                  var tit = title(item.titleEtc); //제목 문자열 자르기

                    html += tit[0];
          
                     exit = true; //이중 ajax 빠져나오기
                 });
                 if(exit){ return false;} //이중 ajax 빠져나오기
            });
            
            alert(html);
            
            $(".here").html(html);
         
      },
      error : function(xhr) {
         alert(xhr.status + '' + xhr.textStatus);
        }
   });
   
	}
	
});

</script>
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
				
                <h3 class="profile-username text-center">${ memberVo.mName }</h3>

                <p class="text-muted text-center">${memberVo.mBdate} (${memberVo.mGender}), ${memberVo.mPhone}</p>

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
      	<div>		
              <div class="card-body">
              	<h1>${memberVo.mName }님의 구매내역</h1>
                <table id="example2" class="table table-bordered table-hover">
                  <thead>
                  <tr>
                    <th>구매일자</th>
                    <th>영화제목</th>
                    <th>금액</th>
                  </tr>
                  </thead>
                  <tbody>
					<c:forEach var="purVo" items="${purList}">
						<tr>				
							<td>${ purVo.pDate }</td>
							<td class="here"></td>
							<td>${ purVo.filmId }${ purVo.filmSeq }</td>
							<td>${ purVo.comVal }</td>
							<input type="hidden" class="filmId" value="${ purVo.filmId }" />				
							<input type="hidden" class="filmSeq" value="${ purVo.filmSeq }" />				
						</tr>
					</c:forEach>
                  </tbody>
                  <tfoot>
                  <tr>
                    <th colspan="3" style="text-align:right;"><a href="/test?mId=${memberVo.mId}">돌아가기</a></th>
                  </tr>
                  </tfoot>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
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
