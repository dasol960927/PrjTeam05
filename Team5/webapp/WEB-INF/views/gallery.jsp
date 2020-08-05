<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>FlimCritics | Posters</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
  <!-- Ekko Lightbox -->
  <link rel="stylesheet" href="/plugins/ekko-lightbox/ekko-lightbox.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">


    <!-- SEARCH FORM -->
    <form class="form-inline ml-3">
      <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" type="search" placeholder="작품 제목, 배우, 감독을 검색해보세요." size="50" aria-label="Search">
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
            <h1>FlimCritics</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/">Home</a></li>
              <li class="breadcrumb-item active"><a href="/login">Login</a></li>
              <li class="breadcrumb-item active"><a href="/Board">고객센터</a></li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card card-primary">
              <div class="card-header">
                <div class="card-title">
                  	이 영화에 대한 평가가 궁금하신가요?
                </div>
              </div>
              <div class="card-body">
                <div>
                  <div class="btn-group w-100 mb-2">
                    <a class="btn btn-info active" href="javascript:void(0)" data-filter="all"> 전체영화 </a>
                    <a class="btn btn-info" href="javascript:void(0)" data-filter="1"> 한국  </a>
                    <a class="btn btn-info" href="javascript:void(0)" data-filter="2"> 미국 </a>
                    <a class="btn btn-info" href="javascript:void(0)" data-filter="3"> 일본 </a>
                    <a class="btn btn-info" href="javascript:void(0)" data-filter="4"> 중국 </a>
                  </div>
                  <div class="mb-2">
                    <a class="btn btn-secondary" href="javascript:void(0)" data-shuffle> Shuffle items </a>
                    <div class="float-right">
                      <select class="custom-select" style="width: auto;" data-sortOrder>
                        <option value="index"> Sort by Position </option>
                        <option value="sortData"> Sort by Custom Data </option>
                      </select>
                      <div class="btn-group">
                        <a class="btn btn-default" href="javascript:void(0)" data-sortAsc> 오름차순 </a>
                        <a class="btn btn-default" href="javascript:void(0)" data-sortDesc> 내림차순 </a>
                      </div>
                    </div>
                  </div>
                </div>
               
                <div>
                  <div class="filter-container p-0 row">
                    <div class="filtr-item col-sm-2" data-category="1" data-sort="white sample">
                      <a href="/filmReview">
                        <img src="https://ssl.pstatic.net/imgmovie/mdi/mit110/1516/151646_P01_144220.jpg"  class="img-fluid mb-2"  alt="poster"/>
                      </a>
                    </div>
                    <div class="filtr-item col-sm-2" data-category="2, 4" data-sort="black sample">
                      <a href="/filmReview">
                        <img src="https://ssl.pstatic.net/imgmovie/mdi/mit110/1495/149504_P22_100402.jpg" class="img-fluid mb-2" alt="poster"/>
                      </a>
                    </div>
                    <div class="filtr-item col-sm-2" data-category="3, 4" data-sort="red sample">
                      <a href="/filmReview">
                        <img src="https://ssl.pstatic.net/imgmovie/mdi/mit110/1597/159716_P09_100541.jpg" class="img-fluid mb-2" alt="poster"/>
                      </a>
                    </div>
                    <div class="filtr-item col-sm-2" data-category="3, 4" data-sort="red sample">
                      <a href="/filmReview">
                        <img src="https://ssl.pstatic.net/imgmovie/mdi/mit110/1597/159716_P09_100541.jpg" class="img-fluid mb-2" alt="poster"/>
                      </a>
                    </div>
                    <div class="filtr-item col-sm-2" data-category="2, 4" data-sort="black sample">
                      <a href="/filmReview">
                        <img src="https://ssl.pstatic.net/imgmovie/mdi/mit110/1495/149504_P22_100402.jpg" class="img-fluid mb-2" alt="poster"/>
                      </a>
                    </div>
                    <div class="filtr-item col-sm-2" data-category="1" data-sort="white sample">
                      <a href="/filmReview">
                        <img src="https://ssl.pstatic.net/imgmovie/mdi/mit110/1516/151646_P01_144220.jpg" class="img-fluid mb-2" alt="poster"/>
                      </a>
                    </div>
                    <div class="filtr-item col-sm-2" data-category="1" data-sort="white sample">
                      <a href="/filmReview">
                        <img src="https://ssl.pstatic.net/imgmovie/mdi/mit110/1516/151646_P01_144220.jpg" class="img-fluid mb-2" alt="poster"/>
                      </a>
                    </div>
                    <div class="filtr-item col-sm-2" data-category="2, 4" data-sort="black sample">
                      <a href="/filmReview">
                        <img src="https://ssl.pstatic.net/imgmovie/mdi/mit110/1495/149504_P22_100402.jpg" class="img-fluid mb-2" alt="poster"/>
                      </a>
                    </div>
                    <div class="filtr-item col-sm-2" data-category="3, 4" data-sort="red sample">
                      <a href="/filmReview">
                        <img src="https://ssl.pstatic.net/imgmovie/mdi/mit110/1597/159716_P09_100541.jpg" class="img-fluid mb-2" alt="poster"/>
                      </a>
                    </div>
                    <div class="filtr-item col-sm-2" data-category="1" data-sort="white sample">
                      <a href="/filmReview">
                        <img src="https://ssl.pstatic.net/imgmovie/mdi/mit110/1516/151646_P01_144220.jpg" class="img-fluid mb-2" alt="poster"/>
                      </a>
                    </div>
                    <div class="filtr-item col-sm-2" data-category="1" data-sort="white sample">
                      <a href="/filmReview">
                        <img src="https://ssl.pstatic.net/imgmovie/mdi/mit110/1516/151646_P01_144220.jpg" class="img-fluid mb-2" alt="poster"/>
                      </a>
                    </div>
                    <div class="filtr-item col-sm-2" data-category="2, 4" data-sort="black sample">
                      <a href="/filmReview">
                        <img src="https://ssl.pstatic.net/imgmovie/mdi/mit110/1495/149504_P22_100402.jpg" class="img-fluid mb-2" alt="poster"/>
                      </a>
                    </div>
                  </div>
                </div>

              </div>
            </div>
          </div>
 
        </div>
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 1.0.0
    </div>
	<div id="footer">
		<div>고객센터(이용 및 결제 문의) cs@teamfive.co.kr • 051-629-5232 (유료) <br/>
		 제휴	및 대외 협력 contact@teamfive.com • 051-629-5232 (유료)</div>
		<div>주식회사 TeamFive | 대표 송지현 | 팀원 김상두 이재혁 박다솔 김주희 | 부산광역시 남구 용당동 부경대용당캠퍼스 공학 6관 | <br/>
		사업자등록번호 8282-2424 | 통신판매업 신고번호 제 2020-부산용당-2020호  <br/>
		대표번호 051-629-5233 <br/>
		 개인정보 처리 방침</div>
	</div>
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
<!-- Bootstrap -->
<script src="/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- jQuery UI -->
<script src="/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Ekko Lightbox -->
<script src="/plugins/ekko-lightbox/ekko-lightbox.min.js"></script>
<!-- AdminLTE App -->
<script src="/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/dist/js/demo.js"></script>
<!-- Filterizr-->
<script src="/plugins/filterizr/jquery.filterizr.min.js"></script>
<!-- Page specific script -->
<script>
  $(function () {
    $(document).on('click', '[data-toggle="lightbox"]', function(event) {
      event.preventDefault();
      $(this).ekkoLightbox({
        alwaysShowClose: true
      });
    });

    $('.filter-container').filterizr({gutterPixels: 3});
    $('.btn[data-filter]').on('click', function() {
      $('.btn[data-filter]').removeClass('active');
      $(this).addClass('active');
    });
    
    
	$.ajax({
		url		:'/getMovieJson',
		dataType: 'json',
		success : function(data){
               console.log(data);

               var list = data.boxOfficeResult.dailyBoxOfficeList;
               var html = '';
               $.each(list, function(index, dailyBoxOffice){    
                  console.log(dailyBoxOffice);
                  html+= '<a href="/filmReview">';
                  html+= '<img class="img-fluid mb-2" src="https://ssl.pstatic.net/imgmovie/mdi/mit110/1516/151646_P01_144220.jpg" alt="poster"/>';
                  html+= '</a>';
               });
               $('#film').html(html);
            },
		error	: function(xhr){
			console.log(xhr);
			alert('오류' + xhr.status);
		}
	});
    
    
  })
</script>


</body>
</html>
