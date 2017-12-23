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

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<style type="text/css">
.declare-head .warning {
	font-size: 9pt;
	color: #a3a3a3;
}

.declare-head hr {
	margin: 10px 0px;
}

.declare-body {
	margin-top: 8%;
}

.declare-body .declare-value {
	font-size: 9pt;
	font-weight: bold;
}

.declare-footer {
	text-align: center;
}
</style>
<script type="text/javascript">
	function popover_close() {
		window.close();
	}
</script>
</head>
<body>
	<div class="declare-main">
		<div class="declare-head col-md-12">
			<h4>신고하기</h4>
			<hr>
			<div class="warning">* 허위 신고일 경우, 신고자의 서비스 활동이 제한될 수 있으니 신중하게
				신고해 주세요.</div>
		</div>

		<div class="declare-body col-md-12">
			<div>
				<strong>신고 접수가 완료되었습니다.</strong><br>
				<strong>신속하게 처리할 수 있도록 하겠습니다. 고맙습니다.</strong>
				<hr>
			</div>
		</div>
		<div class="declare-footer">
			<button type="button" class="btn btn-default" onclick="popover_close();">확인</button>
		</div>
	</div>
</body>
</html>