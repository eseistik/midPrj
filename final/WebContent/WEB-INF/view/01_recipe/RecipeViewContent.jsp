<%@page import="com.mid.dto.CommentReplyDTO"%>
<%@page import="com.mid.dto.RecipeCommentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	HttpSession Session = request.getSession();
	String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛있당</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/recipe/table.css">
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/recipe/starrate.css">
<style type="text/css">
.cook-subInfo-list {
	text-align: center;
}

.cook-subInfo {
	text-align: center;
	display: inline-block;
	margin: 5%;
}

.cook-subInfo-list .cook-subInfo .cook-subInfo-value {
	margin-top: 2%;
}

.cook-subInfo-value a:link, .cook-subInfo-value a:visited,
	.cook-subInfo-value a:hover {
	color: #999;
	text-decoration: none;
}

.sidebar-module {
	text-align: center;
}

.view-tag {
	background: url("images/recipe/icon_tag.png") left top no-repeat;
	background-size: 25px;
	padding: 0 0 20px 34px;
	line-height: 1.5;
	margin: 0 40px;
}

.view-tag a {
	color: #ff9b19;
	margin: 0 4px 6px;
	background-color: #f2f2f2;
	padding: 1px 5px;
	display: inline-block;
}
</style>
<script type="text/javascript">
	function urlCreate() {
		var r_id = document.getElementById("r_id").value;
		//테스트
		//alert(r_id);
		prompt("ctrl + c 버튼을 동시에 눌러 주세요.", "http://localhost:8090/02_Controller/recipeContent.action?r_id=" + r_id);

	};

	function declare() {
		var u_id = document.getElementById("u_id").value;
		var report_u_id = document.getElementById("report_u_id").value;
		var popUrl = "reportviewList.action?u_id="+u_id+"&report_u_id="+report_u_id; //팝업창에 출력될 페이지 URL

		var popOption = "width=500, height=500, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)

		window.open(popUrl, "", popOption);
	};

	function rating() {
		var u_id = document.getElementById("u_id").value;
		var r_id = document.getElementById("r_id").value;
		var popUrl = "ratingviewList.action?r_id=" + r_id + "&u_id=" + u_id; //팝업창에 출력될 페이지 URL

		var popOption = "width=500, height=500, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)

		window.open(popUrl, "", popOption);
	};

	$(document).ready(function() {
		var five = $("#starFive").html()*10;
		var three = $("#starFour").html()*10;
		var one = $("#starThree").html()*10;
		
		//테스트
		/* alert(five+", "+three+", "+one);
		alert(five); */
		
		$('.bar span').hide();
		$('#bar-five').animate({
			width : five+'%'
		}, 1000);
		$('#bar-three').animate({
			width : three+'%'
		}, 1000);
		$('#bar-one').animate({
			width : one+'%'
		}, 1000);

		setTimeout(function() {
			$('.bar span').fadeIn('slow');
		}, 1000);

	});
</script>

<script type="text/javascript">


$(function ()
{
	var type = "<%=(String) session.getAttribute("type")%>"

		if (type == "2")
		{
			$("#test").css("display", "none");
		}

	});
</script>

<script type="text/javascript">

	function check()
	{
		
		if (confirm("정말 삭제하시겠습니까?") == true)
		{
			
			   location.href="recipedeleteform.action?r_id="+${recipeContent.r_id};
		}
	}
</script>
</head>
<body>
	<c:import url="../00_main/Menu.jsp"></c:import>

	<div class="container" style="width: 1200px;">

		<div class="row" style="margin-top: 3%;">

			<div class="col-sm-8 blog-main">
				<div class="panel panel-default">
					<div class="panel-body">
						<input type="hidden" value="<%=id%>" id="u_id" name="u_id">
						<input type="hidden" value="${recipeContent.u_id }"
							id="report_u_id" name="report_u_id"> <input type="hidden"
							value="${recipeContent.r_id }" id="r_id" name="r_id"> <img
							src="${recipeContent.r_main_img }" style="width: 100%;">
						<div class="text-center"
							style="width: 100px; height: 100px; margin: -50px auto;">
							<img src="${recipeContent.u_profile_img }">
							<h4 style="margin-top: 20px">${recipeContent.u_nickname }</h4>
						</div>
						<div class="view2_summary">
							<h2 align="center" style="margin-top: 20%;">${recipeContent.r_title }</h2>
							<div
								style="margin-top: 5%; font-size: 15px; color: #414141; font-style: italic; text-align: center;">
								${recipeContent.r_content }</div>
							<div style="margin: 5% 0px auto;">
								<div class="cook-subInfo-list col-md-5">
									<div style="padding-left: 30%;">
										<div class="cook-subInfo" id="cooking-timeLimit">
											<img alt="인분" src="images/recipe/iconmonstr-user-31-32.png">
											<div class="cook-subInfo-value">
												<div style="color: #999;">${recipeContent.pp_name }</div>
											</div>
										</div>
										<div class="cook-subInfo" id="cooking-count">
											<img alt="시간" src="images/recipe/iconmonstr-time-9-32.png">
											<div class="cook-subInfo-value">
												<div style="color: #999;">${recipeContent.ct_name }</div>
											</div>
										</div>
										<div class="cook-subInfo" id="cooking-location">
										
										<img alt="" src="<%=cp %>/images/recipe/iconmonstr-star-1-24.png">
											<div class="cook-subInfo-value">
												<div style="color: #999;">${recipeContent.dif_name }</div>
											</div>
										</div>
										<div class="cook-subInfo" id="cooking-location">
											<a href="JavaScript:urlCreate();"><img alt="url" src="images/recipe/iconmonstr-link-1-24.png"></a>
											<div class="cook-subInfo-value">
												<div>
													<a href="JavaScript:urlCreate();">url 공유</a>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="container col-md-7">
									<div class="inner">
										<div class="rating">
											<span class="rating-num">${recipeStar.total }</span>
											<div class="rating-stars">
												<span><i class="active icon-star"></i></span> <span><i
													class="active icon-star"></i></span> <span><i
													class="active icon-star"></i></span> <span><i
													class="active icon-star"></i></span> <span><i
													class="icon-star"></i></span>
											</div>
											<div class="rating-users">
												<i class="icon-user"></i> ${recipeStarJoin } total
											</div>
										</div>

										<div class="histo">
											<div class="five histo-rate">
												<span class="histo-star"> 맛 </span> <span class="bar-block">
													<span id="bar-five" class="bar"> <span id="starFive">${recipeStar.taste }</span>&nbsp;
												</span>
												</span>
											</div>

											<div class="four histo-rate">
												<span class="histo-star"> 편의성 </span> <span
													class="bar-block"> <span id="bar-three" class="bar">
														<span id="starFour">${recipeStar.simple }</span>&nbsp;
												</span>
												</span>
											</div>

											<div class="three histo-rate">
												<span class="histo-star"> 창의성 </span> <span
													class="bar-block"> <span id="bar-one" class="bar">
														<span id="starThree">${recipeStar.creative }</span>&nbsp;
												</span>
												</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">재료</h4>
					</div>
					<div class="panel-body">
						<div class="col-md-6 ingredient-list">
							<h4>[재료]</h4>
							<c:forEach var="ing" items="${recipeIng }">
								<div class="ingredients">
									<p class="col-md-6 ingredient">${ing.mid_ing_name }</p>
									<p class="col-md-2 price"></p>
									<p class="col-md-4 price">${ing.r_ing_weight }
										${ing.unit_name }</p>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">조리 순서</h4>
					</div>
					<div class="panel-body">
						<div class="recipe-process">
							<c:forEach var="step" items="${recipeStep }">
								<div id="stepDiv${step.r_step_id }"
									class="view_step_cont media step${step.r_step_id }">
									<div id="stepdescr${step.r_step_id }" class="media-body">
										<img class="recipe-step"
											src="<%=cp %>/images/recipe/numbers/${step.r_step_id }.PNG"
											style="width: 25px; margin: 2%;">${step.r_step_content }
									</div>
									<div id="stepimg${step.r_step_id }" class="media-right">
										<img class="recipe-foodImage" src="${step.r_step_img }"
											style="width: 350px;">
									</div>
								</div>
							</c:forEach>
						</div>

						<div id="completeimgs" class="carousel slide" data-ride="carousel"
							style="width: 500px; margin: 5% auto;">
							<ol class="carousel-indicators">
								<li data-target="#completeimgs" data-slide-to="0" class="active"></li>
								<li data-target="#completeimgs" data-slide-to="1" class=""></li>
								<li data-target="#completeimgs" data-slide-to="2" class=""></li>
								<li data-target="#completeimgs" data-slide-to="3" class=""></li>
							</ol>
							<div class="carousel-inner" role="listbox">

								<c:forEach var="recipePic" items="${recipePic }" begin="0"
									end="0">
									<div class="item active">
										<div class="carouItem centercrop">
											<img src="${recipePic.r_cl_img }" style="width: 500px;">
										</div>
									</div>
								</c:forEach>

								<c:forEach var="recipePic" items="${recipePic }" begin="1">
									<div class="item">
										<div class="carouItem centercrop">
											<img src="${recipePic.r_cl_img }" style="width: 500px;">
										</div>
									</div>
								</c:forEach>
							</div>
							<a class="left carousel-control" href="#completeimgs"
								role="button" data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							</a> <a class="right carousel-control" href="#completeimgs"
								role="button" data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							</a>
						</div>

						<div class="view-tag">
							<c:forEach items='${recipe.getR_tag().split(",") }' var="re">
								<a href="#">${re }</a>
							</c:forEach>
						</div>

						<div class="view_notice"
							style="background-color: #eeeeee; border-radius: 10px; margin: auto;">
							<p class="view_notice_date col-xs-4">
								<span style="font-size: 11pt;">등록일 :
									${recipeContent.r_date }</span>
							</p>
							<p>
								<span style="font-size: 9pt; color: gray;">저작자의 사전 동의 없이
									이미지 및 문구의 무단 도용 및 복제를 금합니다.</span>
							</p>
						</div>

						<div style="text-align: right;">
							<button type="button" class="btn btn-default"
								onclick="declare();">신고</button>
							<button type="button" class="btn btn-default" onclick="rating();">별점
								평가</button>
						</div>
					</div>
				</div>

				<!--/media reply_list -->
				<div class="panel panel-default">
					<div class="panel-body">
						<c:forEach var="recipeComment" items="${recipeComment }">
							<div class="comment col-md-12">
								<div style="margin: 3%; float: left;">
									<img alt="프로필" src="${recipeComment.u_profile_img }">
								</div>
								<div id="comment-info" style="float: left; margin-top: 4%;">
									<h4 class="media-heading">
										<strong class="info_name_f" onclick=""
											style="cursor: pointer;">${recipeComment.u_nickname }</strong><small>
											${recipeComment.r_co_date } <a href="#">답변</a> <span>|</span><a
											href="JavaScript:declare();">신고</a>
										</small>
									</h4>
									<div class="cooking-reply" style="font-size: 15px;">
										${recipeComment.r_co_content }</div>
								</div>
							</div>
						</c:forEach>

						<form id="area_dv" class="input-group"
							action="recipeCommentInsert.action" method="get"
							style="position: relative; margin: 2% 0;">
							<input type="hidden" value="${recipeContent.r_id }" id="r_id"
								name="r_id">
							<textarea name="r_co_content" id="r_co_content"
								class="form-control" placeholder=""
								style="height: 100px; width: 640px; resize: none;"></textarea>
							<span class="input-group-btn" style="margin-top: 2%;"><button
									id="reply_submit_btn" class="btn btn-default" type="submit"
									style="height: 100px; width: 100px;">등록</button></span>
						</form>

						<div class="btn-group-lg col-lg-12" role="group" align="center"
							style="padding: 3%;">

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
										onclick="check()">삭제하기</button>
								</c:when>
								<c:when test="${sessionScope.btn == 1 }">
									<button type="button" class="btn-lg"
										style="color: white; background-color: #ff9b19; border: 1px solid #f3f3f3;"
										onclick="location.href='recipe.action'">뒤로가기</button>
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
			<!-- /.container -->
			<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
				<div class="sidebar-module sidebar-module-inset">
					<ul class="list-group">
						<li class="list-group-item"><a href="recipe.action">레시피</a></li>
						<li class="list-group-item"><a
							href="RecipeRequestViewList.jsp">레시피 요청</a></li>

						<li class="list-group-item" id="test"><a
							href="/99_Dispatcher/recipeinsertform.action">레시피 등록</a></li>
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