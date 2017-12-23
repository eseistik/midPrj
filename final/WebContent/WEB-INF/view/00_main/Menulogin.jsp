<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
	String html = "<div><a href='infoModify.action' style='color: black;'>회원정보</a></div>";
	html += "<div><a href='myTalk.action' style='color: black;'>my 토크</a></div>";
	html += "<div><a href='myCooking.action' style='color: black;'>my 쿠킹클래스</a></div>";
	html += "<div><a href='myPoint.action' style='color: black;'>my 포인트</a></div>";
	html += "<div><a href='logout.action' style='color: black;'>로그아웃</a></div>";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- Custom styles -->
<link rel="stylesheet" type="text/css" href="css/main/menu-protocol.css">
<link rel="stylesheet" href="css/main/style.css">

<style class="cp-pen-styles">
.search-form {
	width: 100%;
	background-color: #f8f8f8;
	height: 65px;
	margin-top: 0px;
}

.search {
	width: 24em;
	left: 50%;
	top: 4%;
	transform: translate(-50%, -50%);
	margin-left: 50%;
	padding-top: 70px;
}

.search .field {
	position: relative;
}

.search label {
	background:
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAQAAAC1QeVaAAAAxElEQVR4AXXPIUuDcRDA4Zv4AUSwTLEKVoNlySyCYLO98CCsahGrX0AW/QhmBRHEJghLS4JFBBXDgrJi2In78w8v4v3S8XDh4nd0DTxLEzd2RC2EnrH07trQVDrXqbhs7FvfnBDWDKWTigOpL2oWvZpYKPjio1zVHEt7BdOtaLUtHRX8MmqjRjooeCVttPBOWi+4JT1aLaDjVLpU/5ytn840Dj1IaWSpYmi8yVlTF54qh9K8nn27usJK5fC3yvfhPx7a/AE9dYwDEfKrlAAAAABJRU5ErkJggg==)
		no-repeat 0 50%;
	color: #b2b2b2;
	left: 50%;
	position: absolute;
	transform: translate(-50%, -50%);
	top: 50%;
	transition: left .4s, transform .4s;
	padding-left: 1.25em;
}

.search .input-search {
	border: 1px solid #dfdfdf;
	border-radius: .25em;
	box-shadow: 0 1px 0 #bfbebf;
	display: block;
	font: 400 1em/1.5em sans-serif;
	padding: .5em 1.75em;
	width: 100%;
}

.search .input-search:focus+label, .search .input-search:valid+label {
	left: .5em;
	transform: translate(0, -50%);
}

.search .input-search:valid+label {
	text-indent: -9999px;
}

.top-icon {
	width: 100px;
	height: 100px;
	margin-left: 70%;
	margin-top: -95px;
}

.top-icon img {
	width: 40px;
}

.top-icon ul {
	list-style-type: none;
	overflow: hidden;
	margin: 0;
	padding: 0;
}

.top-icon li {
	float: left;
	margin-left: 7px;
}

.top-icon li a {
	display: block;
	color: white;
	text-align: center;
	text-decoration: none;
}

/* #navbar {
	display: inline-block;
	position: relative;
	cursor: default;
	left: 50%;
	margin-left: -400px;
}

.navbar {
	background-color: aqua;
	display: none;
}

#navbar .dropdown {
	margin-left: 30px;
	margin-right: 30px;
} */
.drowdown-background {
	background-color: #ffb21c;
	width: 100%;
	height: 90px;
}

li {
	padding: 0px;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#hyewonjoa").popover();
		$("#hyewonneomujoa").popover();
	});
</script>
</head>
<body>
	<div class="search-form">
		<img alt="" src="images/main/logo.png" style="width: 100px; display: inline;" >
	
		<form action="" class="search">

			<div class="field">

				<input type="text" class="input-search" id="input-search"
					name="input-search" required> <label for="input-search">Search</label>
			</div>

		</form>

		<div class="top-icon">
			<ul class="icon">
				<li><a href="RecipeInsertForm.jsp"><img
						src="<%=cp%>/images/main/icon-pen.png"></a></li>
				<li><img id="hyewonjoa" tabindex="0" data-placement="bottom"
					data-toggle="popover" data-html="true" data-content="<%=html%>"
					src="<%=cp%>/images/main/icon-user.png"></li>
			</ul>
		</div>

	</div>

	<c:import url="MenuNav.jsp"></c:import>
</body>
</html>