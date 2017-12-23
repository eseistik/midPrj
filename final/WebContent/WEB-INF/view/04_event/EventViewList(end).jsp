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
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<link rel="stylesheet" href="css/event/style.css" />
<style type="text/css">
.media-heading>a {
	text-decoration: none;
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
</style>

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

	<c:import url="../00_main/Menu.jsp"></c:import>
	
	<div class="container" style="width: 1200px;">

		<div class="row">

			<div class="col-sm-8 blog-main">

				<ul class="nav nav-tabs">
					<li role="presentation" >
						<a href="event.action">진행중인 이벤트</a>
					</li>
					<li role="presentation" class="active">
						<a href="eventend.action">종료된 이벤트</a>
					</li>
				</ul>


				<c:forEach var="eventList" items="${endlist }">
					<div class="media">
						<div class="media-left" style="position: relative">
							<a href="/99_Dispatcher/eventContentend.action?endevent_id=${eventList.event_id }" ><img
								class="media-object"
								src="${eventList.event_title_img }"
								data-holder-rendered="true" style="width: 380px; height: 120px;"></a>
						</div>
						<div class="media-body">
							<h2 class="media-heading" id="top-aligned-media">
								<span class="info_cate">[ 종료됨 ]</span> 
								<a href="/99_Dispatcher/eventContentend.action?endevent_id=${eventList.event_id }" > ${eventList.event_title }</a>
							</h2>
							<div class="info_name">${eventList.event_start } ~ ${eventList.event_end }</div>
						</div>
						<hr>
					</div>
				</c:forEach>

			</div>
			<!-- /.blog-main -->

			<div class="col-sm-3 col-sm-offset-1 blog-sidebar" >
				<div class="sidebar-module sidebar-module-inset" id="test" >
						<ul class="list-group" id="insertBtn">
							<li class="list-group-item" ><a href="/99_Dispatcher/eventinsert.action">이벤트 등록(사업자 전용)</a></li>
						</ul>
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