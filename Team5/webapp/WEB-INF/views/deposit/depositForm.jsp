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
   
<script>
   $(function(){
      $('#dPay').on('keyup', function(){
         var dPay = $('#dPay').val();
         var checkVal = "0123456789";

         for(var i = 0; i < dPay.length; i++){
            var str = dPay.substring(i, i+1);
            
            if(checkVal.indexOf(str) == -1 ){
               alert('숫자만 입력가능합니다');
               $('#dPay').val('');
               return;
            }
         }
         
      })
      
      $('#btnDeposit').on('click', function(){
         var dPay = Number($("#dPay").val());
         var dPayVal = $('input:radio[name="dComId"]:checked').val();
         if(dPay <= 0 || dPay >= 10000000){
            alert('정확한 금액을 입력하세요');
            $('#dPay').val('');
         }else{
            $(location).attr("href", "/DPS/Deposit2?mId=${mId}&dComId=" + dPayVal + "&dPay=" + dPay + "");
         }
         
      })
   })
</script>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
 
      <%@ include file="/WEB-INF/include/ProfileCommon.jsp" %>
               <div>      
              <div class="card-body">
                 <h1>${memberVo.mName }님의 충전하기</h1>
            <%-- <form action="/DPS/Deposit2?mId=${mId}" method="POST"> --%>
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
                  <input type="text" name="dPay" id = "dPay" placeholder="1000만원 미만 금액을 입력하세요" size="30"/>
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
               <input type="button" id = "btnDeposit" value="확인" />
               </th>
                  </tr>
                  </tfoot>
                </table>
            <!-- </form> -->
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