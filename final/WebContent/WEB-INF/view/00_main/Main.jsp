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
<!-- Bootstrap core CSS -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- jQuery Google CDN -->
<script type="text/javascript" src="js/main/jquery-3.2.1.min.js"></script>
<!-- Custom styles -->
<link href="<%=cp%>/css/main/3-col-portfolio.css" rel="stylesheet">
</head>
<body>
	<!-- Web Main Menu -->
	<div class="main">
		<c:import url="../00_main/Menu.jsp"></c:import>
	</div>
	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="col-md-9">	
				<!-- Page Heading -->
				
				<div class="Head-line">
				
					<h3 class="my-4">
						<small>오졌다리 오졌다</small><br> 맛이 오져 버리는 레시피
					</h3>
				</div>
				<div class="row">
					<c:choose>
						<c:when test="${f_id == null }">
							<div class="col-lg-12 col-sm-12 portfolio-item" > 조회된 레시피가 없습니다.</div>
						</c:when>
						<c:otherwise>
							<c:forEach var="flist" items="${fList }">
								<div class="col-lg-4 col-sm-6 portfolio-item">
									<div class="card h-95">
										<a href="recipeContent.action?r_id=${flist.r_id }">
										<img class="card-img-top" src="${flist.r_main_img }" alt="그림"></a>
										<div class="card-body">
											<h5 class="card-title">
												<a href="recipeContent.action?r_id=${flist.r_id }">${flist.r_title }</a>
											</h5>
											<div>
												<c:choose>
													<c:when test="${flist.avg == '1' }">
														<img src="<%=cp%>/images/main/star_1.png">
													</c:when>
													<c:when test="${flist.avg == '2' }">
														<img src="<%=cp%>/images/main/star_2.png">
													</c:when>
													<c:when test="${flist.avg == '3' }">
														<img src="<%=cp%>/images/main/star_3.png">
													</c:when>
													<c:when test="${flist.avg == '4' }">
														<img src="<%=cp%>/images/main/star_4.png">
													</c:when>
													<c:when test="${flist.avg == '5' }">
														<img src="<%=cp%>/images/main/star_5.png">
													</c:when>
												</c:choose>
											</div>
											<p class="card-text">by ${flist.u_nickname }</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>

				<!-- Page Heading -->
				<div class="Head-line">
					<h3 class="my-4">
						<small>둘이 먹다가 하나가 죽어도 모를</small><br> 이달의 베스트 레시피
					</h3>
				</div>
				<div class="row">
							<c:forEach var="blist" items="${bList }">
								<div class="col-lg-4 col-sm-6 portfolio-item">
									<div class="card h-95">
										<a href="recipeContent.action?r_id=${blist.r_id }">
										<img class="card-img-top" src="${blist.r_main_img }" alt="그림"></a>
										<div class="card-body">
											<h5 class="card-title">
												<a href="recipeContent.action?r_id=${blist.r_id }">${blist.r_title }</a>
											</h5>
											<div>
												<c:choose>
													<c:when test="${blist.avg == '1' }">
														<img src="<%=cp%>/images/main/star_1.png">
													</c:when>
													<c:when test="${blist.avg == '2' }">
														<img src="<%=cp%>/images/main/star_2.png">
													</c:when>
													<c:when test="${blist.avg == '3' }">
														<img src="<%=cp%>/images/main/star_3.png">
													</c:when>
													<c:when test="${blist.avg == '4' }">
														<img src="<%=cp%>/images/main/star_4.png">
													</c:when>
													<c:when test="${blist.avg == '5' }">
														<img src="<%=cp%>/images/main/star_5.png">
													</c:when>
												</c:choose>
											</div>
											<p class="card-text">by ${blist.u_nickname }</p>
										</div>
									</div>
								</div>
							</c:forEach>
				</div>

				<!-- Page Heading -->
				<div class="Head-line">
					<h3 class="my-4">
						<small>새로 나온 건 바로 사 주는 편이야~</small><br> 베스트 제품·재료
					</h3>
				</div>
				<div class="row">
					<c:forEach var="bblist" items="${bbList }">
								<div class="col-lg-4 col-sm-6 portfolio-item">
									<div class="card h-95">
										<a href="brandContent.action?b_id=${bblist.b_id }">
										<img class="card-img-top" src="${bblist.b_main_img }" alt="그림"></a>
										<div class="card-body">
											<h5 class="card-title">
												<a href="brandContent.action?b_id=${bblist.b_id }">${bblist.b_title }</a>
											</h5>
											<div>
												<c:choose>
													<c:when test="${bblist.avg == '1' }">
														<img src="<%=cp%>/images/main/star_1.png">
													</c:when>
													<c:when test="${bblist.avg == '2' }">
														<img src="<%=cp%>/images/main/star_2.png">
													</c:when>
													<c:when test="${bblist.avg == '3' }">
														<img src="<%=cp%>/images/main/star_3.png">
													</c:when>
													<c:when test="${bblist.avg == '4' }">
														<img src="<%=cp%>/images/main/star_4.png">
													</c:when>
													<c:when test="${bblist.avg == '5' }">
														<img src="<%=cp%>/images/main/star_5.png">
													</c:when>
												</c:choose>
											</div>
											<p class="card-text">by ${bblist.u_nickname }</p>
										</div>
									</div>
								</div>
							</c:forEach>
				</div>
			</div>

			<div class="col-md-3">
				<!-- Ranking Head -->
				<div>
					<img src="<%=cp%>/images/main/rankinglogo.png"
						style="width: 300px; margin-top: 50px;">
				</div>
				<!-- Ranking Body -->
				<div class="row rank-body">
					<!-- rank -->
					<div class="col-md-3">
						<strong>순위</strong>
						<c:forEach var="rank"  items="${riceRank }">
							<p>${rank.rank }</p>
						</c:forEach>
					</div>

					<!-- nickname -->
					<div class="col-md-6">
						<strong>닉네임</strong>
						<c:forEach var="rank"  items="${riceRank }">
							<p>${rank.u_nickname }</p>
						</c:forEach>
					</div>

					<!-- point -->
					<div class="col-md-3">
						<strong>밥알</strong>
						<c:forEach var="rank"  items="${riceRank }">
							<p>${rank.point }</p>
						</c:forEach>
					</div>
				</div>
				<c:import url="ADLine.jsp" />
			</div>

		</div>
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer>
		<c:import url="Copyright.jsp" />
	</footer>
</body>
</html>