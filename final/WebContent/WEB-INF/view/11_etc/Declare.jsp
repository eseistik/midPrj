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
<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

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

.declare-footer #declare-err {
	color: red;
	display: none;
}
</style>
<script type="text/javascript">
	function popover_submit() 
	{
		if ($("input[name='re_type_id']:checked").length < 1)
		{
			$("#declare-err").css("display", "inline");
			return false;
		}
		
		var form = document.getElementById("declare-form");
		form.submit();
		/* window.close(); */
	}

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
			<form id="declare-form" action="reportFin.action" method="get">
				<strong>신고 사유</strong>
				<div class="declare-value">
					<c:forEach var="Lists" items="${viewLists }">
						<div>
							<input type="radio" name="re_type_id" id="re_type_id" value=${Lists.re_type_id }>
							<label for=${Lists.re_type_id } id="re_type_val">${Lists.re_type_val }</label>
						</div>

					</c:forEach>

				</div>
				<hr>
				<input type="hidden" value="${id}" name="u_id">
				<input type="hidden" value="${report_u_id }" name="report_u_id">
			</form>
		</div>
		
		<div class="declare-footer">
			<div>
				<span id="declare-err">신고 사유를 선택해 주세요.</span>
			</div>
			<button type="button" class="btn btn-danger"
				onclick="popover_submit();">신고하기</button>
			<button type="button" class="btn btn-default"
				onclick="popover_close();">취소</button>
		</div>
	</div>
</body>
</html>