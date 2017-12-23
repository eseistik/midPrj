<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	HttpSession Session = request.getSession();
	String id = (String)session.getAttribute("id");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛있당</title>
<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
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
<script type="text/javascript">
	function declare() {
		var u_id = document.getElementById("u_id").value;
		var report_u_id = document.getElementById("report_u_id").value;
		var popUrl = "reportviewList.action?u_id="+u_id+"&report_u_id="+report_u_id; //팝업창에 출력될 페이지 URL

		var popOption = "width=500, height=500, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)

		window.open(popUrl, "", popOption);
	};
	
	function co_declare() {
		var u_co_id = document.getElementById("u_co_id").value;
		var popUrl = "reportviewList.action?u_id=coyo4&u_co_id="+u_co_id; //팝업창에 출력될 페이지 URL

		var popOption = "width=500, height=500, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)

		window.open(popUrl, "", popOption);
	};
</script>
</head>
<body>

	<c:import url="../00_main/Menu.jsp"></c:import>

	<!-- 게시물 글 조회 -->
	<div class="container" style="width: 1200px;">

		<div id="contents_area" class="col-sm-8">
			<div class="talk_list">
				<div class="row list_lump" style="margin-top: 30px;">
					<input type="hidden" value="${viewContents.u_id }" id="report_u_id" name="report_u_id">
					<div class="col-xs-2">
						<a href="MyTalkMainViewList.jsp"><img class="img-circle"
							src="${viewContents.u_profile_img }" /></a>
					</div>
					<div class="col-xs-10">
						<div class="row">
							<div class="col-xs-9">
								<h4 class="media-heading">
									<b class="info_name_f" onclick="" style="cursor: pointer;">${viewContents.u_nickname }</b>
									<p>${viewContents.t_date }</p>
								</h4>
							</div>
							<div class="col-xs-12 summary">${viewContents.t_content }</div>
							<div class="col-xs-12">
								<img class="img-rounded" src="${viewContents.t_img }">
							</div>
						</div>
						<!--/row -->
					</div>
				</div>
				<!--/row list_lump-->

				<div style="text-align: right; margin-top: 3%;">
					<button type="button" class="btn btn-default" onclick="declare();">신고</button>
				</div>
				<!-- 댓글 시작 구간 -->
				<div class="view_reply" style="margin-top: 30px;">
					<div class="reply_tit">
						댓글 <span><%=request.getParameter("count")%></span>
					</div>
					<div id="prev_comment"></div>

					<c:forEach var="comments" items="${viewComments }">
						<div id="${comments.t_co_id }" class="media reply_list"
							style="margin-top: 15px;">
							<input type="hidden" value="${comments.u_co_id }" id="u_co_id" name="u_co_id">
							<div class="media-left">
								<a href="/profile/index.html?uid=86451183"><img
									class="img-circle" class="media-object"
									src="${comments.u_profile_img }" data-holder-rendered="true"></a>
							</div>
							<div class="media-body" style="position: relative;">
								<h4 class="media-heading">
									<strong class="info_name_f" onclick="" style="cursor: pointer;" id="u_c">${comments.u_nickname }</strong><small>${comments.t_co_date }
										<span>|</span><a href="JavaScript:co_declare();">신고</a>
									</small>
								</h4>
								${comments.t_co_content }
							</div>
						</div>
					</c:forEach>

					<div id="next_comment"></div>

					<form id="area_dv" class="input-group"
						action="talkCommentInsert.action" method="get"
						style="position: relative; margin: 2% 0;">
						<input type="hidden" value="${viewContents.t_id }" id="t_id"
							name="t_id"> <input type="hidden" value="<%=id %>" id="u_id"
							name="u_id">
						<textarea name="t_co_content" id="t_co_content"
							class="form-control" placeholder=""
							style="height: 100px; width: 640px; resize: none;"></textarea>
						<span class="input-group-btn" style="margin-top: 2%;"><button
								id="reply_submit_btn" class="btn btn-default" type="submit"
								style="height: 100px; width: 100px;">등록</button></span>
					</form>


					<div class="btn-group-lg col-lg-12" role="group" align="center"
						style="margin-top: 30px;">
						<button type="button" class="btn-lg"
							style="color: black; background-color: white; border: 1px solid #e9e9e9"
							onclick="location.href='talkmodifyContent.action?t_id='+${viewContents.t_id }">수정하기</button>
						<button type="button" class="btn-lg"
							style="color: white; background-color: #ff9b19; border: 1px solid #ff9b19"
							onclick="location.href='talkviewlist.action?t_id='">목록으로</button>
						<button type="button" class="btn-lg"
							style="color: black; background-color: white; border: 1px solid #e9e9e9"
							onclick="location.href='TalkViewList.jsp'">삭제하기</button>
					</div>
				</div>

			</div>
			<!-- /view_reply -->

		</div>
		<!--/talk_list -->
		<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
			<div class="sidebar-module sidebar-module-inset">
				<ul class="list-group">
					<li class="list-group-item"><a href="talkInsertForm.action">토크 등록</a></li>
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