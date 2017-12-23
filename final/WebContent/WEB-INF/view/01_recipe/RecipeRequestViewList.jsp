<%@page import="com.mid.dto.RecipeRequestDTO"%>
<%@page import="java.util.ArrayList"%>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=cp %>/css/request/style.css" />
<link rel="stylesheet" href="<%=cp %>/css/recipe/tablecss.css">
<style type="text/css">
.media-heading>a {
	text-decoration: none;
}

.sidebar-module {
	margin-top: 10%;
	text-align: center;
}
</style>
<script type="text/javascript">
	$(function() {
		
		$('.search-btn').click(function() {
			var searchVal = $('#request-search').val();
			//alert(searchVal);
			
			$('#recipe-request-search').attr('action', 'recipeRequestSearch.action?key=' + searchVal).submit();
		});
		
	})
</script>
</head>
<body>

	<c:import url="../00_main/Menu.jsp"></c:import>

	<div class="container" style="width: 1200px;">

		<div class="row">

			<div class="col-sm-8 blog-main">

				<div class="m_list_tit" style="margin-bottom: 30px;">
						<h3>레시피 요청</h3>
						<hr>
						<div class="col-xs-12 viewlist-head"
							style="font-size: 14pt; margin: 5px 0;">
							총 <strong>${recipeRequestCount }</strong> 개의 요청 내역이 있습니다.
						</div>
					</div>
					<div style="height: 50px; margin-bottom: 3%;">
						<form class="form-inline" id="recipe-request-search" style="float: left;" method="post">
							<div class="form-group">
								<div class="input-group">
									<input type="text" class="form-control" id="request-search">
									<div class="btn btn-default input-group-addon search-btn">
										<span class="glyphicon glyphicon-search"></span>
									</div>
								</div>
							</div>
						</form>
						<button type="button" class="btn btn-default"
							style="float: right;" onclick="location.href='recipereqeustinsertform.action'">요청하기</button>
					</div>

				<div class="divTable greyGridTable">
					<div class="divTableHeading">
						<div class="divTableRow">
							<div class="divTableHead">번호</div>
							<div class="divTableHead">요청상태</div>
							<div class="divTableHead">제목</div>
							<div class="divTableHead">작성자</div>
							<div class="divTableHead">내공밥알</div>
							<div class="divTableHead">작성일</div>
						</div>
					</div>
					<div class="divTableBody">
						<%
							ArrayList<RecipeRequestDTO> recipeRequestList = (ArrayList)request.getAttribute("recipeRequestList");
							ArrayList<Integer> requestStu = (ArrayList)request.getAttribute("recipeStu");
						
							for (int i = 0; i < recipeRequestList.size(); i++) {
						%>  
							<div class="divTableRow">
								<div class="divTableCell"><%=recipeRequestList.get(i).getRr_id() %></div>
								<div class="divTableCell">
								<%
									if (requestStu.get(i) == 1) {
								%>
									요청 완료
								<%
									}
									else {
								%>
									미완료
								<%	
									}
								%>
								</div>
								<div class="divTableCell">
									<a href="recipeRequestContent.action?rr_id=<%=recipeRequestList.get(i).getRr_id() %>">
										<%=recipeRequestList.get(i).getRr_title() %>
									</a>
								</div>
								<div class="divTableCell"><%=recipeRequestList.get(i).getU_nickname() %></div>
								<div class="divTableCell"><%=recipeRequestList.get(i).getRr_point() %></div>
								<div class="divTableCell"><%=recipeRequestList.get(i).getRr_date() %></div>
							</div>
						<%
							}
						%>
					</div>
				</div>

			</div>
			<!-- /.blog-main -->

			<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
				<div class="sidebar-module sidebar-module-inset">
					<ul class="list-group">
						<li class="list-group-item"><a href="recipe.action">레시피</a></li>
						<li class="list-group-item"><a
							href="recipeRequest.action">레시피 요청</a></li>
						<li class="list-group-item"><a href="#">레시피
								등록</a></li>
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