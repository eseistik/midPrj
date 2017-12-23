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
<title>Insert title here</title>
<script
	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script
	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script
	src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
<script
	src='http://cdnjs.cloudflare.com/ajax/libs/jquery.payment/1.3.2/jquery.payment.min.js'></script>
<script type="text/javascript" src="js/pay/credit.js"></script>
<link rel='stylesheet prefetch'
	href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
<link rel='stylesheet prefetch'
	href='http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css'>
<style type="text/css">
#payBody {
	width: 750px;
}

.pay-container {
	width: 600px;
	margin: 0px auto;
}

#step-label {
	margin: 2% 0px;
}

#pay-stepper {
	padding-left: 20%;
}

.stepper .nav-tabs {
	position: relative;
}

.stepper .nav-tabs>li {
	width: 25%;
	position: relative;
}

.stepper .nav-tabs>li:after {
	content: '';
	position: absolute;
	background: #f1f1f1;
	display: block;
	width: 100%;
	height: 5px;
	top: 30px;
	left: 50%;
	z-index: 1;
}

.stepper .nav-tabs>li.completed::after {
	background: #34bc9b;
}

.stepper .nav-tabs>li:last-child::after {
	background: transparent;
}

.stepper .nav-tabs>li.active:last-child .round-tab {
	background: #34bc9b;
}

.stepper .nav-tabs>li.active:last-child .round-tab::after {
	content: '✔';
	color: #fff;
	position: absolute;
	left: 0;
	right: 0;
	margin: 0 auto;
	top: 0;
	display: block;
}

.stepper .nav-tabs [data-toggle='tab'] {
	width: 25px;
	height: 25px;
	margin: 20px auto;
	border-radius: 100%;
	border: none;
	padding: 0;
	color: #f1f1f1;
}

.stepper .nav-tabs [data-toggle='tab']:hover {
	background: transparent;
	border: none;
}

.stepper .nav-tabs>.active>[data-toggle='tab'], .stepper .nav-tabs>.active>[data-toggle='tab']:hover,
	.stepper .nav-tabs>.active>[data-toggle='tab']:focus {
	color: #34bc9b;
	cursor: default;
	border: none;
}

.stepper .tab-pane {
	position: relative;
	padding-top: 50px;
}

.stepper .round-tab {
	width: 25px;
	height: 25px;
	line-height: 22px;
	display: inline-block;
	border-radius: 25px;
	background: #fff;
	border: 2px solid #34bc9b;
	color: #34bc9b;
	z-index: 2;
	position: absolute;
	left: 0;
	text-align: center;
	font-size: 14px;
}

.stepper .completed .round-tab {
	background: #34bc9b;
}

.stepper .completed .round-tab::after {
	content: '✔';
	color: #fff;
	position: absolute;
	left: 0;
	right: 0;
	margin: 0 auto;
	top: 0;
	display: block;
}

.stepper .active .round-tab {
	background: #fff;
	border: 2px solid #34bc9b;
}

.stepper .active .round-tab:hover {
	background: #fff;
	border: 2px solid #34bc9b;
}

.stepper .active .round-tab::after {
	display: none;
}

.stepper .disabled .round-tab {
	background: #fff;
	color: #f1f1f1;
	border-color: #f1f1f1;
}

.stepper .disabled .round-tab:hover {
	color: #4dd3b6;
	border: 2px solid #a6dfd3;
}

.stepper .disabled .round-tab::after {
	display: none;
}
</style>
<script type="text/javascript">
	/*jslint browser: true*/
	/*global $, jQuery, alert*/
	(function($) {
		'use strict';

		$(function() {

			$(document)
					.ready(
							function() {
								function triggerClick(elem) {
									$(elem).click();
								}
								var $progressWizard = $('.stepper'), $tab_active, $tab_prev, $tab_next, $btn_prev = $progressWizard
										.find('.prev-step'), $btn_next = $progressWizard
										.find('.next-step'), $tab_toggle = $progressWizard
										.find('[data-toggle="tab"]'), $tooltips = $progressWizard
										.find('[data-toggle="tab"][title]');

								// To do:
								// Disable User select drop-down after first step.
								// Add support for payment type switching.

								//Initialize tooltips
								$tooltips.tooltip();

								//Wizard
								$tab_toggle.on('show.bs.tab', function(e) {
									var $target = $(e.target);

									if (!$target.parent().hasClass(
											'active, disabled')) {
										$target.parent().prev().addClass(
												'completed');
									}
									if ($target.parent().hasClass('disabled')) {
										return false;
									}
								});

								$btn_next.on('click', function() {
									$tab_active = $progressWizard
											.find('.active');

									$tab_active.next().removeClass('disabled');

									$tab_next = $tab_active.next().find(
											'a[data-toggle="tab"]');
									triggerClick($tab_next);

								});
								$btn_prev.click(function() {
									$tab_active = $progressWizard
											.find('.active');
									$tab_prev = $tab_active.prev().find(
											'a[data-toggle="tab"]');
									triggerClick($tab_prev);
								});
							});
		});

	}(jQuery, this));
</script>
</head>
<body id="payBody">

	<div class="pay-container">
		<div class="panel panel-default">
			<div class="panel-body">


				<!-- STEPPER
        Allows a user to complete steps in a given process.
        
            * Required base class: .stepper
            @param .active
            @param .completed
            @param .disabled

            Dependencies:
              //maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css
              //cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js
              //maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js
                
        -->

				<div class="stepper">
					<ul class="nav nav-tabs" role="tablist" id="pay-stepper">
						<li role="presentation" class="active"><a
							class="persistant-disabled" href="#stepper-step-1"
							data-toggle="tab" aria-controls="stepper-step-1" role="tab"
							title="Step 1"> <span class="round-tab">1</span>
						</a></li>
						<li role="presentation" class="disabled"><a
							class="persistant-disabled" href="#stepper-step-2"
							data-toggle="tab" aria-controls="stepper-step-2" role="tab"
							title="Step 2"> <span class="round-tab">2</span>
						</a></li>
						<li role="presentation" class="disabled"><a
							class="persistant-disabled" href="#stepper-step-4"
							data-toggle="tab" aria-controls="stepper-step-4" role="tab"
							title="Complete"> <span class="round-tab">3</span>
						</a></li>
					</ul>
					<form role="form">
						<div class="tab-content">
							<div class="tab-pane fade in active" role="tabpanel"
								id="stepper-step-1">

								<div id="payment-stripe">
									<div class="row text-left">
										<div class="col-sm-7">
											<div class="form-group">
												<label>결제 상품</label>
												<div class="input-group">
													<span class="input-group-addon"><i
														class="fa fa-archive"></i></span> <input id="cc-product"
														type="text" class="input form-control cc-product"
														autocomplete="cc-product" value="갈비 배우실분 모집합니다"
														data-payment='cc-product' required readonly="readonly">
												</div>
											</div>
										</div>
										<div class="col-sm-5">
											<div class="form-group">
												<label>결제 가격</label>
												<div class="input-group">
													<span class="input-group-addon"><i class="fa fa-usd"></i></span>
													<input id="cc-price" type="text"
														class="input form-control cc-price" autocomplete="off"
														value="79,000 원" data-payment='cc-price' required readonly="readonly"> 
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label>연락처</label>
												<div class="input-group">
													<span class="input-group-addon"><i
														class="fa fa-phone"></i></span> <input id="cc-tel" type="tel"
														class="input form-control cc-tel" autocomplete="cc-tel"
														value="010-6322-0147" data-payment='cc-tel' required readonly="readonly">
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label>이메일</label>
												<div class="input-group">
													<span class="input-group-addon"><i
														class="fa fa-envelope"></i></span> <input id="cc-email"
														type="email" class="input form-control cc-email"
														autocomplete="off" placeholder="coyo@gmail.com"
														data-payment='cc-email' required readonly="readonly">
												</div>
											</div>
										</div>
									</div>
								</div>
								<h3 class="h2" id="step-label">결제 수단 </h3>
								
								<div>
									<label class="radio-inline"> <input type="radio"
										name="inlineRadioOptions" id="inlineRadio1" value="option1">
										신용카드
									</label> <label class="radio-inline"> <input type="radio"
										name="inlineRadioOptions" id="inlineRadio2" value="option2">
										핸드폰
									</label> <label class="radio-inline"> <input type="radio"
										name="inlineRadioOptions" id="inlineRadio3" value="option3">
										무통장 입금
									</label>
								</div>
								<ul class="list-inline pull-right">
									<li><a class="btn btn-primary next-step">Next</a></li>
								</ul>
							</div>
							<div class="tab-pane fade" role="tabpanel" id="stepper-step-2">
								<div id="payment-stripe">
									<div class="row text-left">
										<div class="col-sm-12">
											<div class="form-group">
												<label for="cc-number" class="control-label">카드 번호 <small
													class="text-muted">
												</small>
												</label>
												<div class="input-group">
													<span class="input-group-addon"><i
														class="fa fa-credit-card"></i></span> <input id="cc-number"
														type="tel" class="input-lg form-control cc-number"
														autocomplete="cc-number" placeholder="•••• •••• •••• ••••"
														data-payment='cc-number' required>
												</div>
											</div>
										</div>
										<div class="col-sm-8">
											<div class="form-group">
												<label>유효기간 (MM/YYYY)</label>
												<div class="input-group">
													<span class="input-group-addon"><i
														class="fa fa-calendar"></i></span> <input id="cc-exp" type="tel"
														class="input-lg form-control cc-exp" autocomplete="cc-exp"
														placeholder="•• / ••••" data-payment='cc-exp' required>
												</div>
											</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group">
												<label>CVC 코드</label>
												<div class="input-group">
													<span class="input-group-addon"><i
														class="fa fa-lock"></i></span> <input id="cc-cvc" type="password"
														class="input-lg form-control cc-cvc" autocomplete="off"
														placeholder="•••" data-payment='cc-cvc' required>
												</div>
											</div>
										</div>
									</div>
								</div>
								<ul class="list-inline pull-right">
									<li><a class="btn btn-default prev-step">Back</a></li>
									<li><a class="btn btn-primary next-step">Next</a></li>
								</ul>
							</div>
							<div class="tab-pane fade" role="tabpanel" id="stepper-step-4">
								<h3>결제 완료!</h3>
								<p>결제가 완료되었습니다. 자세한 예약 정보는 My 쿠킹클래스에서 확인 가능합니다.</p>
								
								<ul class="list-inline pull-right">
									<li><a class="btn btn-warning" onclick="window.close();">창 닫기</a></li>
								</ul>
								
							</div>
							
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

</body>
</html>