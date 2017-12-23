<%@page import="com.mid.dto.ServiceDTO"%>
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
<link rel="stylesheet" href="<%=cp %>/css/cs/tablecss.css" />
<style type="text/css">
.media-heading>a {
	text-decoration: none;
}

.sidebar-module {
	margin-top: 10%;
	text-align: center;
}

.divTableBody .divTableRow .divTableCell a:link, .divTableBody .divTableRow .divTableCell a:visited,
	.divTableBody .divTableRow .divTableCell a:hover {
	text-decoration: none;
	color: #000;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#researchBtn").click(function() {
			$("#researchForm").submit();
		});
	})
</script>
</head>
<body>

	<div class="blog-header">
		<c:import url="../00_main/Menu.jsp"></c:import>
	</div>

	<div class="container" style="width: 1200px;">

		<div class="row">

			<div class="col-sm-8 blog-main">
				<div>
					<div class="m_list_tit" style="margin-bottom: 30px;">
						<h3>1:1 문의</h3>
						<hr>
						<div class="col-xs-12 viewlist-head"
							style="font-size: 14pt; margin: 5px 0;">
							총 <strong>${count }</strong> 개의 문의 내역이 있습니다.
						</div>
					</div>
					<div style="height: 50px; margin-bottom: 3%;">
						<form class="form-inline" style="float: left;" action="customerresearch.action" id="researchForm">
							<div class="form-group">
								<div class="input-group">
									<input type="text" class="form-control" id="researchInput" name="researchInput">
									<div class="btn btn-default input-group-addon" id="researchBtn">
										<span class="glyphicon glyphicon-search"></span>
									</div>
								</div>
							</div>
						</form>
						<button type="button" class="btn btn-default"
							style="float: right;" onclick="location.href='customerinsertform.action'">문의하기</button>
					</div>
					<div>
						<div class="divTable greyGridTable" style="margin-top: 3%; text-align: center;">
							<div class="divTableHeading">
								<div class="divTableRow">
									<div class="divTableHead">번호</div>
									<div class="divTableHead">문의상태</div>
									<div class="divTableHead">제목</div>
									<div class="divTableHead">작성자</div>
									<div class="divTableHead">작성일</div>
								</div>
							</div>
							<div class="divTableBody">
								<% 
									ArrayList<ServiceDTO> qnaList = (ArrayList)request.getAttribute("list");
									ArrayList<Integer> stateList = (ArrayList)request.getAttribute("state");
									
									for (int i = 0; i < qnaList.size(); i++) {
								%>							
								<div class="divTableRow">
									<div class="divTableCell"><%=qnaList.get(i).getQna_id() %></div>
									<div class="divTableCell">
										<%
											if (stateList.get(i) == 1) {
										%>
											답변 완료
										<%
											} else {
										%>
											답변 대기 중
										<%
											}
										%>
									</div>
									<div class="divTableCell">[<%=qnaList.get(i).getQna_type_val() %>] 
										<a href="customercontent.action?qna_id=<%=qnaList.get(i).getQna_id() %>">
											<%=qnaList.get(i).getQna_title() %>
										</a>
									</div>
									<div class="divTableCell"><%=qnaList.get(i).getU_nickname() %></div>
									<div class="divTableCell"><%=qnaList.get(i).getQna_date() %></div>
								</div>
								<%
									}
								%>
							</div>
						</div>
					</div>
				</div>
				<!-- /.blog-main -->
				
			</div>
			<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
				<div class="sidebar-module sidebar-module-inset">
					<ul class="list-group">
						<li class="list-group-item"><a
							href="customeragreelist.action">이용약관</a></li>
						<li class="list-group-item"><a href="customertablelist.action">1:1
								문의</a></li>
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