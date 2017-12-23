<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛있당</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<link rel="stylesheet" type="text/css" href="css/login/base.css">
<link rel="stylesheet" type="text/css" href="css/login/sign2.css">


<!-- <script type="text/javascript">


$(function() {

	$("#inputPw2").blur(function() {
		checkPw();
	});
	
	function checkPw() {
		if ($("#inputPw1").val() != $("#inputPw2").val()) {
			var str = "비밀번호가 틀립니다.";
			document.getElementById("pwCheck2").innerHTML = str;
			$("#inputPassword1").focus();
		} else
			document.getElementById("pwCheck2").innerHTML = "";
	}
});


</script> -->
<body>

	<c:import url="WaveHeader.jsp" />

	<div class="container">

		<div class="signin-header">
			<h2>PASSWORD 수정</h2>

		</div>

		<form class="form-horizontal" action="pwchange.action" method="post">
			<div class="form-group">
				<label for="inputName" class="col-sm-3 control-label">아이디</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="inputName"
						value="${id }" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label"></label>
				<div class="col-sm-9">
					<input type="password" class="form-control" id="inputPw1" name="inputPw1"
						placeholder="새 비밀번호" required>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label"></label>
				<div class="col-sm-9">
					<input type="password" class="form-control" id="inputPw2" name="inputPw2"
						placeholder="새 비밀번호 확인" required>
				</div>
				<span id="pwCheck2" class="errId"></span>
			</div>

			<div class="form-group">자동 입력 방지</div>
			<div class="form-group">
				<div>
					<button type="submit" class="btn btn-default btn-lg" id="signin-btn">변경</button>
					<button type="button" class="btn btn-default btn-lg" id="list-btn" onclick="location.href='findcancel.action'">취소</button>
				</div>
			</div>
		</form>
	</div>

</body>
</html>