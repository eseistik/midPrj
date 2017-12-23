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
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<style>
.scrollspy-example {
	position: relative;
	height: 400px;
	margin-top: 10px;
	overflow: auto;
}

.body {
	position: relative;
}
</style>

<link rel="stylesheet" href="css/body.css">

</head>
<body>

	<c:import url="WaveHeader.jsp" />

	<div class="container" style="width: 750px;">
		<nav id="navbar-example" class="navbar navbar-default navbar-static"
			role="navigation" style="margin-top: 50px;">
			<div class="container-fluid">
				<div class="navbar-header text-center">
					<a class="navbar-brand">이용약관 고지 및 동의</a>
				</div>

			</div>
		</nav>
		<div data-spy="scroll" data-target="#navbar-example" data-offset="0"
			class="scrollspy-example">
			<h4 id="fat">@fat</h4>
			<p>Ad leggings keytar, brunch id art party dolor labore.
				Pitchfork yr enim lo-fi before they sold out qui. Tumblr
				farm-to-table bicycle rights whatever. Anim keffiyeh carles
				cardigan. Velit seitan mcsweeney's photo booth 3 wolf moon irure.
				Cosby sweater lomo jean shorts, williamsburg hoodie minim qui you
				probably haven't heard of them et cardigan trust fund culpa
				biodiesel wes anderson aesthetic. Nihil tattooed accusamus, cred
				irony biodiesel keffiyeh artisan ullamco consequat.</p>
			<h4 id="mdo">@mdo</h4>
			<p>Veniam marfa mustache skateboard, adipisicing fugiat velit
				pitchfork beard. Freegan beard aliqua cupidatat mcsweeney's vero.
				Cupidatat four loko nisi, ea helvetica nulla carles. Tattooed cosby
				sweater food truck, mcsweeney's quis non freegan vinyl. Lo-fi wes
				anderson +1 sartorial. Carles non aesthetic exercitation quis
				gentrify. Brooklyn adipisicing craft beer vice keytar deserunt.</p>
			<h4 id="one">one</h4>
			<p>Occaecat commodo aliqua delectus. Fap craft beer deserunt
				skateboard ea. Lomo bicycle rights adipisicing banh mi, velit ea
				sunt next level locavore single-origin coffee in magna veniam. High
				life id vinyl, echo park consequat quis aliquip banh mi pitchfork.
				Vero VHS est adipisicing. Consectetur nisi DIY minim messenger bag.
				Cred ex in, sustainable delectus consectetur fanny pack iphone.</p>
			<h4 id="two">two</h4>
			<p>In incididunt echo park, officia deserunt mcsweeney's proident
				master cleanse thundercats sapiente veniam. Excepteur VHS elit,
				proident shoreditch +1 biodiesel laborum craft beer. Single-origin
				coffee wayfarers irure four loko, cupidatat terry richardson master
				cleanse. Assumenda you probably haven't heard of them art party
				fanny pack, tattooed nulla cardigan tempor ad. Proident wolf
				nesciunt sartorial keffiyeh eu banh mi sustainable. Elit wolf
				voluptate, lo-fi ea portland before they sold out four loko.
				Locavore enim nostrud mlkshk brooklyn nesciunt.</p>
			<h4 id="three">three</h4>
			<p>Ad leggings keytar, brunch id art party dolor labore.
				Pitchfork yr enim lo-fi before they sold out qui. Tumblr
				farm-to-table bicycle rights whatever. Anim keffiyeh carles
				cardigan. Velit seitan mcsweeney's photo booth 3 wolf moon irure.
				Cosby sweater lomo jean shorts, williamsburg hoodie minim qui you
				probably haven't heard of them et cardigan trust fund culpa
				biodiesel wes anderson aesthetic. Nihil tattooed accusamus, cred
				irony biodiesel keffiyeh artisan ullamco consequat.</p>
			<p>Keytar twee blog, culpa messenger bag marfa whatever delectus
				food truck. Sapiente synth id assumenda. Locavore sed helvetica
				cliche irony, thundercats you probably haven't heard of them
				consequat hoodie gluten-free lo-fi fap aliquip. Labore elit placeat
				before they sold out, terry richardson proident brunch nesciunt quis
				cosby sweater pariatur keffiyeh ut helvetica artisan. Cardigan craft
				beer seitan readymade velit. VHS chambray laboris tempor veniam.
				Anim mollit minim commodo ullamco thundercats.</p>
		</div>


		<nav id="navbar-example" class="navbar navbar-default navbar-static"
			role="navigation" style="margin-top: 10px;">
			<div class="container-fluid">
				<div class="navbar-footer text-center">
					<div class="navbar-brand">
						<input type="checkbox" id="AD-agree"> <label
							for="AD-agree">위 이용약관에 동의합니다. (필수동의 항목)</label>
					</div>
				</div>

			</div>

		</nav>
		<div class="col-sm-12">
			<button type="button" class="btn-lg"
				style="color: black; background-color: white; border: 1px solid"
				onclick="location.href='ADInsert1.jsp'">뒤로가기</button>
			<input type="button" class="btn-lg"
				style="background-color: #ff9b19;; color: white; float: right; border: 1px solid #ff9b19;"
				value="다음" onclick="location.href='ADInsert3.jsp'">
		</div>
	</div>
	<!-- /container -->



</body>
</html>