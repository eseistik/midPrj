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
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/brand/table.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/brand/starrate.css">

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
</style>
<script type="text/javascript">
	function urlCreate() {
		var b_id = document.getElementById("b_id").value;
		//테스트
		//alert(r_id);
		prompt("ctrl + c 버튼을 동시에 눌러 주세요.",
				"http://localhost:8090/02_Controller/BrandContent.action?b_id="
						+ b_id);

	};

	function rating() {
		var u_id = document.getElementById("u_id").value;
		var b_id = document.getElementById("b_id").value;
		var popUrl = "BratingviewList.action?b_id=" + b_id + "&u_id=" + u_id; //팝업창에 출력될 페이지 URL

		var popOption = "width=500, height=500, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)

		window.open(popUrl, "", popOption);
	};

	$(document).ready(function() {
		var five = $("#scoreFive").html();
		var four = $("#scoreFour").html();
		var three = $("#scoreThree").html();
		var two = $("#scoreTwo").html();
		var one = $("#scoreOne").html();

		/* alert(five+", "+four+", "+three+", "+two+", "+one);
		alert(five);
		alert(five+'0%');
		 */

		$('.bar span').hide();
		$('#bar-five').animate({
			width : five + '%'
		}, 1000);
		$('#bar-four').animate({
			width : four + '%'
		}, 1000);
		$('#bar-three').animate({
			width : three + '%'
		}, 1000);
		$('#bar-two').animate({
			width : two + '%'
		}, 1000);
		$('#bar-one').animate({
			width : one + '%'
		}, 1000);

		setTimeout(function() {
			$('.bar span').fadeIn('slow');
		}, 1000);

	});
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
						<input type="hidden" value="${brand.b_id }" id="b_id" name="b_id">
						<img src="${brand.b_main_img }" style="width: 100%;">
						<div class="text-center"
							style="width: 100px; height: 100px; margin: -50px auto;">
							<img src="${brand.p_profile_img }">
							<h4 style="margin-top: 20px">${brand.bs_name }</h4>
						</div>
						<div class="view2_summary">
							<h2 align="center" style="margin-top: 20%;">${brand.b_title }</h2>
							<div
								style="margin-top: 5%; font-size: 15px; color: #414141; font-style: italic; text-align: center;">
								${brand.b_content }</div>
							<div style="margin: 5% 0px auto;">
								<div class="cook-subInfo-list col-md-5">
									<div style="padding-left: 30%;">
										<div class="cook-subInfo" id="cooking-timeLimit">
											<img alt="인분" src="images/recipe/iconmonstr-user-31-32.png">
											<div class="cook-subInfo-value">
												<div style="color: #999;">${brand.pp_name }</div>
											</div>
										</div>
										<div class="cook-subInfo" id="cooking-count">
											<img alt="시간" src="images/recipe/iconmonstr-time-9-32.png">
											<div class="cook-subInfo-value">
												<div style="color: #999;">${brand.ct_name }</div>
											</div>
										</div>
										<div class="cook-subInfo" id="cooking-location">
											<img alt="난이도" src="${brand.dif_img }">
											<div class="cook-subInfo-value">
												<div style="color: #999;">${brand.dif_name }</div>
											</div>
										</div>
										<div class="cook-subInfo" id="cooking-location">
											<img alt="url" src="images/recipe/iconmonstr-link-1-24.png">
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
											<span class="rating-num">${brand.avg }</span>
											<div class="rating-stars">
												<span><i class="active icon-star"></i></span> <span><i
													class="active icon-star"></i></span> <span><i
													class="active icon-star"></i></span> <span><i
													class="active icon-star"></i></span> <span><i
													class="icon-star"></i></span>
											</div>
											<div class="rating-users">
												<i class="icon-user"></i> ${brandStarJoin } total
											</div>
										</div>

										<div class="histo">
											<c:forEach var="score" items="${brandStar }">
												<c:choose>
													<c:when test="${score.b_star_score == 5 }">
														<div class="five histo-rate">
															<span class="histo-star"> <i
																class="active icon-star"></i> 5
															</span> <span class="bar-block"> <span id="bar-five"
																class="bar"> <span class="barSpan" id="scoreFive">${score.count }</span>&nbsp;
															</span>
															</span>
														</div>
													</c:when>

													<c:when test="${score.b_star_score == 4 }">
														<div class="four histo-rate">
															<span class="histo-star"> <i
																class="active icon-star"></i> 4
															</span> <span class="bar-block"> <span id="bar-four"
																class="bar"> <span class="barSpan" id="scoreFour">${score.count }</span>&nbsp;
															</span>
															</span>
														</div>
													</c:when>

													<c:when test="${score.b_star_score == 3 }">
														<div class="three histo-rate">
															<span class="histo-star"> <i
																class="active icon-star"></i> 3
															</span> <span class="bar-block"> <span id="bar-three"
																class="bar"> <span class="barSpan"
																	id="scoreThree">${score.count }</span>&nbsp;
															</span>
															</span>
														</div>
													</c:when>

													<c:when test="${score.b_star_score == 2 }">
														<div class="two histo-rate">
															<span class="histo-star"> <i
																class="active icon-star"></i> 2
															</span> <span class="bar-block"> <span id="bar-two"
																class="bar"> <span class="barSpan" id="scoreTwo">${score.count }</span>&nbsp;
															</span>
															</span>
														</div>
													</c:when>

													<c:when test="${score.b_star_score == 1 }">
														<div class="one histo-rate">
															<span class="histo-star"> <i
																class="active icon-star"></i> 1
															</span> <span class="bar-block"> <span id="bar-one"
																class="bar"> <span class="barSpan" id="scoreOne">${score.count }</span>&nbsp;
															</span>
															</span>
														</div>
													</c:when>
												</c:choose>
											</c:forEach>
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
							<c:forEach var="brandIng" items="${brandIng }">
								<div class="ingredients">
									<p class="col-md-6 ingredient">${brandIng.mid_ing_name }</p>
									<p class="col-md-3 price"></p>
									<p class="col-md-3 price">${brandIng.b_ing_weight }${brandIng.unit_name }</p>
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
							<c:forEach var="brandStep" items="${brandStep }">
								<div id="stepDiv${brandStep.b_step_id }"
									class="view_step_cont media step${brandStep.b_step_id }">
									<div id="stepdescr${brandStep.b_step_id }" class="media-body">
										<img class="recipe-step"
											src="images/recipe/numbers/${brandStep.b_step_id }.PNG"
											style="width: 25px; margin: 2%;">${brandStep.b_step_content }
									</div>
									<div id="stepimg${brandStep.b_step_id }" class="media-right">
										<img class="recipe-foodImage" src="${brandStep.b_step_img }"
											style="width: 350px;">
									</div>
								</div>
							</c:forEach>
						</div>

						<div id="completeimgs" class="carousel slide" data-ride="carousel"
							style="width: 500px; margin: 5% auto;">
							<ol class="carousel-indicators">
								<li data-target="#completeimgs" data-slide-to="0" class=""></li>
								<li data-target="#completeimgs" data-slide-to="1" class=""></li>
								<li data-target="#completeimgs" data-slide-to="2" class=""></li>
								<li data-target="#completeimgs" data-slide-to="3" class="active"></li>
							</ol>
							<div class="carousel-inner" role="listbox">
								<c:forEach var="brandPic" items="${brandPic }">
									<c:choose>
										<c:when test='${brandPic.b_cl_id == 1 }'>
											<div class="item active">
												<div class="carouItem centercrop">
													<img src="${brandPic.b_cl_img }" style="width: 500px;">
												</div>
											</div>
										</c:when>

										<c:otherwise>
											<div class="item">
												<div class="carouItem centercrop">
													<img src="${brandPic.b_cl_img }" style="width: 500px;">
												</div>
											</div>
										</c:otherwise>
									</c:choose>
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

						<div style="text-align: center; margin-bottom: 3%;">
							<button type="button" class="btn btn-default btn-lg"
								id="brand-link" onclick="location.href='${brand.b_url}'">구매하러
								가기</button>
						</div>

						<div class="view_notice"
							style="background-color: #eeeeee; border-radius: 10px; margin: auto;">
							<p class="view_notice_date col-xs-4">
								<span style="font-size: 11pt;">등록일 : ${brand.b_date }</span>
							</p>
							<p>
								<span style="font-size: 9pt; color: gray;">저작자의 사전 동의 없이
									이미지 및 문구의 무단 도용 및 복제를 금합니다.</span>
							</p>
						</div>
					</div>
				</div>

				<!--/media reply_list -->
				<div class="panel panel-default">
					<div class="panel-body">
						<div style="text-align: right;">
							<button type="button" class="btn btn-default" onclick="rating();">별점
								평가</button>
						</div>

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
										onclick="location.href='recipedeleteform.action?r_id=${recipeContent.r_id }'">삭제하기</button>
								</c:when>
								<c:when test="${sessionScope.btn == 1 }">
									<button type="button" class="btn-lg"
										style="color: white; background-color: #ff9b19; border: 1px solid #f3f3f3;"
										onclick="history.back()">뒤로가기</button>
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
						<li class="list-group-item"><a href="BrandInsertForm.jsp">브랜드
								등록(사업자 전용)</a></li>
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