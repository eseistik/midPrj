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
			<h2>ID 찾기</h2>
			<h5>본인확인 이메일 주소와 입력한 메일 주소가 같아야 인증번호를 받을 수 있습니다.</h5>
		</div>

		<form class="form-horizontal" action="findidnext.action" id="findidfrom">

			<div class="form-group">
				<label for="inputEmail" class="col-sm-3 control-label">이메일</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" id="inputEmail" name="inputEmail" placeholder="이메일" style="width: 45%; display: inline-block;">
					<div style="width: 5%; display: inline-block;">@</div>
					<select class="form-control" style="width: 47%; display: inline-block;" name="emailSelect">
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
						<option value="daum.net">daum.net</option>
						<option value="paran.com">paran.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="yahoo.co.kr">yahoo.co.kr</option>
						<option value="empal.com">empal.com</option>
						<option value="lycos.co.kr">lycos.co.kr</option>
						<option value="korea.com">korea.com</option>
						<option value="dreamwiz.com">dreamwiz.com</option>
						<option value="freechal.com">freechal.com</option>
					</select>
				</div>
				<div class="col-sm-2">
					<button class="btn btn-default" id="sendCheckEmailBtn">인증번호
						받기</button>
				</div>
			</div>
			<div class="form-group">
				<label for="inputCode" class="col-sm-3 control-label">인증번호</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" id="inputCode"
						placeholder="인증번호">
				</div>
			</div>
			<div class="form-group">
				<div>
					<button type="submit" class="btn btn-default btn-lg" id="signin-btn" >다음</button>
					<button type="button" class="btn btn-default btn-lg" id="list-btn" onclick="location.href='findcancel.action'">취소</button>
				</div>
			</div>
		</form>

	</div>

</body>
</html>