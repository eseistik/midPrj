<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛있당 - Follower List</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/my/tablecss.css">
<style type="text/css">
#follow {
	width: 370px;
}

.follow-list {
	margin-left: 2%;
}

.follow-footer {
	text-align: center;
}

.follow-footer .close-btn {
	margin: 5% 0px;
}
</style>
<script type="text/javascript">
	function popover_close() {
		window.close();
	}
</script>
</head>
<body id="follow">

	<div class="follow-list">
		<div class="follw-header">
			<h3>
				팔로워 리스트<small>(${followerCount } 명)</small>
			</h3>
			<hr>
		</div>
		<!-- End follow-header -->

		<div class="follow-body">
			<div class="divTable greyGridTable col-md-12">
				<div class="divTableHeading">
					<div class="divTableRow">
						<div class="divTableHead">번호</div>
						<div class="divTableHead">닉네임</div>
						<div class="divTableHead">관리</div>
					</div>
				</div>
				<div class="divTableBody">
					<c:forEach var="follower" items="${followerList }">
						<div class="divTableRow">
							<div class="divTableCell">1</div>
							<div class="divTableCell">${follower.fl_u_nickname }</div>
							<div class="divTableCell">
								<input type="button" class="btn btn-default" value="unFollow">
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- End Table -->
			<div class="follow-footer">
				<button type="button" class="btn btn-default close-btn" onclick="popover_close();">닫기</button>
			</div>
		</div>
		<!-- End follow-body -->
	</div>
</body>
</html>