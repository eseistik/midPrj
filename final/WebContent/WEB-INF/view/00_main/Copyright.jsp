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
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
#copy {
	width: 100%;
	background-color: #ff9b19;
	color: black;
	padding-left: 80px;
	padding-top: 40px;
	font-size: 12px;
	margin-top: 100px;
}

.copylist {
	font-size: 15px;
	color: #000000;
}
</style>
</head>
<body>

	<div id="copy">
		<div>
			<a href="#" class="copylist">광고문의 </a> | <a href="#" class="copylist">개인정보처리방침
			</a> | <a href="#" class="copylist">이용약관 </a> | <a href="#"
				class="copylist">고객센터 </a> <br>
			<div class="company-info">
				<br> 대표 : 박종유 / E : COYO@RECEIVE.COM / F : 02) 123-4567 <br>
				서울특별시 영등포구 양평동 4가 2 19층 C강의실 <br> 문의 : 070-1234-5678
				(운영시간-오전10:00~오후5:00) <br> <br> ⓒ 2017. 댕댕이 ALL RIGHTS
				RESERVED <br>
				<br>
				<br>
			</div>
		</div>
	</div>

</body>
</html>