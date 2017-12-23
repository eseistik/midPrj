<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛있당</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker1").datepicker();
		$("#datepicker2").datepicker();
	});
</script>
<style type="text/css">
.image-upload>input {
	display: none;
}
</style>
<link rel="stylesheet" href="css/body.css">
</head>
<body>
	<c:import url="WaveHeader.jsp" />

	<div class="container" style="width: 750px;">
		<nav id="navbar-example" class="navbar navbar-default navbar-static"
			role="navigation" style="margin-top: 50px;">
			<div class="container-fluid">
				<div class="navbar-header text-center">
					<a class="navbar-brand">광고 세부 정보 입력하기</a>
				</div>
			</div>
		</nav>
		<form class="form-horizontal" style="">
			<div class="form-group">
				<label for="ADplace" class="col-sm-3 control-label">광고위치선정</label>
				<div class="dropdown col-sm-9">
					<button class="btn btn-default dropdown-toggle" type="button"
						id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
						광고 선택 <span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li role="presentation"><a role="menuitem" tabindex="-1"
							href="#">광고 1</a></li>
						<li role="presentation"><a role="menuitem" tabindex="-1"
							href="#">광고 2</a></li>
						<li role="presentation"><a role="menuitem" tabindex="-1"
							href="#">광고 3</a></li>
					</ul>
				</div>
			</div>

			<div class="form-group">
				<label for="ADname" class="col-sm-3 control-label">광고명</label>
				<div class="col-sm-9">
					<input class="form-control" id="ADname" style="width: 450px;"
						placeholder="광고명">
				</div>
			</div>

			<div class="form-group">
				<label for="ADstartdate" class="col-sm-3 control-label">광고
					시작 날짜</label>
				<div class="col-sm-1">
					<input class="form-control" id="datepicker1" style="width: 100px;">
				</div>
				<label for="ADenddate" class="col-sm-3 control-label">광고 종료
					날짜</label>
				<div class="col-sm-3">
					<input class="form-control" id="datepicker2" style="width: 100px;">
				</div>
			</div>

			<div class="form-group">
				<label for="ADLink" class="col-sm-3 control-label">연결링크(URL)</label>
				<div class="col-sm-9">
					<input class="form-control" id="ADLink" style="width: 450px;"
						placeholder="URL">
				</div>
			</div>

			<div class="form-group">
				<label for="exampleInputFile" class="col-sm-3 control-label">배너
					이미지</label>
				<div class="col-sm-7 text-center" style="margin-top: 5%;">
					<div class="image-upload">
						<label for="file-input"> <img src="images/AD/photo1.PNG" />
						</label> <input id="file-input" type="file" />
					</div>
				</div>
			</div>

			<div class="col-sm-11">
				<div class="text-right">[광고1] 30일</div>
				<div class="text-right">가격: 500,000</div>
				<input type="button" class="btn-lg"
					style="background-color: #ff9b19;; color: white; float: right; border: 1px solid #ff9b19;"
					value="확인" onclick="location.href='MyBanner.jsp'">
				<!-- 결제 완료 페이지 -->
			</div>



		</form>
	</div>

</body>
</html>