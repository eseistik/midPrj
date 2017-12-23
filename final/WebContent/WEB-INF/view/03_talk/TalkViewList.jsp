<%@page import="java.util.ArrayList"%>
<%@page import="com.mid.dto.TalkDTO"%>
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
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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

ul#page li {
	display: inline;
}
</style>
<style type="text/css">
.img-circle {
	width: 100px;
}

.img-rounded {
	width: 575px;
}

.summary>a {
	text-decoration: none;
}

.summary a:link, .summary a:hover, .summary a:visited {
	color: #000;
}

.sidebar-module {
	margin-top: 10%;
	text-align: center;
}
</style>
<link rel="stylesheet" href="css/talk/style.css" />
</head>
<body>

	<c:import url="../00_main/Menu.jsp"></c:import>

	<div class="container" style="width: 1200px;">

		<div class="row">

			<div class="col-sm-8 blog-main">

				<ul class="nav nav-tabs">
					<li role="presentation" class="active"><a href="#">최신순</a></li>
					<li role="presentation"><a href="#">팔로우</a></li>
				</ul>

				<div class="row list_lump col-md-12" style="margin-top: 30px;">
					<%
						ArrayList<TalkDTO> tvList = (ArrayList) request.getAttribute("viewLists");
						ArrayList<Integer> cList = (ArrayList) request.getAttribute("countList");

						for (int i = 0; i < tvList.size(); i++)
						{
							TalkDTO tv = tvList.get(i);
							int count = cList.get(i);
					%>
					<div class="col-xs-2" style="border-bottom: 1px, solid;">
						<a href="profile.action?t_id=<%=tv.getT_id()%>"><img
							class="img-circle" src="<%=tv.getU_profile_img()%>" /></a>
					</div>
					<div class="col-xs-10">
						<div class="col-xs-9 talk_title">
							<%=tv.getU_nickname()%>
							<P><%=tv.getT_date()%></P>
						</div>
						<div class="col-xs-3 text-right">
							<img src="images/talk/comment.png" style="width: 30px;">&nbsp;&nbsp;&nbsp;<%=count%>
						</div>
						<div class="col-xs-12 summary">
							<a
								href="talkViewContent.action?t_id=<%=tv.getT_id()%>&count=<%=count%>"><%=tv.getT_content()%></a>
						</div>
						<div class="col-xs-12">
							<a
								href="talkViewContent.action?t_id=<%=tv.getT_id()%>&count=<%=count%>"><img
								class="img-rounded" src="<%=tv.getT_img()%>"></a>
						</div>
						<!--/row -->
					</div>
					<%
						}
					%>
					
					
					<br>
				</div>
				<!--/row list_lump-->

			</div>
			<!-- /.blog-main -->

			<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
				<div class="sidebar-module sidebar-module-inset">
					<ul class="list-group">
						<li class="list-group-item"><a href="talkInsertForm.action">토크
								등록</a></li>
					</ul>
				</div>
				<div class="sidebar-module sidebar-module-inset">
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