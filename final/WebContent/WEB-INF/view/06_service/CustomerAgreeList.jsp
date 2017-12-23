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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style type="text/css">
.sidebar-module {
	margin-top: 10%;
	text-align: center;
}

.scrollspy-example {
	position: relative;
	height: 400px;
	margin-top: 10px;
	overflow: auto;
}
</style>
</head>
<body>

	<div class="blog-header">
		<c:import url="../00_main/Menu.jsp"></c:import>
	</div>

	<div class="container" style="width: 1200px;">

		<div class="row">

			<div class="col-sm-8 blog-main">
				<div>
					<div class="m_list_tit" style="margin-bottom: 30px;">
						<h3>이용약관</h3>
						<hr>
					</div>

					<div class="container" style="width: 750px;">
						<c:forEach var="tm" items="${tmList }">
						<nav id="navbar-example"
							class="navbar navbar-default navbar-static" role="navigation"
							style="margin-top: 3%;">
							<div class="container-fluid">
								<div class="navbar-header text-center">
									<a class="navbar-brand">${tm.tm_title }</a>
								</div>

							</div>
						</nav>
						<div data-spy="scroll" data-target="#navbar-example"
							data-offset="0" class="scrollspy-example">
							<img alt="이용약관" src="${tm.tm_img }">
						</div>
						</c:forEach>
					</div>

				</div>

			</div>
			<!-- /.blog-main -->
			<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
				<div class="sidebar-module sidebar-module-inset">
					<ul class="list-group">
						<li class="list-group-item"><a href="customeragreelist.action">이용약관</a></li>
						<li class="list-group-item"><a href="customertablelist.action">1:1
								문의</a></li>
					</ul>
				</div>
				<div class="sidebar-module">
					<c:import url="../00_main/ADLine.jsp" />
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