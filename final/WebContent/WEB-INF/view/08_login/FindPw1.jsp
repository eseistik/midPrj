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
<body>

	<c:import url="WaveHeader.jsp" />

	<div class="container">

		<div class="signin-header">
			<h2>PASSWORD 찾기</h2>
			<h5>비밀번호를 찾고자 하는 아이디를 입력해 주세요.</h5>
		</div>

		<form class="form-horizontal" id="findpwFrom" name="findpwFrom" action="findpwnext.action">
			<div class="form-group">
				<label for="inputId" class="col-sm-3 control-label">아이디</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="inputId" name="inputid"
						placeholder="아이디" required>
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