<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>FlimCritics | Invoice Print</title>
   <%@ include file="/WEB-INF/include/admin.jsp" %>
</head>
<body>
<div class="wrapper">
  <!-- Main content -->
  <section class="invoice">
    <!-- title row -->
    <div class="row">
      <div class="col-12">
        <h2 class="page-header">
          <i class="fas fa-globe"></i> FlimCritics, Inc.
          <small class="float-right">날짜:${outDate}</small>
        </h2>
      </div>
      <!-- /.col -->
    </div>
    <!-- info row -->
    <div class="row invoice-info">
      <div class="col-sm-4 invoice-col">
        From
        <address>
          <strong>FlimCritics, Inc.</strong><br>
		  부산광역시 남구 용당동 부경대용당캠퍼스 공학 6관 <br>
		  연락처: (051)-629-5232<br>
		  Email: info@teamfive.com
        </address>
      </div>
      <!-- /.col -->
      <div class="col-sm-4 invoice-col">
        To
        <address>
		<strong>${memberVo.mName }</strong><br>
		연락처 : ${memberVo.mPhone }<br>
		Email: ${memberVo.mId }
        </address>
      </div>
      <!-- /.col -->

      <!-- /.col -->
    </div>
    <!-- /.row -->

    <!-- Table row -->
    <div class="row">
      <div class="col-12 table-responsive">
        <table class="table table-striped">
          <thead>
          <tr>
            <th>Qty</th>
            <th>Product</th>
            <th>Serial #</th>
            <th>Description</th>
            <th>Subtotal</th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td>1</td>
            <td>Call of Duty</td>
            <td>455-981-221</td>
            <td>El snort testosterone trophy driving gloves handsome</td>
            <td>$64.50</td>
          </tr>
          <tr>
            <td>1</td>
            <td>Need for Speed IV</td>
            <td>247-925-726</td>
            <td>Wes Anderson umami biodiesel</td>
            <td>$50.00</td>
          </tr>
          <tr>
            <td>1</td>
            <td>Monsters DVD</td>
            <td>735-845-642</td>
            <td>Terry Richardson helvetica tousled street art master</td>
            <td>$10.70</td>
          </tr>
          <tr>
            <td>1</td>
            <td>Grown Ups Blue Ray</td>
            <td>422-568-642</td>
            <td>Tousled lomo letterpress</td>
            <td>$25.99</td>
          </tr>
          </tbody>
        </table>
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->

    <div class="row">

      <!-- /.col -->
      <div class="col-6">
        <p class="lead">Amount Due 2/22/2014</p>

        <div class="table-responsive">
          <table class="table">
            <tr>
              <th style="width:50%">가격(&#8361;):</th>
              <td>${dPay*0.9}</td>
            </tr>
            <tr>
              <th>부가세 (10%)</th>
              <td>${dPay*0.1}</td>
            </tr>
            <tr>
              <th>합계(&#8361;):</th>
              <td>${dPay}</td>
            </tr>
          </table>
        </div>
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->
  </section>
  <!-- /.content -->
</div>
<!-- ./wrapper -->
<script type="text/javascript"> 
  window.addEventListener("load", window.print());
</script>
</body>
</html>
