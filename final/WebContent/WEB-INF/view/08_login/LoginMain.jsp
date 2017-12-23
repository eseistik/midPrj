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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="<%=cp%>/js/insert/textchange.js"></script>
<!-- Bootstrap CSS -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link rel="stylesheet" href="css/login/login.css">
<link rel="stylesheet" href="css/login/base.css">

<script type="text/javascript">
	$(document).ready(
			function() {
				$("#inputId").on("textchange", function() {
					if (!/^[a-zA-Z0-9]*$/g.test($("#inputId").val())) {
						$("#inputId").val($("#inputId").val().slice(0, -1));
						alert("영문,숫자만 입력해주세요.");
					}

				});

				$("#inputPassword")
						.on(
								"textchange",
								function() {
									if (!/^[a-zA-Z0-9]*$/g.test($(
											"#inputPassword").val())) {
										$("#inputPassword").val(
												$("#inputPassword").val()
														.slice(0, -1));
										alert("영문,숫자만 입력해주세요.");
									}

								});

				$("#back").click(function() {
					alert("작성을 취소하시겠습니까?");
				});
				
				$("#login").click(function()
				{
					var check = document.getElementsByName("radio");
					
					for(var i = 0; i< check.length; i++)
					{
						if (check[i].checked == true)
						{
							if (check[i].value == 1) 
							{
								document.getElementById( 'from_id' ).setAttribute( 'action', 'ulogin.action' )
								document.getElementById( 'from_id' ).submit();
							}
							else if(check[i].value == 2)
							{
								document.getElementById( 'from_id' ).setAttribute( 'action', 'plogin.action' )
								document.getElementById( 'from_id' ).submit();
							}	
						}
						
					}

					
				});
				
			});
</script>

</head>
<body>
	<c:import url="WaveHeader.jsp" />

	<div class="container">

		<form class="form-signin" action="" id="from_id" method="post">
			<h2 class="form-signin-heading">로그인</h2>
			<label for="inputId" class="sr-only">아이디</label> 
				<input type="text" id="inputId" name="i_id" class="form-control" placeholder="아이디" required autofocus>
		    <label for="inputPassword" class="sr-only">비밀번호</label>
				<input type="password" id="inputPw" name="i_pw" class="form-control" placeholder="비밀번호" required>
				
			<button class="btn btn-default btn-lg btn-block" type="button" id="login">로그인</button>
			<div class="radio">
				<label><input type="radio" name="radio" value="1" checked="checked">일반</label>
				<label><input type="radio" name="radio" value="2">사업자</label>
			</div>
			<div class="form-line">
				<img alt="" src="images/login/a.png">
			</div>
			<div class="form-loginMenu">
				<p>
					<a href="membershipselect.action">회원가입</a>&nbsp;&nbsp;|&nbsp;&nbsp;
					<a href="findmembershipselect.action?findid=1">아이디 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;
					<a href="findmembershipselect.action?findid=2">비밀번호 찾기</a>
				</p>
			</div>
		</form>

	</div>
	<!-- /container -->

</body>

</html>