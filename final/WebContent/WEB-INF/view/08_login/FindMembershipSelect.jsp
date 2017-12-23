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
<!-- Bootstrap CSS -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link rel="stylesheet" href="css/login/base.css">
<link rel="stylesheet" href="css/login/membershipSelect.css">

</head>
<body>

	<c:import url="WaveHeader.jsp"></c:import>

	<div class="container">

		<form class="form-select">
			<h2 class="form-select-heading">회원 종류</h2>

			<button class="btn btn-default btn-lg btn-block" type="button"
				onclick="location.href='findkind.action?type=1'">일반 회원</button>
			<button class="btn btn-default btn-lg btn-block" type="button"
				onclick="location.href='findkind.action?type=2'">사업자 회원</button>

		</form>

	</div>
	<!-- /container -->

</body>
</html>