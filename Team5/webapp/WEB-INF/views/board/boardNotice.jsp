<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>FilmCritics | Board</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css"/> 
   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>

<script>
   jQuery(document).ready(function($) {
	   $.noConflict();
       $('#myTable').dataTable( {
         
       } );
   } );

</script>
  
</head>
<body class="hold-transition sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">

    <!-- SEARCH FORM -->
    <form class="form-inline ml-3">
      <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" type="search" placeholder="찾고 싶은 문의사항을 키워드를 검색하세요." size="50" aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-navbar" type="submit">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>



  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>고객센터</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/">Home</a></li>
              <li class="breadcrumb-item active"><a href="/reqBoardWriter">1:1 문의</a></li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card card-solid">
        <div class="card-body">
          <div class="row">
            <div class="col-12 col-sm-6">
            </div>
          </div>
          <div class="row mt-4">
            <nav class="w-100">
              <div class="nav nav-tabs" id="product-tab" role="tablist">
                <a href="/Board?gubun=N" class="nav-item nav-link" id="product-comments-tab">공지사항</a>
                <a href="/Board?gubun=F" class="nav-item nav-link" id="product-comments-tab">FAQ</a>
              </div>
            </nav>
            <div class="tab-content p-3" id="nav-tabContent">
              <div class="tab-pane fade show active" id="product-desc" role="tabpanel" aria-labelledby="product-desc-tab">
               <table id="myTable"  border="1px solid black;" width="50%;" height="60%">
                  <thead>                  
                    <tr>
                      <th style="width: 100px">작성자</th>
                      <th>제목</th>
                      <th>조회수</th>
                      <th style="width: 100px">작성일</th>
                    </tr>
                  </thead>
                  <tbody>
                <c:forEach var = "boardVo" items = "${ boardList }">
				<tr>
				<td>${ boardVo.mId }</td>
				<td>${ boardVo.bName }</td>
				<td>${ boardVo.bCnt }</td>
				<td>${ boardVo.bDate }</td>
				</tr>
				</c:forEach>
                  </tbody>
                </table>				
              </div>
              <div class="tab-pane fade" id="product-comments" role="tabpanel" aria-labelledby="product-comments-tab">

				<div>
				<table>
				
				<tr> 
				  <td>작성자</td> 
				  <td>제목</td> 
				  <td>조회수</td>  
				  <td>작성일</td> 
				</tr>
				
				<c:forEach var = "boardVo" items = "${ boardList }">
				<tr>
				<td>${ boardVo.mId }</td>
				<td>${ boardVo.bName }</td>
				<td>${ boardVo.bCnt }</td>
				<td>${ boardVo.bDate }</td>
				</tr>
				</c:forEach>
				
				</table>
				</div>
			  </div>
            </div>
          </div>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->

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
		 개인정보 처리 방침</div>
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
<!-- ChartJS -->
<script src="/plugins/chart.js/Chart.min.js"></script>
<!-- AdminLTE App -->
<script src="/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/dist/js/demo.js"></script>


</body>
</html>
