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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/ajax/ajax.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- Modal -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Customer CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/login/sign.css">

<script type="text/javascript">

	$(function() {
		var nickname = $("#inputNickname").val();	
	
		$("#inputPassword1").blur(function() {
			if ($.trim($("#inputPassword1").val()) == "") {
				var str = "비밀번호를 입력하세요.";
				document.getElementById("pwCheck").innerHTML = str;
				$("#inputPassword1").focus();
			} else
				document.getElementById("pwCheck").innerHTML = "";
		});

		$("#inputPassword2").blur(function() {
			checkPw();
		});

		$("#inputPassword3").blur(function() {
			if ($("#inputPassword3").val() == "") {
				var str = "질문을 선택해 주세요.";
				document.getElementById("pwCheck3").innerHTML = str;
				$("#inputPassword3").focus();
			} else
				document.getElementById("pwCheck3").innerHTML = "";
		});

		$("#inputPassword4").blur(
				function() {
					if ($("#inputPassword4").val() == "") {
						var str = "답변을 입력해 주세요.";
						document.getElementById("pwCheck4").innerHTML = str;
						$("#inputPassword4").focus();
					} else if ($("#inputPassword4").val() != ""
							&& $("#inputPassword4").val().length < 5) {
						var str = "최소 5자 이상으로 입력해 주세요.";
						document.getElementById("pwCheck4").innerHTML = str;
						$("#inputPassword4").focus();
					} else
						document.getElementById("pwCheck4").innerHTML = "";
				});

		$("#inputEmail").blur(function() {
			if ($("#inputEmail").val() == "") {
				var str = "Email 주소를 입력해 주세요.";
				document.getElementById("emailCheck").innerHTML = str;
				$("#inputEmail").focus();
			} else
				document.getElementById("emailCheck").innerHTML = "";
		});

		$("#backEmail").blur(function() {
			if ($("#backEmail").val() == "") {
				var str = "도메인 주소를 입력해 주세요.";
				document.getElementById("emailCheck").innerHTML = str;
				$("#backEmail").focus();
			} else
				document.getElementById("emailCheck").innerHTML = "";
		});

		$("#inputNickname").blur(
				function() {
					if ($("#inputNickname").val() == "") {
						var str = "닉네임을 입력해 주세요.";
						document.getElementById("nickCheck").innerHTML = str;
						$("#inputNickname").focus();
					} else if ($("#inputNickname").val() != ""
							&& $("#inputNickname").val().length < 2) {
						var str = "최소 2자 이상으로 입력해 주세요.";
						document.getElementById("nickCheck").innerHTML = str;
						$("#inputNickname").focus();
					} else
						document.getElementById("nickCheck").innerHTML = "";
				});
	});

	function checkPw() {
		if ($("#inputPassword1").val() != $("#inputPassword2").val()) {
			var str = "비밀번호가 틀립니다.";
			document.getElementById("pwCheck2").innerHTML = str;
			$("#inputPassword1").focus();
		} else
			document.getElementById("pwCheck2").innerHTML = "";
	}
	
	$(function() {
		$("#emailSelect").change(function() {

			if ($("#emailSelect").val() == 1) {
				$("#backEmail").val("");
				$("#backEmail").attr("readonly", false);
				$("#backEmail").focus();
			} else {
				$("#backEmail").val($("#emailSelect").val());
				$("#backEmail").attr("readonly", true);
			}
		});
	});

	$(document).ready(function() {
		$("#inputEmail").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^a-z0-9]/gi, ''));
			}
		});

		$("#backEmail").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^a-z0-9]/gi, ''));
			}
		});

		$("#inputId").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^a-z0-9]/gi, ''));
			}
		});

	});

	$(function() {

		$("#signin-btn").click(function() {
			var type = $('input:radio[name=FavorRecipe]').is(':checked');

			if (type == false) {
				var str = "선호하는 레시피를 선택해 주세요.";
				document.getElementById("radioCheck").innerHTML = str;
				$("#radioCheck").focus();
				return;
			}
			
			$("#SignupForm").submit();
			
		});
		
		$("#drop-btn").click(function() {
			
			var password = $("#inputPassword1").val()
			
			if (password == prompt("정말로 탈퇴하시겠습니까? 비밀번호 입력 후 확인 버튼을 눌러 주세요.")) {
				$("#SignupForm").attr("action", "infoDrop.action").submit();
			}
			else {
				alert("비밀번호가 틀렸습니다. 다시 시도해 주세요.");
				return;
			}
		});

	});

	</script>
<style type="text/css">
.sidebar-module {
	margin-top: 10%;
	text-align: center;
}
</style>
</head>
<body>

	<c:import url="../00_main/Menu.jsp" />

	<div class="container" style="width: 1200px;">
		<div class="col-md-8">
			<div class="signin-header">
				<h2>회원정보 수정</h2>
				<hr>
			</div>

			<form class="form-horizontal" id="SignupForm" name="SignupForm"
				action="infoUpdate.action" method="get">

				<div class="form-group">
					<label for="inputId" class="col-sm-2 control-label">아이디</label>

					<div class="col-sm-10">
						<input type="text" class="form-control inputText" id="inputId"
							name="inputId" placeholder="${myInfo.u_id }" value="${myInfo.u_id }" readonly>
					</div>
					<span id="idCheck" class="errId"></span>
				</div>
				<div class="form-group">
					<label for="inputPassword1" class="col-sm-2 control-label">비밀번호</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputPassword1"
							name="inputPassword1" placeholder="비밀번호" value="${myInfo.u_pw }">
					</div>
					<span id="pwCheck" class="errId"></span>
				</div>
				<div class="form-group">
					<label for="inputPassword2" class="col-sm-2 control-label">비밀번호
						확인</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputPassword2"
							name="inputPassword2" placeholder="비밀번호 확인">
					</div>
					<span id="pwCheck2" class="errId"></span>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">본인확인
						질문</label>
					<div class="col-sm-10">
						<select class="form-control" id="inputPassword3"
							name="inputPassword3">
							<option value="0">비밀번호 분실 시 사용할 질문을 선택해 주세요.</option>
							<c:forEach var="q" items="${qList }">
								<c:if test="${q.pq_val == myInfo.pq_val }">
									<option selected="selected" value="${q.pq_id }">${q.pq_val }</option>
								</c:if>
									<option value="${q.pq_id }">${q.pq_val }</option>
							</c:forEach>
						</select>
					</div>
					<span id="pwCheck3" class="errId"></span>
				</div>
				<div class="form-group">
					<label for="inputPassword4" class="col-sm-2 control-label">본인확인
						답변</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="inputPassword4"
							name="inputPassword4" placeholder="비밀번호 정답 (5자 이상으로 작성해 주세요.)" value="${myInfo.u_pq_answer }">
					</div>
					<span id="pwCheck4" class="errId"></span>
				</div>
				<div class="form-group">
					<label for="inputEmail" class="col-sm-2 control-label">이메일</label>
					<div class="col-sm-10">
						<input type="email" class="form-control inputText" id="inputEmail"
							name="inputEmail" value="${myInfo.u_email }" placeholder="이메일을 입력해 주세요." readonly>
					</div>
				</div>
				<div class="form-group">
					<label for="inputNickname" class="col-sm-2 control-label">닉네임</label>
					<div class="col-sm-10">
						<input type="text" class="form-control inputText col-md-7"
							id="inputNickname" name="inputNickname" placeholder="닉네임을 입력해 주세요." value="${myInfo.u_nickname }"
							style="width: 66.5%;">
						<button class="btn btn-default checkBtn col-md-4" type="button"
							id="checkNicknameBtn" onclick="checkNickname();">중복확인</button>
					</div>
					<span id="nickCheck" class="errId"></span>
				</div>
				<div class="form-group">
					<label for="inputPhoneNum" class="col-sm-2 control-label">전화번호</label>
					<div class="col-sm-10">
						<input type="tel" class="form-control inputText" id="inputTel"
							name="inputTel" placeholder="${myInfo.u_phone }" readonly>
					</div>
				</div>
				<div class="form-group">
					<label for="inputFavorRecipe" class="col-sm-2 control-label"
						style="padding-top: 0px;">선호 레시피</label>
					<div class="col-sm-10">
					
						<c:if test='${myInfo.f_val == "맛" }'>
							<input type="radio" id="inputFavorRecipe1" name="FavorRecipe" class="labelF" checked="checked" value="1">
							<label for="inputFavorRecipe1" id="FavorRecipe1">맛</label>
							<input type="radio" id="inputFavorRecipe2" name="FavorRecipe" class="labelF" value="3">
							<label for="inputFavorRecipe2" id="FavorRecipe2">편의성</label>
							<input type="radio" id="inputFavorRecipe3" name="FavorRecipe" class="labelF" value="2">
							<label for="inputFavorRecipe3" id="FavorRecipe3">창의성</label>
						</c:if>
						<c:if test='${myInfo.f_val == "편의성" }'>
							<input type="radio" id="inputFavorRecipe1" name="FavorRecipe" class="labelF" value="1">
							<label for="inputFavorRecipe1" id="FavorRecipe1">맛</label>
							<input type="radio" id="inputFavorRecipe2" name="FavorRecipe" class="labelF" checked="checked" value="3">
							<label for="inputFavorRecipe2" id="FavorRecipe2">편의성</label>
							<input type="radio" id="inputFavorRecipe3" name="FavorRecipe" class="labelF" value="2">
							<label for="inputFavorRecipe3" id="FavorRecipe3">창의성</label>
						</c:if>
						<c:if test='${myInfo.f_val == "창의성" }'>
							<input type="radio" id="inputFavorRecipe1" name="FavorRecipe" class="labelF" value="1">
							<label for="inputFavorRecipe1" id="FavorRecipe1">맛</label>
							<input type="radio" id="inputFavorRecipe2" name="FavorRecipe" class="labelF" value="3">
							<label for="inputFavorRecipe2" id="FavorRecipe2">편의성</label>
							<input type="radio" id="inputFavorRecipe3" name="FavorRecipe" class="labelF" checked="checked" value="2">
							<label for="inputFavorRecipe3" id="FavorRecipe3">창의성</label>
						</c:if>

					</div>
					<span id="radioCheck" class="errId"></span>
				</div>
				<div class="form-group">
					<div>
						<button type="button" class="btn btn-default btn-lg"
							id="signin-btn" style="background-color: white; margin-top: 0px; ">수정</button>
						<button type="button" class="btn btn-default btn-lg"
						id="drop-btn">회원탈퇴</button>
					</div>

				</div>
			</form>
		</div>

		<div class="col-md-3">
			<div class="sidebar-module sidebar-module-inset">
					<ul class="list-group">
						<li class="list-group-item"><a href="infoModify.action">회원정보</a></li>
						<li class="list-group-item"><a href="myTalk.action">my
								토크</a></li>
						<li class="list-group-item"><a
							href="myCooking.action">my 쿠킹클래스</a></li>
						<li class="list-group-item"><a href="myPoint.action">my 포인트</a></li>
						<li class="list-group-item"><a href="MyBannerViewList.jsp">my
								배너(사업자 전용)</a></li>
						<li class="list-group-item"><a href="logout.action">로그아웃</a></li>
					</ul>
				</div>
			<div class="sidebar-module">
				<c:import url="../00_main/ADLine.jsp"></c:import>
			</div>
		</div>
	</div>

	<!-- Site footer -->
	<footer class="footer">
		<c:import url="../00_main/Copyright.jsp"></c:import>
	</footer>

</body>
</html>