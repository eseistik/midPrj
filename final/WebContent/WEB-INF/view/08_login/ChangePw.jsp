<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛있당</title>
<!-- Bootstrap CSS -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/login/base.css">
<style type="text/css">
.container {
	max-width: 600px;
	padding: 15px;
	margin: 0 auto;
	text-align: center;
}

#login-btn {
	background-color: #ff9b19;
	color: #FFF;
	margin-left: 3%;
}

.select-btn {
	margin-top: 15%;
}
</style>
</head>
<body>

	<div class="signupFin-Header">
		<c:import url="WaveHeader.jsp" />
	</div>

	<div class="container">
		<h2>비밀번호 수정이 완료되었습니다.</h2>

		<div class="select-btn">
			<button class="btn btn-default btn-lg" onclick="location.href='main.action'">메인으로</button>
			<button class="btn btn-default btn-lg" id="login-btn" onclick="location.href='loginmain.action'">로그인</button>
		</div>
	</div>

</body>
</html>