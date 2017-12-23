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
<link rel="stylesheet" href="<%=cp%>/css/mytalk/style.css" />
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/mytalk/page.css">
<script type="text/javascript">
	function followerList() {
		var popUrl = "followerList.action?u_id=coyo4"; //팝업창에 출력될 페이지 URL
	
		var popOption = "width=370, height=310, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)
	
		window.open(popUrl, "", popOption);
	}
	
	function followingList() {
		var popUrl = "followingList.action?u_id=coyo4"; //팝업창에 출력될 페이지 URL
	
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
				<div class="blog-header">
					<ul class="nav nav-tabs nav-justified" style="position: relative;">
						<li role="presentation"><a href="myTalk.action"><span
								class="glyphicon glyphicon-list-alt"></span>알림</a></li>
						<li role="presentation" class="active"><a
							href="myTalkRecipe.action"><span
								class="glyphicon glyphicon-cutlery"></span>레시피</a></li>
						<li role="presentation"><a href="myTalkComment.action"><span
								class="glyphicon glyphicon-comment"></span>댓글</a></li>
						<li role="presentation"><a href="myTalkTalk.action"><span
								class="glyphicon glyphicon-user"></span>토크</a></li>
					</ul>
				</div>
				<div class="row">
					<div class="col-md-12">
						<c:forEach var="recipe" items="${myRecipeList }">
						<div class="col-xs-3">
							<a class="thumbnail" href="recipeContent.action?r_id=${recipe.r_id }"
								style="text-decoration: none"> <img
								src="${recipe.r_main_img }"
								style="width: 225px; height: 125px;">
								<div class="caption">
									<h4 class="ellipsis_title2">${recipe.r_title }</h4>
									<p>by ${recipe.u_nickname }</p>
								</div>
							</a>
						</div>
						</c:forEach>
					</div>
				</div>


			</div>
			<!-- /.blog-main -->

			<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
				<div class="myhome_main"
					style="margin-bottom: 20px; border: 1px solid #eee;" align="center">
					<div class="myhome_main_info">
						<div class="info_pic">
							<a href=""><img class="img-circle"
								src="${myTalkInfo.u_profile_img }"></a>
						</div>
						<p class="info_name">
							<strong>${myTalkInfo.u_nickname }</strong>
						</p>
						<div class="info_follow2">
							<a href="javascript:followerList();">팔로워<strong>&nbsp;${followerCount }</strong></a><span>&nbsp;·</span>
							<a href="javascript:followingList();">팔로잉<strong>&nbsp;${followingCount }</strong></a>
						</div>
						<button type="button" class="btn btn-default btn-sm" id="follow"
							onclick="" style="margin: 20px 0;">Follow</button>
					</div>
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