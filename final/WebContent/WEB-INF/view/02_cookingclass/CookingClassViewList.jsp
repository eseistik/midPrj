<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛있당</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Bootstrap -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- Customer CSS -->
<link rel="stylesheet" href="css/cook/style.css">

<style type="text/css">
.caption {
	font-size: 10px;
	margin-bottom: 3px;
}

.ellipsis_title2 {
	font-size: 14px;
}

.col-xs-6 {
	padding-top: 5px;
	padding-bottom: 5px;
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

.blog-main a:link, .blog-main a:hover, .blog-main a:visited {
	color: #000;
	text-decoration: none;
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


<script type="text/javascript">
	function payment() {
		
		var popUrl = "/99_Dispatcher/payment.action"; //팝업창에 출력될 페이지 URL
		
		var popOption = "width=780, height= 470, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)
		
		window.open(popUrl, "", popOption);
	};
	
</script>

</head>
<body>

	<c:import url="../00_main/Menu.jsp"></c:import>

	<div class="container" style="width: 1200px;">

		<div class="row">

			<div class="col-sm-8 blog-main">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a
						href="#con-cookingclass" aria-controls="con-cookingclass"
						role="tab" >신청 중인 쿠킹 클래스</a></li>
				</ul>

				<div class="col-xs-12 viewlist-head"
					style="font-size: 15pt; margin-top: 30px; margin-bottom: 20px;">
					총 <strong>${count }</strong> 개의 쿠킹클래스가 있습니다.
				</div>

				<div class="cooking-list">
					
					<c:forEach var="list" items="${list }">
						<div class="col-xs-4">
							<div class="thumbnail">
								<a href="cookingclasscontent.action?cc_id=${list.cc_id }"><img src="${list.cc_img}" alt="그림" style="width: 203.33px; height: 203.33px;"></a>
								<div class="caption">
									<h4><a href="cookingclasscontent.action?cc_id=${list.cc_id }">${list.cc_title }</a></h4>
									
									<p>by <img src="${list.grade_img }"> ${list.u_nickname }</p>
									<p class="col-xs-6" style="border: 1px solid #eee; height: 52.8px;"> 신청기간<br>${list.cc_re_start } ~ ${list.cc_re_end }</p>
									<p class="col-xs-6" style="border: 1px solid #eee; height: 52.8px;"> 클래스일시<br>${list.time_date } ${list.time_start }</p>
									<p><a onclick="payment()" class="btn btn-default" role="button" style="width: 100%;">신청하기</a></p>
								</div>
							</div>
						</div>
					</c:forEach>
					
				</div>

				<!-- /.blog-main -->

			</div>

			<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
				<div class="sidebar-module sidebar-module-inset">
					<ul class="list-group" id="test">
						<li class="list-group-item">
						<a href="cookinginsertform.action">쿠킹 클래스 모집</a></li>
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