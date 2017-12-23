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
					<li role="presentation"><a href="myPoint.action">포인트 사용 및
							적립 내역</a></li>
					<li role="presentation" class="active"><a href="myCoupon.action">보유 쿠폰</a></li>
				</ul>
				<div class="col-xs-8 viewlist-head"
					style="font-size: 14pt; margin: 15px 0;">
				</div>
				<div>
					<div class="divTable greyGridTable col-md-12">
						<div class="divTableHeading">
							<div class="divTableRow">
								<div class="divTableHead">번호</div>
								<div class="divTableHead">브랜드</div>
								<div class="divTableHead">내용</div>
								<div class="divTableHead">포인트</div>
								<div class="divTableHead">일자</div>
							</div>
						</div>
						<div class="divTableBody">
								<div class="divTableRow">
									<div class="divTableCell">1</div>
									<div class="divTableCell">농심</div>
									<div class="divTableCell">배송비 무료 쿠폰</div>
									<div class="divTableCell">2500</div>
									<div class="divTableCell">2017-12-10</div>
								</div>
						</div>
					</div>

					<div class="container col-md-12 text-center">
						<div class="pagination p1">
							<ul>
								<a href="#"><li><</li></a>
								<a class="is-active" href="#"><li>1</li></a>
								<a href="#"><li>2</li></a>
								<a href="#"><li>3</li></a>
								<a href="#"><li>4</li></a>
								<a href="#"><li>5</li></a>
								<a href="#"><li>6</li></a>
								<a href="#"><li>></li></a>
							</ul>
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
					<c:import url="../00_main/AdLine.jsp"></c:import>
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