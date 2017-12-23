
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛있당</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/login/base.css">
<link rel="stylesheet" type="text/css" href="css/login/sign2.css">
<style type="text/css">
.form-group {
	margin-bottom: 3%;
}
</style>
</head>
<body>

	<c:import url="WaveHeader.jsp" />

	<div class="container">

		<div class="signin-header">
			<h2>PASSWORD 찾기</h2>
			<h5>비밀번호를 찾을 방법을 선택해 주세요.</h5>
		</div>

		<form class="form" action="findpwkind.action" >
			<div class="form-group">
				<div class="process">
					<input type="radio" name="select" id="proc-email" value="1" checked="checked"> 
					<label for="proc-email">본인확인 이메일 인증하기</label>
					<br> 
					<input type="radio" name="select" id="proc-qa" value="2"> 
					<label for="proc-qa">질문과 답변으로 인증하기</label>
				</div>
			</div>

			<div class="form-group">
				<div>
					<button type="submit" class="btn btn-default btn-lg"
						id="signin-btn">다음</button>
					<button type="button" class="btn btn-default btn-lg" id="list-btn"
						onclick="location.href='findcancel.action'">취소</button>
				</div>
			</div>
		</form>

	</div>

</body>
</html>