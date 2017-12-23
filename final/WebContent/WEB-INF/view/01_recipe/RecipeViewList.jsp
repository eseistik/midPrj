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

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Customer CSS -->
<link rel="stylesheet" href="css/recipe/style.css" />

<style type="text/css">
.thumbnail>.caption {
	text-decoration: none;
}

.sidebar-module {
	margin-top: 10%;
	text-align: center;
}

/* GENERAL STYLES */
.pagination {
	padding: 30px 0;
}

.pagination ul {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

.pagination a {
	display: inline-block;
	padding: 10px 18px;
	color: #222;
}

/* ONE */
.p1 a {
	width: 40px;
	height: 40px;
	line-height: 40px;
	padding: 0;
	text-align: center;
}

.p1 a.is-active {
	background-color: #ff9b19;
	border-radius: 100%;
	color: #fff;
}

strong {
	color: #ff9b19;
}

.category a:link, .category a:visited {
	color: #000;
	text-decoration: none;
}

.category a:hover {
	color: #000;
	background: #e9e9e9;
	text-decoration: none;
}

.categoryName {
	margin: 5px;
}
</style>

<script type="text/javascript">

$(function ()
{
	var type = "<%=(String)session.getAttribute("type")%>"
        
    if(type == "2")
    {
    	$("#test").css("display","none");
    }        

 });
</script>

</head>
<body>
	<c:import url="../00_main/Menu.jsp" />

	<div class="container" style="width: 1200px;">

		<div class="row">

			<div class="col-sm-8 blog-main">
				<div class="m_list_tit text-center" style="margin-bottom: 30px;">
				</div>
				<div class="bestrecipe-list">
					<div class="col-xs-12 viewlist-head"
						style="font-size: 18pt; margin-bottom: 2%;">
						이주의 <strong>베스트 레시피</strong>
					</div>
					<div class="col-md-12">
						<c:forEach var="recipeBest" items="${recipeBest }">
							<div class="col-xs-4">
								<a class="thumbnail"
									href="recipeContent.action?r_id=${recipeBest.r_id }"
									style="text-decoration: none"> <img
									src="<%=cp %>${recipeBest.r_main_img }"
									style="width: 275px; height: 225px;">
									<div class="caption">
										<h4 class="ellipsis_title2">${recipeBest.r_title }</h4>
										<p>by ${recipeBest.u_nickname }</p>
									</div>
								</a>
								<div
									style="position: absolute; top: 365px; width: 100%; text-align: right; right: 20px;">
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="col-xs-7 viewlist-head" style="font-size: 17pt;">
					총 <strong>${recipeCount }</strong> 개의 맛있는 레시피가 있습니다.
				</div>
				<div class="col-xs-5 text-right" style="margin-bottom: 30px;">
					<div class="dropdown btn-group">
						<button id="brandname" aria-expanded="false" aria-haspopup="true"
							role="button" data-toggle="dropdown"
							class="btn btn-default dropdown-toggle">카테고리</button>
						<ul id="brandmenu" class="dropdown-menu"
							style="margin-left: -30px; width: 400px; padding: 20px;">
							<div class="category">
								<c:forEach var="type" items="${typeList }">
									<c:choose>
										<c:when test="${type.fd_type_id == 1 }">
											<strong class="categoryName">${type.fd_type_name }</strong>
										</c:when>
										<c:otherwise>
											<a class="categoryName"
												href="recipeCategory.action?type=type&name=${type.fd_type_name }">${type.fd_type_name }</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
							<div class="category">
								<c:forEach var="stu" items="${stateList }">
									<c:choose>
										<c:when test="${stu.fd_stu_id == 1 }">
											<strong class="categoryName">${stu.fd_stu_name }</strong>
										</c:when>
										<c:otherwise>
											<a class="categoryName"
												href="recipeCategory.action?type=state&name=${stu.fd_stu_name }">${stu.fd_stu_name }</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</ul>
					</div>
					<a href="recipe.action" class="btn btn-default">최신순</a> <a
						href="recipeRecommend.action" class="btn btn-default">추천순</a>
				</div>

				<div class="recipe-list col-md-12">
					<c:forEach var="recipeList" items="${recipeList }">
						<div class="col-xs-4" style="height: 360px;;">
							<a class="thumbnail"
								href="recipeContent.action?r_id=${recipeList.r_id }"
								style="text-decoration: none"> <img
								src="${recipeList.r_main_img }"
								style="width: 275px; height: 225px;">
							</a>
							<div class="caption">
								<h4 class="ellipsis_title2">${recipeList.r_title }</h4>
								<p>by ${recipeList.u_nickname }</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- /.blog-main -->

			<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
				<div class="sidebar-module sidebar-module-inset">
					<ul class="list-group">
						<li class="list-group-item"><a href="recipe.action">레시피</a></li>
						<li class="list-group-item"><a
							href="RecipeRequestViewList.jsp">레시피 요청</a></li>

						<li class="list-group-item" id="test">
						<a href="/99_Dispatcher/recipeinsertform.action">레시피 등록</a></li>
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