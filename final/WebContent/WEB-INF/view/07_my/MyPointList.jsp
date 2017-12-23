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
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=cp %>/css/my/tablecss.css" />
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/my/page.css">
<style type="text/css">
.media-heading>a {
	text-decoration: none;
}

.sidebar-module {
	margin-top: 10%;
	text-align: center;
}

#ui-nav-list {
	padding: 0px;
	margin: 5% auto;
	width: 100%;
}
</style>
</head>
<body>

	<c:import url="../00_main/Menu.jsp"></c:import>

	<div class="container" style="width: 1200px;">

		<div class="row">

			<div class="col-sm-8 blog-main">

				<ul class="nav nav-tabs" id="ui-nav-list">
					<li role="presentation" class="active"><a href="myPoint.action">포인트 사용 및
							적립 내역</a></li>
					<li role="presentation"><a href="myCoupon.action">보유 쿠폰</a></li>
				</ul>

				<div>
					<div class="divTable greyGridTable col-md-12">
						<div class="divTableHeading">
							<div class="divTableRow">
								<div class="divTableHead">번호</div>
								<div class="divTableHead">카테고리</div>
								<div class="divTableHead">내용</div>
								<div class="divTableHead">포인트</div>
								<div class="divTableHead">일자</div>
							</div>
						</div>
						<div class="divTableBody">
							<c:forEach var="point" items="${pointList }">
								<div class="divTableRow">
									<div class="divTableCell">${point.rownum }</div>
									<div class="divTableCell">${point.rice_stu_val }</div>
									<div class="divTableCell">${point.rice_use_val }</div>
									<div class="divTableCell">${point.rice_point }</div>
									<div class="divTableCell">${point.rice_date }</div>
								</div>
							</c:forEach>
						</div>
					</div>

				</div>
				<!-- /.blog-main -->
			</div>

			<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
				<div class="sidebar-module sidebar-module-inset">
					<ul class="list-group">
						<li class="list-group-item"><a href="infoModify.action">회원정보</a></li>
						<li class="list-group-item"><a href="myTalk.action">my
								토크</a></li>
						<li class="list-group-item"><a
							href="myCooking.action">my 쿠킹클래스</a></li>
						<li class="list-group-item"><a href="myPoint.action">my 포인트</a></li>
						<li class="list-group-item"><a href="MyBannerViewList.jsp">my
								배너(사업자 전용)</a></li>
						<li class="list-group-item"><a href="logout.action">로그아웃</a></li>
					</ul>
				</div>
				<div class="sidebar-module">
					<c:import url="../00_main/ADLine.jsp"></c:import>
				</div>
			</div>
		</div>
	</div>

	<!-- Site footer -->
	<footer class="footer">
		<c:import url="../00_main/Copyright.jsp"></c:import>
	</footer>
</body>
</html>