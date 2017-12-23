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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
.img-circle {
	width: 50px;
}

.img-rounded {
	width: 575px;
}

.glyphicon {
	font-size: 15pt;
}

.media-heading {
	font-size: 13pt;
}

.sidebar-module {
	margin-top: 10%;
	text-align: center;
}
</style>
<script type="text/javascript">
	function like(val, id) {
		
		var rr_co_id = val;
		var rr_id = id;
		
		alert("정말 공감하시겠습니까? 공감 버튼을 한 번 더 눌러 주세요.");
		
		$('.likeComment').attr("href", "recipeRequestLike.action?rr_co_id="+ rr_co_id +"&rr_id="+ rr_id).click();
	}

	function choose(val, id) {
		
		var rr_co_id = val;
		var rr_id = id;
		
		alert("정말 채택하시겠습니까? 채택 버튼을 한 번 더 눌러 주세요.");
		
		$('.chooseComment').attr("href", "recipeRequestSelect.action?rr_co_id="+ rr_co_id +"&rr_id="+ rr_id);
	}

	function declare() {
		var u_id = document.getElementById("u_id").value;
		var report_u_id = document.getElementById("report_u_id").value;
		var popUrl = "reportviewList.action?u_id="+u_id+"&report_u_id="+report_u_id;

		var popOption = "width=370, height=310, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)

		window.open(popUrl, "", popOption);
	};
	
	function link() {
		var rr_co_content = $('#rr_co_content').val();
		
		if (rr_co_content == null || rr_co_content == "") {
			alert("댓글 내용을 입력해 주세요.");
			return;
		}
		else {
			if (confirm("링크를 등록하시겠습니까?")) {
				var url = prompt("등록하실 링크를 입력해 주세요.", "");
				
				if (url == null || url == "") {
					alert("입력된 값이 없습니다. 다시 시도해 주세요.");
					return;
				}
				else {
					$('#rr_id').val();
					$('#rr_co_url').val(url);
					$('#commentForm').submit();
				}
			}
			else {
				$('#rr_id').val();
				$('#rr_co_url').val("");
				$('#commentForm').submit();
			}
		}
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
					<div class="col-xs-12">
						<div class="row">
							<div class="col-md-12">
								<h4>${recipeContent.rr_title }</h4>
								<h6 style="display: inline-block;"><strong>${recipeContent.u_nickname }</strong> | ${recipeContent.rr_date } | ${recipeContent.rr_point } 밥알</h6>
								<%
									if (session.getAttribute("id") != null) {
								%>
									<div class="row view_btn text-right pull-right" style="display: inline-block;">
										<button type="button" class="btn btn-default" onclick="declare();" style="margin-right: 25px;">신고</button>
									</div>
								<%
									}
								%>
								<hr>
							</div>
							<div class="col-xs-12 summary">${recipeContent.rr_content }</div>
						</div>
						<!--/row -->
					</div>
				</div>
				<!--/row list_lump-->
				
				<!-- 댓글 시작 구간 -->
				<div class="view_reply" style="margin-top: 30px;">
					<div class="reply_tit">
						댓글 <span>${CommentCount }</span>
					</div>
					<div id="prev_comment"></div>

					<!--/media reply_list -->
					<c:forEach var="recipeRequestComment" items="${recipeRequestCommentList }">
					<div id="reply_list_2282946" class="media reply_list"
						style="margin-top: 15px; border: 1px solid #d2cdcd;">
						<div class="media-left">
							<a href="/profile/index.html?uid=64872074"><img
								class="img-circle" class="media-object"
								src="${recipeRequestComment.u_profile_img }"
								data-holder-rendered="true"></a>
						</div>
							
						<div class="media-body" style="position: relative;">
							<h4 class="media-heading">
								<strong class="info_name_f" onclick="" style="cursor: pointer;">
								${recipeRequestComment.u_nickname }</strong>
								<small>${recipeRequestComment.rr_co_date }
								<img alt="좋아요" src="<%=cp %>/images/recipe/iconmonstr-thumb-13-24.png">
								<strong> ${recipeRequestComment.rr_co_like } </strong>
								<%
									if (session.getAttribute("id") != null) {
								%>
								<a href="JavaScript:like('${recipeRequestComment.rr_co_id }', '${recipeContent.rr_id }');" 
									class="likeComment">공감</a> <span>|</span>
								<c:if test="${recipeStu == 0 }">
									<a href="JavaScript:choose('${recipeRequestComment.rr_co_id }', '${recipeContent.rr_id }');" 
										class="chooseComment">채택</a> <span>|</span>
								</c:if>
								<a href="">신고</a>
								</small>
								<%
									}
								%>
							</h4>
							<strong>${recipeRequestComment.rr_co_url }</strong> ${recipeRequestComment.rr_co_content }
						</div>
					</div>
					</c:forEach>
					</div>
					
					<div class="view_reply" style="margin-top: 30px;">
					<form action="recipeRequsetCommentInsert.action" method="post" id="commentForm">
						<input type="hidden" id="rr_id" name="rr_id" value="${recipeContent.rr_id }">
						<input type="hidden" id="u_id" name="u_id" value="<%=id %>">
						<input type="hidden" id="rr_co_url" name="rr_co_url">
						<div id="area_dv" class="input-group" style="position: relative;">
							<textarea name="rr_co_content" id="rr_co_content" class="form-control"
								placeholder="" style="height: 100px; width: 100%; resize: none;"></textarea>
							<span class="input-group-btn">
								<button id="reply_submit_btn" class="btn btn-default" type="button"
										style="height: 100px; width: 100px;" onclick="link();">등록</button>
							</span>
						</div>
					</form>
					<div class="btn-group-lg col-lg-12" role="group" align="center"
						style="margin-top: 30px;">
						<%-- <%
							if (session.getAttribute("id") == null) {
						%>
							<button type="button" class="btn-lg"
							style="color: white; background-color: #ff9b19; border: 1px solid #ff9b19;"
							onclick="location.href='recipeRequest.action'">목록으로</button>
						<%
							}
							else {
						%> --%>
						<button type="button" class="btn-lg"
								style="color: black; background-color: white; border: 1px solid #e9e9e9"
								onclick="location.href='recipeModifyForm.action?rr_id=${recipeContent.rr_id }'">수정하기</button>
						<button type="button" class="btn-lg"
							style="color: white; background-color: #ff9b19; border: 1px solid #ff9b19;"
							onclick="location.href='recipeRequest.action'">목록으로</button>
						<button type="button" class="btn-lg"
							style="color: black; background-color: white; border: 1px solid #e9e9e9"
							onclick="location.href=''">삭제하기</button>
						<%-- <%
							}
						%> --%>
					</div>
				</div>

			</div>
			<!-- /view_reply -->

		</div>
		<!--/talk_list -->
		<div id="right_area" class="col-sm-3 col-sm-offset-1 blog-sidebar">
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
	<!-- /contents_area -->

	<c:import url="../00_main/Copyright.jsp"></c:import>

</body>
</html>