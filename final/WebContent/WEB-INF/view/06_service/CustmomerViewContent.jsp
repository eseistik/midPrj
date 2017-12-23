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
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
.img-circle {
	width: 100px;
}

.img-rounded {
	width: 575px;
}

.glyphicon {
	font-size: 15pt;
}

.sidebar-module {
	margin-top: 10%;
	text-align: center;
}
</style>
</head>
<body>

	<c:import url="../00_main/Menu.jsp"></c:import>

	<!-- 게시물 글 조회 -->
	<div class="container" style="width: 1200px;">

		<div id="contents_area" class="col-sm-8">
			<div class="talk_list">
				<div class="row list_lump" style="margin-top: 30px;">
					<div class="col-xs-12">
						<div class="row">
							<div class="col-xs-9">
								<h4 class="media-heading">
									<strong class="info_name_f" style="color: #ff9b19;">[${qnaContent.qna_type_val }]</strong>
									<strong>${qnaContent.qna_title }</strong><br> <small
										class="info_name_f">${qnaContent.u_nickname } |
										${qnaContent.qna_date } | 
										<c:if test="${qnaState eq '1' }">
											답변 완료
										</c:if>
										<c:if test="${qnaState eq '0' }">
											답변 대기 중
										</c:if>
										</small>
								</h4>
							</div>
							<div class="col-xs-12 summary" style="padding-top: 30px;">
								<label>문의 내용</label>
								<div style="height: 200px;" class="form-control"
									id="ServiceInputContent">${qnaContent.qna_content }</div>
							</div>
							<div class="col-xs-12" style="padding-top: 30px;">
								<c:if test="${qnaContent.qna_url eq null || qnaContent.qna_url eq '' }">
									<label>첨부 URL</label><br> <%-- <input type="text"
										class="form-control"  value="${qnaContent.qna_url }"
										readonly="readonly"> --%>
										<a href="${qnaContent.qna_url }"><span class="form-control">${qnaContent.qna_url }</span></a>
								</c:if>
								<c:if test="${qnaContent.qna_file eq null || qnaContent.qna_file eq '' }">
									<label style="margin-top: 2%;">첨부 이미지</label><br>
									<img class="img-rounded" src="${qnaContent.qna_file }">
								</c:if>
							</div>
						</div>
<%-- 
						<div class="col-xs-12 summary" style="padding-top: 30px;">
							<label>답변 내용</label><small> ${qnaComment.qna_an_date }</small>
							<div style="height: 200px;" class="form-control"
								id="ServiceInputContent">${qnaComment.qna_an_content }</div>
						</div> --%>
						<div class="col-md-12">
							<form action="customercommentinesert.action" method="post"
								id="commentForm" style="margin-top: 5%;">
								<div id="area_dv" class="input-group"
									style="position: relative;">
									<textarea name="qna_an_content" id="qna_an_content"
										class="form-control" placeholder=""
										style="height: 100px; width: 100%; resize: none;"></textarea>
									<span class="input-group-btn">
										<button id="reply_submit_btn" class="btn btn-default"
											type="submit" style="height: 100px; width: 100px;">등록</button>
									</span>
								</div>
							</form>
						</div>
						<!--/row -->
					</div>
				</div>
				<!--/row list_lump-->
			</div>
			<!-- /view_reply -->
			<div class="btn-group-lg col-lg-12" role="group" align="center"
				style="padding-top: 30px;">
				<button type="button" class="btn-lg"
					style="color: black; background-color: white; border: 1px solid #e9e9e9"
					onclick="location.href=''">수정하기</button>
				<button type="button" class="btn-lg"
					style="color: white; background-color: #ff9b19; border: 1px solid #ff9b19;"
					onclick="history.back()">목록으로</button>
				<button type="button" class="btn-lg"
					style="color: black; background-color: white; border: 1px solid #e9e9e9"
					onclick="location.href='customerdelete.action?qna_id=${qnaContent.qna_id}'">삭제하기</button>
			</div>

		</div>
		<!--/talk_list -->
		<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
			<div class="sidebar-module sidebar-module-inset">
				<ul class="list-group">
					<li class="list-group-item"><a href="customeragreelist.action">이용약관</a></li>
					<li class="list-group-item"><a href="customertablelist.action">1:1
							문의</a></li>
				</ul>
			</div>
			<div class="sidebar-module sidebar-module-inset">
				<c:import url="../00_main/ADLine.jsp"></c:import>
			</div>
		</div>

	</div>
	<!-- /contents_area -->

	<!-- Site footer -->
	<footer class="footer">
		<c:import url="../00_main/Copyright.jsp"></c:import>
	</footer>

</body>
</html>