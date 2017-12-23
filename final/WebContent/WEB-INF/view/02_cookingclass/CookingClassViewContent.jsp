<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛있당</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/cook/table.css">
<style type="text/css">
.cook-subInfo-list {
	text-align: center;
}

.cook-subInfo {
	text-align: center;
	display: inline-block;
	margin: 5%;
}

.cook-subInfo-list .cook-subInfo .cook-subInfo-value {
	margin-top: 2%;
}

.sidebar-module {
	text-align: center;
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
	function declare() {
		var popUrl = "Declare.jsp"; //팝업창에 출력될 페이지 URL

		var popOption = "width=370, height=310, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)

		window.open(popUrl, "", popOption);
	};
	
	function payment() {
		var popUrl = "ccpayment.action"; //팝업창에 출력될 페이지 URL

		var popOption = "width=780, height= 470, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)

		window.open(popUrl, "", popOption);
	};
</script>
</head>
<body>
	<c:import url="../00_main/Menu.jsp"></c:import>

	<div class="container" style="width: 1200px;">

		<div class="row" style="margin-top: 3%;">

			<div class="col-sm-8 blog-main">
				<div class="panel panel-default">
					<div class="panel-body">


						<img
							src="${content.cc_img }"
							style="width: 100%;">
						<div class="text-center"
							style="width: 100px; height: 100px; margin: -50px auto;">
							<img src="${content.u_profile_img }">
							<h4 style="margin-top: 20px"><img src="${content.grade_img }"> ${content.u_nickname }</h4>
						</div>
						<div class="view2_summary">
							<h2 align="center" style="margin-top: 20%;">${contnet.cc_title }</h2>
							<div
								style="margin-top: 5%; font-size: 15px; color: #414141; font-style: italic; text-align: center;">
								${content.cc_content }
							</div>

							<div class="cook-subInfo-list">
								<div>
									<div class="cook-subInfo" id="cooking-timeLimit">
										<img alt="신청기간" src="images/cook/iconmonstr-calendar-6-32.png">
										<div class="cook-subInfo-value">
											<div>신청 기간</div>
											<div>${content.cc_re_start } ~ ${content.cc_re_end }</div>
										</div>
									</div>
									<div class="cook-subInfo" id="cooking-count">
										<img alt="모집인원"
											src="images/cook/iconmonstr-user-31-32 (1).png">
										<div class="cook-subInfo-value">
											<div>모집 인원</div>
											<div>
												<strong>${reCount }</strong> / ${content.cc_people } 명
											</div>
										</div>
									</div>
									<div class="cook-subInfo" id="cooking-location">
										<img alt="위치" src="images/cook/iconmonstr-location-23-32.png">
										<div class="cook-subInfo-value">
											<div>위치</div>
											<div>${content.cc_addr }</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">클래스 정보</h4>
					</div>
					<div class="panel-body">
						<div class="col-md-6">
							<h4>[메뉴]</h4>
							<p class="account-list">${content.sma_ck_name }</p>
							<hr>
						</div>
						<div class="col-md-6">
							<h4>[가격]</h4>
							<p class="account-list">${price } 원</p>
							<hr>
						</div>
						<div class="col-md-6">
							<h4>[메뉴정보]</h4>
							<p class="account-list">인원: ${content.pp_name } / 시간: ${content.ct_name } / 난이도: ${content.dif_name }</p>
							<hr>
						</div>
						<div class="col-md-6">
							<h4>[클래스 시간]</h4>

							<div class="table" id="results">
								<div class='theader'>
									<div class='table_header'>회차</div>
									<div class='table_header'>메뉴</div>
									<div class='table_header'>일정</div>
								</div>
								<c:forEach var="timeList" items="${timeList}">
								<div class='table_row'>
									<div class='table_small'>
										<div class='table_cell'>회차</div>
										<div class='table_cell'>${timeList.cc_time_num }</div>
									</div>
									<div class='table_small'>
										<div class='table_cell'>메뉴</div>
										<div class='table_cell'>${timeList.cc_time_name }</div>
									</div>
									<div class='table_small'>
										<div class='table_cell'>일정</div>
										<div class='table_cell'>${timeList.cc_time_date } ${timeList.cc_time_start }</div>
									</div>
								</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">재료 명세서</h4>
					</div>
					<div class="panel-body">
						<div class="col-md-6 ingredient-list">
							<h4>[재료]</h4>
							<c:forEach var="ingList" items="${ingList }">
								<div class="ingredients">
									<p class="col-md-6 ingredient">${ingList.mid_ing_name }</p>
									<p class="col-md-4 price">${ingList.cc_ing_price }</p>
									<p class="col-md-2 price">${ingList.cc_ing_weight }${ingList.unit_name }</p>
								</div>
							</c:forEach>

						</div>
						<div class="col-md-6 ingredient-list">
							<h4>[기타 비용]</h4>
							<div>
								<c:forEach var="etcList" items="${etcList }">
									<p class="col-md-8 ingredient">${etcList.cc_etc_content }</p>
									<p class="col-md-4 price">${etcList.cc_etc_price }</p>
								</c:forEach>
							</div>
							<h4>[총 재료비]</h4>
							<div class="col-md-12 total-price">
								<p class="col-md-8"></p>
								<p class="col-md-4 total-price">${price } 원</p>
							</div>
						</div>
					</div>
				</div>





				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">완성 사진</h4>
					</div>
					<div class="panel-body">
						<div class="best_tit">
							<div style="text-align: center;">
								<c:forEach var="clList" items="${clList }">
									<img src="${clList.cc_cl_img }" style="width: 500px; height:500px;"> 
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
					
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">메뉴 소개</h4>
					</div>
					<div class="panel-body">
						<div class="best_tit">
							<div style="text-align: center;">
								<p>${content.cc_ck_content }</p>
							</div>
							<div class=""
								style="background-color: white; border: none; margin-bottom: 3%;">
							</div>
							<div class="view_notice"
								style="background-color: #eeeeee; border-radius: 10px; margin: auto;">
								<p class="view_notice_date col-xs-4">
									<span style="font-size: 11pt;">등록일 : ${content.cc_date }</span>
								</p>
								<p>
									<span style="font-size: 9pt; color: gray;">저작자의 사전 동의 없이
										이미지 및 문구의 무단 도용 및 복제를 금합니다.</span>
								</p>
							</div>
							<div style="text-align: right;">
								<button type="button" class="btn btn-default"
									onclick="declare();">신고</button>
							</div>
						</div>
					</div>
				</div>

				<!--/media reply_list -->
				<div class="panel panel-default">
					<div class="panel-body">
						
						< <c:forEach var="coList" items="${coList }">
							<div class="comment" style="height: 150px;">
								<div style="margin: 3%; float: left;">
									<img alt="프로필" src="${coList.u_profile_img }">
								</div>
								<div id="comment-info" style="float: left; margin-top: 4%;">
									<h4 class="media-heading">
										<strong class="info_name_f" onclick="" style="cursor: pointer;">${coList.u_nickname }</strong><small>
											${coList.cc_co_date } <a href="">답글</a><span>|</span><a href="">신고</a>
										</small>
									</h4>
									<div class="cooking-reply" style="font-size: 15px;">
										${coList.cc_co_content }
									</div>
								</div>
							</div>
						</c:forEach> 
						<div id="next_comment"></div>

						<div id="area_dv" class="input-group"
							style="position: relative; margin: 2% 0;">
							<textarea name="comment_tx" id="comment_tx" class="form-control"
								placeholder="" style="height: 100px; width: 640px; resize: none;"></textarea>
							<span class="input-group-btn" style="margin-top: 2%;"><button
									id="reply_submit_btn" class="btn btn-default" type="button"
									style="height: 100px; width: 100px;">등록</button></span>
						</div>
							
						<div class="btn-group-lg col-lg-12" role="group" align="center"
							style="padding: 3%;">
							<c:choose>
								<c:when test="${sessionScope.btn != 1}">
									<button type="button" class="btn-lg"
										style="color: white; background-color: #ff9b19; border: 1px solid #f3f3f3"
										onclick="location.href='cookingclass.action'">뒤로가기</button>
									<button type="button" class="btn-lg"
										style="color: white; background-color: green; border: 1px solid green;"
										onclick="location.href='cookingupdateform.action?cc_id=${content.cc_id }'">수정하기</button>
									<button type="button" class="btn-lg"
										style="color: white; background-color: red; border: 1px solid red;"
										onclick="location.href='cookingdeleteform.action?cc_id=${content.cc_id }'">삭제하기</button>
								</c:when>
								<c:when test="${sessionScope.btn == 1 }">
									<button type="button" class="btn-lg"
										style="color: white; background-color: #ff9b19; border:1px solid #f3f3f3;"
										onclick="location.href='cookingclass.action'">뒤로가기</button>
									<button type="button" class="btn-lg"
										style="color: white; background-color: #9c886c; border:1px solid #f3f3f3;"
										onclick="payment();">수강신청</button>
								</c:when>
							</c:choose>
						</div>
					
					</div>
				</div>
			</div>

			<!-- /.container -->
			<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
				<div class="sidebar-module sidebar-module-inset">
					<ul class="list-group" id="test">
						<li class="list-group-item">
						<a href="CookingInsertForm.jsp">쿠킹 클래스 모집</a></li>
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