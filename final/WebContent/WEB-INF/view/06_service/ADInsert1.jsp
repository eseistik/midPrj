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

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<style type="text/css">
.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
}

.pagination a.active {
	background-color: #ff9b19;
	color: white;
	border: 1px solid #ff9b19;
}
</style>
<link rel="stylesheet" href="css/body.css">

</head>
<body>

	<c:import url="WaveHeader.jsp" />

	<div class="container text-center">
		<div>
			<h3 style="font-weight: bold;">광고 등록하기 전!</h3>
		</div>
		<div>
			<h1
				style="color: red; font-weight: bold; text-decoration: underline;">광고
				위치를 숙지해 주세요.</h1>
		</div>
		<div>
			<img src="images/AD/Mainmain.jpg"
				style="width: 70%; border: 1px solid orange">
		</div>
		<div class="pagination" style="font-size: 20px;">
			<a href="#" class="active">Home</a> <a href="#">레시피</a> <a href="#">쿠킹클래스</a>
			<a href="#">브랜드</a>
		</div>

	</div>
	<div class="container text-center" role="group">
		<button type="button" class="btn-lg"
			style="color: black; background-color: white; border: 1px solid"
			onclick="location.href='CustomerServiceMain.jsp'">뒤로가기</button>
		<button type="button" class="btn-lg"
			style="color: white; background-color: #ff9b19; border: 1px solid #ff9b19;"
			onclick="location.href='ADInsert2.jsp'">다음</button>
	</div>


</body>
</html>