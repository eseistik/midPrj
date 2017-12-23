<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛있당</title>
<style type="text/css">
.drop-footer {
	margin-top: 20%;
}

.main-btn {
	margin-top: 5%;
}
</style>
</head>
<body> 

	<c:import url="../00_main/Menu.jsp"></c:import>
 
	<div class="container"
		style="width: 1200px; height: 100%; margin-top: 5%;">
		<div class="drop-header">
			<h3>회원 탈퇴 완료</h3>
			<hr>
		</div>
		<div class="drop-body">
			<div class="">
				<h4>회원님의 회원 탈퇴가 정상적으로 처리되었습니다.</h4>
				<h4>그동안 맛있당을 사랑해 주셔서 감사합니다.</h4>
			</div>
			<div class="btn-menu">
				<button class="main-btn btn btn-default btn-lg" type="button" onclick="location.href=''">메인으로</button>
			</div>
		</div>
	</div>

	<div class="drop-footer">
		<c:import url="../00_main/Copyright.jsp"></c:import>
	</div>
</body>
</html>