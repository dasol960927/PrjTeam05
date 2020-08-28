<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>


<script>

	
	function submitClick(){
		var mId = $("#mId").val();
		var docId = $("#docId").val();
		var revTitle = $("#revTitle").val();		
		var revConts = $("#revConts").val();
		
		// 글자 이쁘게 하고 싶으면 이거 지워 : 대신 DB에 태그 다 들어감
		revConts = revConts.replace(/<br\/>/ig, "\n");
		revConts = revConts.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");		
		
		var filmId = $("#filmId").val();
		var filmSeq = $("#filmSeq").val();
		var filmYear = $("#filmYear").val();
		var genre = $("#genre").val();
		
		
						
		
		
		//opener.window.document.location.href="'/REVIEW/insertGrd?grdConts='+ grdConts '&grdScore='+grdScore'";
		opener.document.location.href='/REVIEW/insertRev?mId=' + mId + '&docId=' + docId + '&revTitle=' + revTitle + '&revConts='
					+ revConts + '&filmId=' + filmId + '&filmSeq=' + filmSeq + '&filmYear=' + filmYear +'&genre=' + genre;
		window.close();
	}
	
	function cancelClick(){
		//opener.document.location.href='/filmReview1';
		opener.document.location.reload();
		window.close();
	}

</script>
</head>
<%
   String mId = request.getParameter("mId");
   String docId = request.getParameter("docId");
   String filmId = request.getParameter("filmId");
   String filmSeq = request.getParameter("filmSeq");
   String filmYear = request.getParameter("filmYear");
   String genre = request.getParameter("genre");
%>



<body class="hold-transition sidebar-mini">


						
			<input type="text" id="revTitle" name="revTitle" class="form-control" placeholder="리뷰 제목을 입력하세요" />
						
			<input type="hidden" id="mId" value="<%=mId%>"/>
			<input type="hidden" id="docId" value="<%=docId%>"/>
			<input type="hidden" id="filmId" value="<%=filmId%>"/>
			<input type="hidden" id="filmSeq" value="<%=filmSeq%>"/>
			<input type="hidden" id="filmYear" value="<%=filmYear%>"/>
			<input type="hidden" id="genre" value="<%=genre%>"/>
											

		
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
                          style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
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