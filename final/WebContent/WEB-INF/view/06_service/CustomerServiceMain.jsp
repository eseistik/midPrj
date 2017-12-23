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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
.faq_section {
	margin: 40px auto;
}

.FaQ_Each {
	padding-bottom: 10px;
}

.box {
	color: #666666;
	padding-top: 15px;
	padding-bottom: 15px;
	padding-left: 20px;
	font-size: 13px;
	text-transform: uppercase;
	cursor: pointer;
	border: 1px solid #d9d9d9;
}

.draw {
	display: none;
	background: #ffffff;
	padding: 20px;
	border-bottom: 1px solid #d9d9d9;
	border-left: 1px solid #d9d9d9;
	border-right: 1px solid #d9d9d9;
	color: #000000;
	padding-left: 30px;
}

#other {
	display: none;
}

.img-btn:hover {
	cursor: pointer;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$(".box").click(function() {
			$(this).next().slideToggle("fast");
			$(this).find('i').toggle();
		});

	});
</script>
</head>
<body>

	<c:import url="../00_main/Menu.jsp"></c:import>
	<div class="container" style="">

		<!-- Example row of columns -->
		<div class="row" style="padding-bottom: 25px;">

			<!-- Jumbotron -->
			<div class="col-lg-12">
				<h3>고객센터</h3>
				<hr>
			</div>
			<div class="col-lg-12" style="height: 425px; text-align: center;">
				<img src="images/cs/csinformation.PNG">
			</div>

			<div class="col-lg-6" style="padding-top: 2%;">
				<img src="images/cs/cooking_banner.png" class="img-btn" style="float: right;"
					onclick="location.href='customercookingclassinfo.action'">
			</div>

			<div class="col-lg-5">
				<div class="faq_section">
					<c:forEach var="faq" items="${faqList }">
						<div class="FaQ_Each">
							<section class="box">
								<span> <i class="fa fa-plus" aria-hidden="true"></i> <i
									class="fa fa-minus" id="other" aria-hidden="true"></i>
								</span> &nbsp;&nbsp;<span>${faq.faq_title }</span>
							</section>
							<section class="draw">${faq.faq_answer }</section>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div>
			<div class="col-lg-6">
				<img src="<%=cp %>/images/cs/csad.PNG" class="img-btn" style="float: right;"
					onclick="location.href='customerbannerinfo.action'">
			</div>
			<div class="col-lg-6">
				<img src="<%=cp %>/images/cs/cspartner.png" class="img-btn" style="float: left;"
					onclick="location.href='customerpartnerinfo.action'">
			</div>
		</div>

	</div>
	<!-- /container -->

	<!-- Site footer -->
	<footer class="footer">
		<c:import url="../00_main/Copyright.jsp"></c:import>
	</footer>
</body>
</html>