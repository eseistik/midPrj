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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function goTop() {
		$('html').scrollTop(0);
	}
</script>

<style type="text/css">
img {
	display: block;
	margin-left: auto;
	margin-right: auto;
}
</style>

<link rel="stylesheet" href="<%=cp %>/css/cs/body.css">

</head>
<body>

	<c:import url="../00_main/Menu.jsp"></c:import>

	<div class="container" style="width: 950px;">

		<div style="text-align: center;">
			<h3>사업자회원 등록 절차</h3>
			<hr>
		</div>

		<div class="col-lg-12">
			<img src="/images/cs/csep/csep1.PNG">
		</div>
		<div class="col-lg-12">
			<img src="/images/cs/csep/csep2.PNG">
		</div>
		<div class="btn-group-lg col-lg-12" role="group" align="center" style="margin-top: 2%;">
			<button type="button" class="btn btn-default"
				style="border: 1px solid #e9e9e9"
				onclick="history.back()">뒤로가기</button>
			<button type="button" class="btn btn-default"
				style="border: 1px solid #e9e9e9"
				onClick="goTop()">↑TOP↑</button>
		</div>

	</div>
	<!-- /container -->

	<!-- Site footer -->
	<footer class="footer">
		<c:import url="../00_main/Copyright.jsp"></c:import>
	</footer>

</body>
</html>