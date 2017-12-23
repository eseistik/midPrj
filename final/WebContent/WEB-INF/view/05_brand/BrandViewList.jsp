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

<!-- Customer CSS -->
<link rel="stylesheet" href="css/brand/style.css" />
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/brand/table.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/brand/page.css">

<script type="text/javascript">
	$(document).ready(function() {
		$("#brandmenu li a").click(function() {
			$("#brandname").text($(this).text());
		});

		$("#couponmenu li a").click(function() {
			$("#couponname").text($(this).text());
		});
	});
</script>
<style type="text/css">
.thumbnail>.caption {
	text-decoration: none;
}

.sidebar-module {
	margin-top: 10%;
	text-align: center;
}

#coupon-err {
	color: red;
	display: none;
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
	function couponTrade() {
		confirm("다음 포인트가 차감됩니다. 정말 교환하시겠습니까?");
	}
</script>

<script type="text/javascript">
	$(function ()
	{
		var type = "<%=(String)session.getAttribute("type")%>"
	        
	    if(type != "2")
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

				<div class="col-xs-12" style="text-align: right; margin-top: 3%;">
					<button class="btn btn-default" type="button"
						data-toggle="collapse" data-target="#change-coupon"
						aria-expanded="false" aria-controls="change-coupon">쿠폰 교환</button>
					<div class="collapse" id="change-coupon">
						<div class="well">
							<div class="coupon-select">
								<div class="form-inline" style="float: left;">
									<div class="form-group">
										<label class="sr-only" for="exampleInputAmount">보유 밥알</label>
										<div class="input-group" style="width: 150px;">
											<input type="text" class="form-control"
												id="exampleInputAmount" placeholder="203" readonly>
											<div class="input-group-addon">밥알</div>
										</div>
									</div>
								</div>
								<div style="float: right; width: 70%;">
									<select class="form-control" size="1"
										style="display: inline-block; width: 150px;">
										<option>브랜드</option>
										<option>농심</option>
									</select> <select class="form-control" size="1"
										style="display: inline-block; width: 150px;">
										<option>쿠폰</option>
										<option>배송비 무료 쿠폰</option>
									</select>
									<button type="button" class="btn btn-default">장바구니 담기</button>
								</div>
							</div>
							<div class="basket-form">
								<div class="table" id="results" style="margin: 2% 0px;">
									<div class='theader'>
										<div class='table_header'>no</div>
										<div class='table_header'>브랜드</div>
										<div class='table_header'>쿠폰</div>
										<div class='table_header'>밥알</div>
									</div>
									<div class='table_row'>
										<div class='table_small'>
											<div class='table_cell'>no</div>
											<div class='table_cell'>1</div>
										</div>
										<div class='table_small'>
											<div class='table_cell'>브랜드</div>
											<div class='table_cell'>농심</div>
										</div>
										<div class='table_small'>
											<div class='table_cell'>쿠폰</div>
											<div class='table_cell'>배송비 무료 쿠폰</div>
										</div>
										<div class='table_small'>
											<div class='table_cell'>밥알</div>
											<div class='table_cell'>2500</div>
										</div>
									</div>
								</div>
								<div>
									<span id="coupon-err">보유 밥알이 부족합니다.</span> <input type="button"
										class="btn btn-default" value="교환하기" onclick="couponTrade();">
								</div>
							</div>
							<!-- 교환 쿠폰 내역 -->
						</div>
					</div>
				</div>

				<div class="bestbrand-list">
					<div class="col-xs-12 viewlist-head"
						style="font-size: 18pt; margin-bottom: 2%;">
						이주의 <strong>베스트 제품·재료</strong>
					</div>
					<div class="col-md-12">
						<c:forEach var="brandBest" items="${brandBest }">
							<div class="col-xs-4">
								<a class="thumbnail"
									href="brandContent.action?b_id=${brandBest.b_id }"
									style="text-decoration: none"> <img
									src="${brandBest.b_main_img }"
									style="width: 275px; height: 225px;">
									<div class="caption">
										<h4 class="ellipsis_title2">${brandBest.b_title }</h4>
										<p>by ${brandBest.bs_name }</p>
									</div>
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="col-xs-8 viewlist-head" style="font-size: 18pt;">
					총 <strong>${brandCount }</strong> 개의 맛있는 레시피가 있습니다.
				</div>
				<div class="col-xs-4 text-right" style="margin-bottom: 30px;">
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
												href="brandCategory.action?type=type&name=${type.fd_type_name }">${type.fd_type_name }</a>
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
												href="brandCategory.action?type=state&name=${stu.fd_stu_name }">${stu.fd_stu_name }</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</ul>
					</div>
					<div class="dropdown btn-group">
						<button id="brandname" aria-expanded="false" aria-haspopup="true"
							role="button" data-toggle="dropdown"
							class="btn btn-default dropdown-toggle">브랜드</button>
						<ul id="brandmenu" class="dropdown-menu"
							style="margin-left: -30px; width: 400px; padding: 20px;">
							<div class="category">
								<c:forEach var="bs" items="${bsList }">
									<a class="categoryName"
										href="brandCategory.action?type=bs&name=${bs.bs_name }">${bs.bs_name }</a>
								</c:forEach>
							</div>
						</ul>
					</div>
				</div>

				<div class="brand-list col-md-12">
					<c:forEach var="brandList" items="${brandList }">
						<div class="col-xs-4">
							<a class="thumbnail"
								href="brandContent.action?b_id=${brandList.b_id }"
								style="text-decoration: none"> <img
								src="${brandList.b_main_img }"
								style="width: 275px; height: 225px;">
								<div class="caption">
									<h4 class="ellipsis_title2">${brandList.b_title }</h4>
									<p>by ${brandList.bs_name }</p>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- /.blog-main -->

			<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
				<div class="sidebar-module sidebar-module-inset" id="test">
					<ul class="list-group">
						<li class="list-group-item"><a href="brandinsertform.action">브랜드 등록(사업자 전용)</a></li>
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