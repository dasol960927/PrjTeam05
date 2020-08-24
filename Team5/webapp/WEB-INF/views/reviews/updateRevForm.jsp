<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style>
#beforeVal{
	font-size:30px;
	font-weight:bold;
}
#val{
	font-size:30px;
	font-weight:bold;
}
.starR1{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}
.starRev{width:170px; height:50px;}
</style>

<script>

	
	function submitClick(){
		var mId = $("#mId").val();
		var revIdx = $("#revIdx").val();
		var revTitle = $("#revTitle").val();		
		var revConts = $("#revConts").val();
		
		// 글자 이쁘게 하고 싶으면 이거 지워 : 대신 DB에 태그 다 들어감
 		revConts = revConts.replace(/<br\/>/ig, "\n");
		revConts = revConts.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, ""); 
		
		//var filmId = $("#filmId").val();
		//var filmSeq = $("#filmSeq").val();
		//var filmYear = $("#filmYear").val();
		
		//opener.document.location.href='/REVIEW/insertGrd?mId=' + mId + '&docId=' + docId + '&grdScore=' + grdScore + '&grdConts='
		//			+ grdConts + '&filmId=' + filmId + '&filmSeq=' + filmSeq + '&filmYear=' + filmYear;
		opener.document.location.href='/REVIEW/updateRev?mId=' + mId + '&revIdx=' + revIdx + '&revTitle=' + revTitle + '&revConts='
				+ revConts;		
		window.close();
	}
	
	function cancelClick(){
		//opener.document.location.href='/filmReview1';
		opener.document.location.reload();
		window.close();
	}

</script>
</head>



<body class="hold-transition sidebar-mini">

			<input type="text" id="revTitle" name="revTitle" class="form-control" value="${revVo.revTitle}"  />
			 					
			<input type="hidden" id="mId" value="${revVo.mId}"/>			
			<input type="hidden" id="revIdx" value="${revVo.revIdx}"/>
			
											

		
		<%@ include file="/WEB-INF/include/admin.jsp" %>
<div class="wrapper">
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-12">
          <div class="card card-outline card-info">
            <div class="card-header">
              <h3 class="card-title">
                	리뷰를 작성해주세요
              </h3>
              <!-- tools box -->
              <div class="card-tools">
                <button type="button" class="btn btn-tool btn-sm" data-card-widget="collapse" data-toggle="tooltip"
                        title="Collapse">
                  <i class="fas fa-minus"></i></button>
              </div>
              <!-- /. tools -->
            </div>
            <!-- /.card-header -->
            <div class="card-body pad">
              <div class="mb-3">
                <textarea id="revConts" name="revConts" class="textarea" placeholder="감상평을 남겨주세요.영화와 상관없는 내용은 약관에 의해 제재를 받을 수 있습니다"
                          style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">${revVo.revConts}</textarea>
              </div>
            </div>
          </div>
        </div>
        <!-- /.col-->
      </div>
      <!-- ./row -->
		<input type="button" name="btnSubmit" value="확인" class="btn btn-info" onclick="submitClick()"/>		
    	<input type="button" name="btnCancel" value="취소" class="btn btn-default float-right" onclick="cancelClick()" />
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <%@ include file="/WEB-INF/include/footer.jsp" %>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
		
		
<script>
  $(function () {
    // Summernote
    $('.textarea').summernote()
  })
</script>		
</body>
</html>