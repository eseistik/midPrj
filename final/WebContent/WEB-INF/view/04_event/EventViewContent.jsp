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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="css/event/style.css">
</head>
<body>

	<c:import url="../00_main/Menu.jsp"></c:import>
	

	<div class="container" style="width: 1200px;">

		<div class="row">

			<div class="col-sm-8 blog-main">

				<ul class="nav nav-tabs">
					<li role="presentation" class="active"><a
						href="event.action">진행중인 이벤트</a></li>
					<li role="presentation"><a href="eventend.action">종료된
							이벤트</a></li>
				</ul>

				<div class="blog-post">
					<hr>
					<blockquote>
						<p>
							<img alt="EventPhoto" src="${eventContent.event_main_img }"
								style="width: 575px;">
						</p>
					</blockquote>
					<p>
						${eventContent.event_content }
					</p>
					<br>
					<blockquote>
						<p>
							<img src="${eventContent.event_sub_img }"
								style="width: 575px;">
						</p>
					</blockquote>
					
					<div style="text-align: center;">
						<button type="button" class="btn btn-default btn-lg"
							onclick="window.location.href='${eventContent.event_url}'">사이트로 이동</button>
					</div>
					<div class="btn-group-lg col-lg-12" role="group" align="center"
						style="text-align: center; margin-top: 5%;">
						<c:choose>
							<c:when test="${sessionScope.btn != 1}">
								<button type="button" class="btn-lg"
									style="color: white; background-color: #ff9b19; border: 1px solid #f3f3f3"
									onclick="location.href='recipe.action'">뒤로가기</button>
								<button type="button" class="btn-lg"
									style="color: white; background-color: green; border: 1px solid green;"
									onclick="location.href='recipeupdateform.action?r_id=${recipeContent.r_id }'">수정하기</button>
								<button type="button" class="btn-lg"
									style="color: white; background-color: red; border: 1px solid red;"
									onclick="location.href='recipedeleteform.action?r_id=${recipeContent.r_id }'">삭제하기</button>
							</c:when>
							<c:when test="${sessionScope.btn == 1 }">
								<button type="button" class="btn-lg"
									style="color: white; background-color: #ff9b19; border:1px solid #f3f3f3;"
									onclick="location.href='recipe.action'">뒤로가기</button>
							</c:when>
						</c:choose>
					</div>
					
					
				</div>



			</div>
			<!-- /.blog-main -->


			<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
				<div class="sidebar-module sidebar-module-inset"
					style="margin-top: 10%; text-align: center;">
					<ul class="list-group">
						<li class="list-group-item"><a href="EventInsert.jsp">이벤트
								등록(사업자 전용)</a></li>
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