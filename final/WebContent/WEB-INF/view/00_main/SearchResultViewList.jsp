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
<title>SearchResultViewList.jsp</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="css/style.css" />
</head>
<body>

	<c:import url="../00_main/Menu.jsp" />

	<div class="container" style="width: 1200px;">

		<div class="row">

			<div class="col-sm-8 blog-main">

				<div class="col-xs-12 viewlist-head"style="font-size: 15pt; margin-top: 30px; margin-bottom: 20px;">
					총 <strong>${searchcount }</strong> 개의 레시피가 있습니다.
					<br>
				</div>
				<div class="col-md-12">
					<c:forEach var="list" items="${searchList }">
							<div class="col-xs-4">
								<a class="thumbnail"
									href="recipeContent.action?r_id=${list.r_id }"
									style="text-decoration: none"> <img
									src="<%=cp %>${list.r_main_img }"
									style="width: 275px; height: 225px;">
									<div class="caption">
										<h4 class="ellipsis_title2">${list.r_title }</h4>
										<p>by ${list.u_nickname }</p>
									</div>
								</a>
								<div
									style="position: absolute; top: 365px; width: 100%; text-align: right; right: 20px;">
								</div>
							</div>
					</c:forEach>
				</div>
			</div>
			
			<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
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

