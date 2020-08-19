<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>FilmCritics | Board</title>
   <%@ include file="/WEB-INF/include/admin.jsp" %>

  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css"/> 
  <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
  
  <script>
   jQuery(document).ready(function($) {
	   $.noConflict();
       $('#myTable').dataTable( {
         
       } );
   } );

</script>
<style>
#product-desc{ width:750px; }
</style>
</head>
<body class="hold-transition sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">
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
               <table id="myTable"  border="1px solid black;" width="100%;" height="100%">
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
              <!-- /.card-body -->
            
            <!-- //////////////////////// -->  
				
              </div>
            </div>
          </div>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->

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
