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
<link rel="stylesheet" type="text/css" href="css/login/table.css">
<body>

	<c:import url="WaveHeader.jsp" />

	<div class="container">

		<div class="signin-header">
			<h2>ID 찾기</h2>
			<h5>본인확인 이메일 주소와 입력한 메일 주소가 같아야 인증번호를 받을 수 있습니다.</h5>
		</div>

		<div>

			<div class="wrapper">

				<div class="table">

					<div class="row header">
						<div class="cell"></div>
						<div class="cell">가입된 아이디</div>
						<div class="cell">가입된 이메일</div>
						<div class="cell">가입된 날짜</div>
					</div>

					<div class="row">
						<div class="cell"></div>
						<div class="cell">${infoList.id }</div>
						<div class="cell">${infoList.email }</div>
						<div class="cell">${infoList.joindate }</div>
					</div>

				</div>

			</div>

			<div class="form-group">
				<div>
					<button type="button" class="btn btn-default btn-lg" onclick="location.href='loginmain.action'"
						id="signin-btn">로그인</button>
					<button type="button" class="btn btn-default btn-lg" id="list-btn" onclick="location.href='findcancel.action'">취소</button>
				</div>
			</div>

		</div>
	</div>
</body>
</html>