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
<script
	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel='stylesheet prefetch'
	href='https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css'>

<!-- 사용자 JavaScript -->

<style type="text/css">
.rating {
	text-align: center;
	position: relative;
	float: left;
}

.hidden {
	opacity: 0;
}

.star {
	display: inline-block;
	margin: 5px;
	font-size: 30px;
	color: whitesmoke;
	position: relative;
}

.star.animate {
	-webkit-animation: stretch-bounce .5s ease-in-out;
}

.star.hidden {
	opacity: 0;
}

.full:before {
	font-family: fontAwesome;
	display: inline-block;
	content: "\f005";
	position: relative;
	float: right;
	z-index: 2;
}

.half:before {
	font-family: fontAwesome;
	content: "\f089";
	position: absolute;
	float: left;
	z-index: 3;
}

.star-colour {
	color: #ffd700;
}

.star-category {
	display: inline-block;
}

@
-webkit-keyframes stretch-bounce { 0% {
	-webkit-transform: scale(1);
}

25%
{
-webkit-transform


:

 

scale


(1
.5


);
}
50%
{
-webkit-transform


:

 

scale


(0
.9


);
}
75%
{
-webkit-transform


:

 

scale


(1
.2


);
}
100%
{
-webkit-transform


:

 

scale


(1);
}
}
.selected:before {
	font-family: fontAwesome;
	display: inline-block;
	content: "\f005";
	position: absolute;
	top: 0;
	left: 0;
	-webkit-transform: scale(1);
	opacity: 1;
	z-index: 1;
}

.selected.pulse:before {
	-webkit-transform: scale(3);
	opacity: 0;
}

.selected.is-animated:before {
	transition: 1s ease-out;
}

.score {
	font-family: arial;
	font-size: 10px;
	display: inline-block;
}

.score-rating {
	top: -5px;
	position: relative;
	font-size: 13pt;
}

.total {
	vertical-align: sub;
	top: 0px;
	position: relative;
	font-size: 100%;
}

.average {
	font-family: arial;
	font-size: 15px;
	display: none;
	text-align: center;
}

.score-average {
	display: inline-block;
}
</style>
<script type="text/javascript">
	function popover_submit() {
		var taste = $('#taste').html();
		var simple = $('#simple').html();
		var creative = $('#creative').html();
		var r_id = document.getElementById("r_id").value;
		var u_id = document.getElementById("u_id").value;
		
		$("#rating-form").attr("action", "ratingFin.action?taste=" + taste + "&simple="
						+ simple + "&creative=" + creative + "&r_id=" + r_id).submit();
	}

	function popover_close() {
		window.close();
	}

	var starClicked = false;

	$(function() {

		$('.star').click(function() {

			$(this).children('.selected').addClass('is-animated');
			$(this).children('.selected').addClass('pulse');

			var target = this;

			setTimeout(function() {
				$(target).children('.selected').removeClass('is-animated');
				$(target).children('.selected').removeClass('pulse');
			}, 1000);

			starClicked = true;
		});

		$('.half').click(
				function() {
					if (starClicked == true)
					{
						setHalfStarState(this)
					}
					$(this).closest('.rating').find('.js-score').text(
							$(this).data('value'));

					$(this).closest('.rating').data('vote',
							$(this).data('value'));
					calculateAverage()
					console.log(parseInt($(this).data('value')));

				});

		$('.full').click(
				function() {
					if (starClicked == true)
					{
						setFullStarState(this)
					}
					$(this).closest('.rating').find('.js-score').text(
							$(this).data('value'));

					$(this).find('js-average').text(
							parseInt($(this).data('value')));

					$(this).closest('.rating').data('vote',
							$(this).data('value'));
					calculateAverage()

					console.log(parseInt($(this).data('value')));
				});

		$('.half').hover(function() {
			if (starClicked == false)
			{
				setHalfStarState(this)
			}

		});

		$('.full').hover(function() {
			if (starClicked == false)
			{
				setFullStarState(this)
			}
		});

	})

	function updateStarState(target) {
		$(target).parent().prevAll().addClass('animate');
		$(target).parent().prevAll().children().addClass('star-colour');

		$(target).parent().nextAll().removeClass('animate');
		$(target).parent().nextAll().children().removeClass('star-colour');
	}

	function setHalfStarState(target) {
		$(target).addClass('star-colour');
		$(target).siblings('.full').removeClass('star-colour');
		updateStarState(target)
	}

	function setFullStarState(target) {
		$(target).addClass('star-colour');
		$(target).parent().addClass('animate');
		$(target).siblings('.half').addClass('star-colour');

		updateStarState(target)
	}

	function calculateAverage() {
		var average = 0

		$('.rating').each(function() {
			average += $(this).data('vote')
		})

		$('.js-average').text((average / $('.rating').length).toFixed(1))
		$('.average').css('display', 'inline');
	}
</script>
</head>
<body>

	<div class="rating-main row">
		<div class="rating-head col-md-12">
			<h4>별점 평가</h4>
			<hr>
			<div class="warning">* 한 번 평가된 레시피는 재평가할 수 없습니다. 신중하게 선택해 주세요.</div>
		</div>

		<div class="rating-body col-md-12" style="height: 150px;">
			<form id="rating-form" method="post">
				<div class="rating" data-vote="0">
					<div class="star-category">맛</div>
					<div class="star hidden">
						<span class="full" data-value="0"></span> <span class="half"
							data-value="0"></span>
					</div>
					<div class="star">
						<span class="full" data-value="1"></span> <span class="half"
							data-value="0.5"></span> <span class="selected"></span>
					</div>
					<div class="star">
						<span class="full" data-value="2"></span> <span class="half"
							data-value="1.5"></span> <span class="selected"></span>
					</div>
					<div class="star">
						<span class="full" data-value="3"></span> <span class="half"
							data-value="2.5"></span> <span class="selected"></span>
					</div>
					<div class="star">
						<span class="full" data-value="4"></span> <span class="half"
							data-value="3.5"></span> <span class="selected"></span>
					</div>
					<div class="star">
						<span class="full" data-value="5"></span> <span class="half"
							data-value="4.5"></span> <span class="selected"></span>
					</div>
					<div class="score">
						<span class="score-rating js-score" id="taste">0</span> <span>/</span>
						<span class="total">5</span>
					</div>
				</div>

				<div class="rating" data-vote="0">
					<div class="star-category">편의성</div>
					<div class="star hidden">
						<span class="full" data-value="0"></span> <span class="half"
							data-value="0"></span>
					</div>
					<div class="star">
						<span class="full" data-value="1"></span> <span class="half"
							data-value="0.5"></span> <span class="selected"></span>
					</div>
					<div class="star">
						<span class="full" data-value="2"></span> <span class="half"
							data-value="1.5"></span> <span class="selected"></span>
					</div>
					<div class="star">
						<span class="full" data-value="3"></span> <span class="half"
							data-value="2.5"></span> <span class="selected"></span>
					</div>
					<div class="star">
						<span class="full" data-value="4"></span> <span class="half"
							data-value="3.5"></span> <span class="selected"></span>
					</div>
					<div class="star">
						<span class="full" data-value="5"></span> <span class="half"
							data-value="4.5"></span> <span class="selected"></span>
					</div>
					<div class="score">
						<span class="score-rating js-score" id="simple">0</span>
						<span>/</span> <span class="total">5</span>
					</div>
				</div>

				<div class="rating" data-vote="0">
					<div class="star-category">창의성</div>
					<div class="star hidden">
						<span class="full" data-value="0"></span> <span class="half"
							data-value="0"></span>
					</div>
					<div class="star">
						<span class="full" data-value="1"></span> <span class="half"
							data-value="0.5"></span> <span class="selected"></span>
					</div>
					<div class="star">
						<span class="full" data-value="2"></span> <span class="half"
							data-value="1.5"></span> <span class="selected"></span>
					</div>
					<div class="star">
						<span class="full" data-value="3"></span> <span class="half"
							data-value="2.5"></span> <span class="selected"></span>
					</div>
					<div class="star">
						<span class="full" data-value="4"></span> <span class="half"
							data-value="3.5"></span> <span class="selected"></span>
					</div>
					<div class="star">
						<span class="full" data-value="5"></span> <span class="half"
							data-value="4.5"></span> <span class="selected"></span>
					</div>
					<div class="score">
						<span class="score-rating js-score" id="creative">0</span>
						<span>/</span> <span class="total">5</span>
					</div>
				</div>
				<input type="hidden" value="${r_id}" name="r_id" id="r_id">
				<input type="hidden" value="${u_id }" name="u_id" id="u_id">

				<div class="rating-footer col-md-12">
					<div style="text-align: center;">
						<button type="button" class="btn btn-default"
							onclick="popover_submit();">별점 주기</button>
						<button type="button" class="btn btn-default"
							onclick="popover_close();">취소</button>
					</div>
				</div>
			</form>
		</div>

	</div>

</body>
</html>