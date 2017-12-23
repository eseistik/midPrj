<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛있당 - Cooking Class Info</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/my/tablecss.css">
<style type="text/css">
#follow {
	width: 490px;
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

		<div class="follow-body">
			<div class="Info-header">
				<h4>쿠킹 클래스 정보</h4>
				<hr>
			</div>
			<div class="divTable greyGridTable col-md-12">
				<div class="divTableHeading">
					<div class="divTableRow">
						<div class="divTableHead">번호</div>
						<div class="divTableHead">주소</div>
						<div class="divTableHead">연락처</div>
					</div>
				</div>
				<div class="divTableBody">
					<c:forEach var="cookingInfo" items="${cookingInfo }" begin="1" end="1">
					<div class="divTableRow">
						<div class="divTableCell">${cookingInfo.cc_id }</div>
						<div class="divTableCell">${cookingInfo.cc_addr } ${cookingInfo.cc_addr_add }</div>
						<div class="divTableCell">${cookingInfo.u_phone }</div>
					</div>
					</c:forEach>
				</div>
			</div>

			<div class="Info-header">
				<h4>회차 정보</h4>
				<hr>
			</div>

			<div class="divTable greyGridTable col-md-12">
				<div class="divTableHeading">
					<div class="divTableRow">
						<div class="divTableHead">수강 일자</div>
						<div class="divTableHead">클래스 시간</div>
						<div class="divTableHead">메뉴</div>
						<div class="divTableHead">수강 인원</div>
					</div>
				</div>
				<div class="divTableBody">
					<c:forEach var="cookingInfo" items="${cookingInfo }">
						<div class="divTableRow">
							<div class="divTableCell">${cookingInfo.cc_time_date }</div>
							<div class="divTableCell">${cookingInfo.cc_time_start } - ${cookingInfo.cc_time_end }</div>
							<div class="divTableCell">${cookingInfo.cc_time_name }</div>
							<div class="divTableCell">${cookingInfo.cc_people }</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- End Table -->
			<div class="follow-footer">
				<button type="button" class="btn btn-default close-btn"
					onclick="popover_close();">닫기</button>
			</div>
		</div>
		<!-- End follow-body -->
	</div>
</body>
</html>