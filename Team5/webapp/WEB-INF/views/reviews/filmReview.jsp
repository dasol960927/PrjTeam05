<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>FilmCritics | FilmReview</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Font Awesome -->
<link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet" href="/dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
.starR1 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat -52px 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR2 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR1.on {
	background-position: 0 0;
}

.starR2.on {
	background-position: -15px 0;
}
</style>
</head>
<body class="hold-transition sidebar-mini">
	<!-- Site wrapper -->
	<div class="wrapper">

		<!-- SEARCH FORM -->
		<form class="form-inline ml-3" method="POST" action="/FilmSearch">
			<div class="input-group input-group-sm">
				<input class="form-control form-control-navbar" type="search"
					placeholder="영화작품 제목을 검색해보세요." size="50" aria-label="Search"
					id="keyword" name="keyword">
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
							<h1>영화 감상</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="/">Home</a></li>
								<li class="breadcrumb-item active">Film Review</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
            </div>
          </div>
          <div class="row mt-4">
            <nav class="w-100">
              <div class="nav nav-tabs" id="product-tab" role="tablist">
                <a class="nav-item nav-link" id="product-desc-tab"  href="/filmReview" style="background-color:#878787; color:#ECFFFF"  >영화설명</a>
                <a class="nav-item nav-link" id="product-comments-tab"  href="/REVIEW/grdList?filmId=F00004" >리뷰</a>
                <a class="nav-item nav-link" id="product-rating-tab"  href="/REVIEW/revList?filmId=F00001" >평점</a>
              </div>
            </nav>
            <div class="tab-content p-3" id="nav-tabContent">
              <div class="tab-pane fade show active" id="product-desc" role="tabpanel" aria-labelledby="product-desc-tab">태국에서 충격적인 납치사건이 발생하고<br/> 마지막 청부살인 미션을 끝낸 암살자 인남(황정민)은 그것이 자신과 관계된 것임을 알게 된다.<br/>인남은 곧바로 태국으로 향하고, 조력자 유이(박정민)를 만나 사건을 쫓기 시작한다.<br/>한편, 자신의 형제가 인남에게 암살당한 것을 알게 된 레이(이정재). <br/>무자비한 복수를 계획한 레이는 인남을 추격하기 위해 태국으로 향하는데...<br/>처절한 암살자 VS 무자비한 추격자멈출 수 없는 두 남자의 지독한 추격이 시작된다!</div>
              <div class="tab-pane fade" id="product-comments" role="tabpanel" aria-labelledby="product-comments-tab">재미있게 잘 봤습니다. 연기구멍이 아무도 없음</div>
              <div class="tab-pane fade" id="product-rating" role="tabpanel" aria-labelledby="product-rating-tab">6점</div>
            </div>
          </div>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
				<!-- Default box -->
				<div class="card card-solid">
					<div class="card-body">
						<div class="row">
							<div class="col-12 col-sm-6">
								<h3 class="d-inline-block d-sm-none">Films Review</h3>
								<div class="col-12">
									<img
										src="http://file.koreafilm.or.kr/thm/02/00/05/62/tn_DPK016088.jpg"
										class="product-image" alt="Product Image">
								</div>
								<div class="col-12 product-image-thumbs">
									<div class="product-image-thumb ">
										<img
											src="http://file.koreafilm.or.kr/thm/01/copy/00/54/37/tn_DST692321.jpg"
											alt="Product Image">
									</div>
									<div class="product-image-thumb">
										<img
											src="http://file.koreafilm.or.kr/thm/01/copy/00/54/37/tn_DST692322.jpg"
											alt="Product Image">
									</div>
									<div class="product-image-thumb">
										<img
											src="http://file.koreafilm.or.kr/thm/01/copy/00/54/37/tn_DST692323.jpg"
											alt="Product Image">
									</div>
								</div>
							</div>
							<div class="col-12 col-sm-6">
								<h3 class="my-3">다만 악에서 구하소서</h3>
								<p>
									출연진: 황정민, 이정재, 박정민, 박소이, 최희서 <br /> 감독 :홍원찬 <br /> 개봉일:
									2020.08.05
								</p>

								<hr>
								<h4>Graph</h4>
								<!-- DONUT CHART -->
								<div class="card card-danger">
									<div class="card-header">
										<h3 class="card-title">Donut Chart</h3>

										<div class="card-tools">
											<button type="button" class="btn btn-tool"
												data-card-widget="collapse">
												<i class="fas fa-minus"></i>
											</button>
											<button type="button" class="btn btn-tool"
												data-card-widget="remove">
												<i class="fas fa-times"></i>
											</button>
										</div>
									</div>
									<div class="card-body">
										<canvas id="donutChart"
											style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
									</div>
									<!-- /.card-body -->
								</div>
								<!-- /.card -->

								<h4 class="mt-3">
									영화 <small>별점</small>
								</h4>
								<div class="starRev">
									<span class="starR1 on">★</span> <span class="starR2">★</span>
									<span class="starR1">★</span> <span class="starR2">★</span> <span
										class="starR1">★</span> <span class="starR2">★</span> <span
										class="starR1">★</span> <span class="starR2">★</span> <span
										class="starR1">★</span> <span class="starR2">★</span>
									<script>
										$('.starRev span').click(
												function() {
													$(this).parent().children(
															'span')
															.removeClass('on');
													$(this).addClass('on')
															.prevAll('span')
															.addClass('on');
													return false;
												});
									</script>
								</div>

								<div class="bg-gray py-2 px-3 mt-4">
									<h2 class="mb-0">3000 P</h2>
									<h4 class="mt-0">
										<small>3000원 충전 필요</small>
									</h4>
								</div>

								<div class="mt-4">
									<div class="btn btn-primary btn-lg btn-flat">
										<i class="fas fa-cart-plus fa-lg mr-2"></i> <a
											href="DPS/Deposit1?mId=${ login.mId }">포인트 충전</a>
									</div>

									<div class="btn btn-default btn-lg btn-flat">
										<i class="fas fa-heart fa-lg mr-2"></i> <a
											href="/Like?mId=${ login.mId }&docId=${docId }">찜하기</a>
									</div>
								</div>

								<div class="mt-4 product-share">
									<a href="#" class="text-gray"> <i
										class="fab fa-facebook-square fa-2x"></i>
									</a> <a href="#" class="text-gray"> <i
										class="fab fa-twitter-square fa-2x"></i>
									</a> <a href="#" class="text-gray"> <i
										class="fas fa-envelope-square fa-2x"></i>
									</a> <a href="#" class="text-gray"> <i
										class="fas fa-rss-square fa-2x"></i>
									</a>
								</div>

							</div>
						</div>
						<div class="row mt-4">
							<nav class="w-100">
								<div class="nav nav-tabs" id="product-tab" role="tablist">
									<a class="nav-item nav-link" id="product-desc-tab"
										href="reviews/filmReview">영화설명</a> <a
										class="nav-item nav-link" id="product-comments-tab"
										href="/REVIEW/grdList?filmId=F00001">리뷰</a> <a
										class="nav-item nav-link" id="product-rating-tab"
										href="/REVIEW/revList?filmId=F00001">평점</a>
								</div>
							</nav>
							<div class="tab-content p-3" id="nav-tabContent">
								<div class="tab-pane fade" id="product-rating" role="tabpanel"
									aria-labelledby="product-rating-tab">6점</div>
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
			<div>
				고객센터(이용 및 결제 문의) cs@teamfive.co.kr • 051-629-5232 (유료) <br /> 제휴 및
				대외 협력 contact@teamfive.com • 051-629-5232 (유료)
			</div>
			<div>
				주식회사 TeamFive | 대표 송지현 | 팀원 김상두 이재혁 박다솔 김주희 | 부산광역시 남구 용당동 부경대용당캠퍼스
				공학 6관 | <br /> 사업자등록번호 8282-2424 | 통신판매업 신고번호 제 2020-부산용당-2020호 <br />
				대표번호 051-629-5233 <br /> 개인정보 처리 방침
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
	<!-- Bootstrap 4 -->
	<script src="/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- ChartJS -->
	<script src="/plugins/chart.js/Chart.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/dist/js/demo.js"></script>

	<script>
		$(function() {
			/* ChartJS
			 * -------
			 * Here we will create a few charts using ChartJS
			 */

			//-------------
			//- DONUT CHART -
			//-------------
			// Get context with jQuery - using jQuery's .get() method.
			var donutChartCanvas = $('#donutChart').get(0).getContext('2d')
			var donutData = {
				labels : [ '10대', '20대', '30대', '40대', '50대', '60대 이상', ],
				datasets : [ {
					data : [ 700, 500, 400, 600, 300, 100 ],
					backgroundColor : [ '#f56954', '#00a65a', '#f39c12',
							'#00c0ef', '#3c8dbc', '#d2d6de' ],
				} ]
			}
			var donutOptions = {
				maintainAspectRatio : false,
				responsive : true,
			}
			//Create pie or douhnut chart
			// You can switch between pie and douhnut using the method below.
			var donutChart = new Chart(donutChartCanvas, {
				type : 'doughnut',
				data : donutData,
				options : donutOptions
			})

		});
	</script>
</body>
</html>