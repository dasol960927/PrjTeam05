<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>FlimCritics | Likelist</title>
   <%@ include file="/WEB-INF/include/admin.jsp" %>
   <style>
      .category{width:100%; height:100%; clear:both;}
      .likelist{float:left;}
      .ha{float:left;}
   </style>
   
</head>
<body class="hold-transition sidebar-mini">
<input type = "hidden" id = "mId" value = "${login.mId }"/>
<!-- Site wrapper -->
<div class="wrapper">

    <!-- SEARCH FORM -->
    <form class="form-inline ml-3" method="POST" action="/FilmSearch">
      <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" type="search" placeholder="영화작품 제목을 검색해보세요."  size="50"  aria-label="Search" id="keyword" name="keyword">
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
            <h1>찜한 영화</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/">Home</a></li>
              <li class="breadcrumb-item active">LikeList</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>


    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">찜한목록</h3>

          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fas fa-minus"></i></button>
          </div>
        </div>
        <div>
                   <div class="category" >
            <c:forEach var="likeVo" items="${likeList}">
               <div id =${likeVo.docId} style="float:left;"></div>
               <script>
                  var str = '${likeVo.docId}';
                  film(str);
   
                  //포스터, 스틸컷 url
                  function poster(string) {
                     var str = string.split('|');
                     return str;
                  }
                  //제목 자르기
                  function title(string) {
                     var str = string.split('^');
                     return str;
                  }
                           
                  function film(string) {
                     var FilmId = "" + string; //강제로 string 형으로 바꾸기
                     var FilmSeq = "" + string; 
                     var sFilmId = FilmId.substr(0,1); //K22321 로 받아와서 첫번째 글자만 자르기
                     var sFilmSeq = FilmSeq.substr(1,5);
                                 
                     $(function(){
                        var mId = $("#mId").val();
                        var url = 'http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=14RGX39B77HG1YYJ5L70';
                        $.ajax({
                           url : url,
                           type : 'get',
                           dataType : "json",
                           async: false,
                           data : {movieId : sFilmId, movieSeq : sFilmSeq},
                           success : function(data) {
                              //console.log(data);
                                       
                              var json = data.Data[0].Result[0];
                              //console.log(json);
                              var html = '';
   
                                 //제목 문자열 자르기
                              var titleName = ""+data.Data[0].Result[0].titleEtc;
                              var tit = title(titleName); 
                                       
                                 //포스터
                              var posterVal = '';
                              var posterImage = ""+data.Data[0].Result[0].posters;
                              var pos = poster(posterImage); //포스터 문자열 자르기
                              if(pos == ''){
                                 posterVal = '<a href="/filmReview?docId=' + data.Data[0].Result[0].DOCID + 
                                 '&filmId=' + data.Data[0].Result[0].movieId + 
                                 '&filmSeq=' + data.Data[0].Result[0].movieSeq + 
                                 '&filmYear=' + data.Data[0].Result[0].prodYear + 
                                 '&genre='+ data.Data[0].Result[0].genre + 
                                 '&mId=' + mId + '"><img src="/img/PosterReady.jpg" alt="포스터 준비중"/></a>';
                              }else{
                                 posterVal = '<a href="/filmReview?docId=' + data.Data[0].Result[0].DOCID + 
                                 '&filmId=' + data.Data[0].Result[0].movieId + 
                                 '&filmSeq=' + data.Data[0].Result[0].movieSeq + 
                                 '&filmYear=' + data.Data[0].Result[0].prodYear + 
                                 '&genre='+ data.Data[0].Result[0].genre + 
                                 '&mId=' + mId + '"><img src="' + pos[0] + '"  /></a>';
                              }
                                                
                              html += '<div class="likelist">';
                              html += posterVal + '<br>';
                              html += '<p>' + tit[0] + '</p>';
                              html += '</div>';
                                       
                              $('#'+string).html(html);
                           },
                              error : function(xhr) {
                              alert(xhr.status + '' + xhr.textStatus);
                           }
                        });
                     });
                  }
               </script>
            </c:forEach> 
         </div> 
         </div>
        <div class="card-body p-0">

		    <div>
    <div class="category">
    <c:forEach var="likeVo" items="${likeGenreList}">
    ${likeVo.genre} 영화
    	<div class="likelist" style="clear:both;">
    	<div id = ${likeVo.genre} style=" float:left;"></div>
    	</div>
   
    	<script>
    	var genreVal = '${likeVo.genre}';
    	getGenre(genreVal);
    	
    	function getGenre(genreVal) {
		$(function(){
			var mId = $("#mId").val();
			var url = 'http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=14RGX39B77HG1YYJ5L70&' + 
			     	  'genre=' + genreVal + '&listCount=5&sort=prodYear,1&createDts=2019';
			$.ajax({
				url : url,
				type : 'get',
				dataType : "json",
				success : function(data) {
					//console.log(data);
					
					var js = data.Data[0].Result;
	
					var html = '';
					$.each(js, function(index, item) {				
						var posterVal = '';
						var pos = poster(item.posters); //포스터 문자열 자르기
						if(pos == ''){
							posterVal = '<a href="/filmReview?docId=' + item.DOCID + 
								'&filmId=' + item.movieId + 
								'&filmSeq=' + item.movieSeq + 
								'&filmYear=' + item.prodYear +
								'&genre=' +  + genreVal + 
								'&mId=' + mId + '"><img src="/img/PosterReady.jpg" alt="포스터 준비중"/></a>';
						}else{
							posterVal = '<a href="/filmReview?docId=' + item.DOCID + 
							'&filmId=' + item.movieId + 
							'&filmSeq=' + item.movieSeq + 
							'&filmYear=' + item.prodYear + 
							'&genre=' + genreVal + 
							'&mId=' + mId + '"><img src="' + pos[0] + '"/></a>';
						}
						html += '<div class="ha">'
						html += posterVal + '<br>';
			            html += '<b>' + item.title + '</b>';
			  			html += '</div>'
					});
					$('#'+genreVal).html(html);
				},
				error : function(xhr) {
					alert(xhr.status + '' + xhr.textStatus);
			  	}
			});
		});
    }
</script>
    </c:forEach>
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



