<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<link
		href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
		rel="stylesheet" id="bootstrap-css">
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link rel="stylesheet"
		href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
		integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
		crossorigin="anonymous" >

	<div class="container">
	<div class="cont" style="magin:10px 10px 10px 10px;">
		<h3> </h3>
		<div class="row justify-content-center">
			<div class="col-12 col-md-8 col-lg-6 pb-5">
						<form action="/reqBoard" method="POST">
					<div class="card border-primary rounded-0">
						<div class="card-header p-0">
							<div class="bg-info text-white text-center py-2">
								<h3>
									<i class="fa fa-envelope"></i> 1 : 1 문의
								</h3>
								<p class="m-0">
									아이디, 이메일과 함께 문의 내용을 보내주세요.<br>
									주말을 제외한 영업일 기준 1~3일 이내에 답변 드리도록 할게요.
								</p>
							</div>
						</div>
						<div class="card-body p-3">
							<div class="form-group">
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fa fa-user text-info"></i>
										</div>
									</div>
									<input type="email" class="form-control" id="mid"
										name="mId" value="${login.mId}">
								</div>
							</div>
							<div class="form-group">
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fa fa-envelope text-info"></i>
										</div>
									</div>
									<input type="email" class="form-control" id="email"
										name="email" placeholder="이메일을 입력해주세요." required>
								</div>
							</div>

							<div class="form-group">
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fa fa-comment text-info"></i>
										</div>
									</div>
									<textarea class="form-control" name="reqConts"
										placeholder="문의 내용을 입력해주세요." required></textarea>
								</div>
							</div>

							<div class="text-center">
								<input type="submit" value="보내기"
									class="btn btn-info btn-block rounded-0 py-2">
							</div>
						</div>

					</div>
				</form>
				<!--Form with header-->


			</div>
		</div>
		</div>
	</div>
</body>
</html>