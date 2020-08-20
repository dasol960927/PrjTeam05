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
  <%@ include file="/WEB-INF/include/admin.jsp" %>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
 
     <%@ include file="/WEB-INF/include/ProfileCommon.jsp" %>
      	<div>		
              <div class="card-body">
              	<h1>${memberVo.mName }님의 충전내역</h1>
                <table id="example2" class="table table-bordered table-hover">
                  <thead>
                  <tr>
                    <th>날짜</th>
                    <th>충전금액</th>
                    <th>결제수단</th>
                  </tr>
                  </thead>
                  <tbody>
					<c:forEach var="dpsVo" items="${dpsList}">
						<tr>				
							<td>${ dpsVo.dDate }</td>
							<td>${ dpsVo.dPay }</td>
							<td>${ dpsVo.dComVal }</td>				
						</tr>
					</c:forEach>
                  </tbody>
                  <tfoot>
                  <tr>
                    <th colspan="3" style="text-align:right;"><a href="/DPS/Deposit1?mId=${mId}">충전하기</a></th>
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
