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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=cp %>/css/my/style.css" />
<link rel="stylesheet" href="<%=cp %>/css/my/tablecss.css">
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
<script type="text/javascript">
	function cookingclassInfo(val) {
		var cc_id = val;
		//테스트
		//alert(cc_id);
		var popUrl = "cookingclassInfo.action?u_id=coyo4&cc_id=" + cc_id; //팝업창에 출력될 페이지 URL

		var popOption = "width=370, height=310, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)

		window.open(popUrl, "", popOption);
	}
</script>
</head>
<body>
	<c:import url="../00_main/Menu.jsp"></c:import>

	<div class="container" style="width: 1200px;">

		<div class="row">

			<div class="col-sm-8 blog-main">

				<ul class="nav nav-tabs" id="ui-nav-list">
					<li role="presentation"><a href="myCooking.action">예약된 클래스</a></li>
					<li role="presentation"><a href="myCookingEnd.action">종료된 클래스</a></li>
					<li role="presentation"><a href="myCookingCource.action">진행 중인 클래스</a></li>
					<li role="presentation" class="active"><a href="myCookingEndCource.action">진행 종료된 클래스</a></li>
				</ul>

				<div class="divTable greyGridTable col-md-12">
					<div class="divTableHeading">
						<div class="divTableRow">
							<div class="divTableHead">번호</div>
							<div class="divTableHead">쿠킹클래스명</div>
							<div class="divTableHead">참여 인원</div>
							<div class="divTableHead">관리</div>
						</div>
					</div>
					<div class="divTableBody">
						<c:forEach var="cookingclass" items="${cookingclass }">
							<div class="divTableRow">
								<div class="divTableCell" id="cookId">${cookingclass.cc_id }</div>
								<div class="divTableCell" id="cookTitle">${cookingclass.cc_title }</div>
								<div class="divTableCell" id="cookPeople">${cookingclass.people }</div>
								<div class="divTableCell">
									<button type="button" class="btn btn-xs btn-default" onclick="cookingclassInfo('${cookingclass.cc_id }');">회차 정보</button>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>

			</div>
			<!-- /.blog-main -->
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