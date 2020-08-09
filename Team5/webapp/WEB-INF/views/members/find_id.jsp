<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
	<div>
		<div>
			<form action="/find_Id" method="post">
				<div>
					<h3>아이디 찾기</h3>
				</div>
				<div>
					
					<p>
						<label>휴대번호</label>
						<input type="text" id="mPhone" name="mPhone" required>
					</p>
					<p class="w3-center">
						<button type="submit" id=findBtn >find</button>
						<button type="button" onclick="history.go(-1);" >Cancel</button>
					</p>
				</div>
			</form>
		</div>
	</div>
</body>
</html>