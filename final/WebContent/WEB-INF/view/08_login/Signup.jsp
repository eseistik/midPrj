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

<!-- Modal -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Customer CSS -->
<link rel="stylesheet" type="text/css" href="css/login/base.css">
<link rel="stylesheet" type="text/css" href="css/login/sign.css">
<script type="text/javascript" src="<%=cp%>/js/insert/ajax.js"></script>

<script type="text/javascript">

	$(function() {
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
				var str = "질문을 선택해주세요.";
				document.getElementById("pwCheck3").innerHTML = str;
				$("#inputPassword3").focus();
			} else
				document.getElementById("pwCheck3").innerHTML = "";
		});

		$("#inputPassword4").blur(
				function() {
					if ($("#inputPassword4").val() == "") {
						var str = "답변을 입력해주세요.";
						document.getElementById("pwCheck4").innerHTML = str;
						$("#inputPassword4").focus();
					} else if ($("#inputPassword4").val() != ""
							&& $("#inputPassword4").val().length < 1) {
						var str = "최소 1자 이상으로 입력해주세요.";
						document.getElementById("pwCheck4").innerHTML = str;
						$("#inputPassword4").focus();
					} else
						document.getElementById("pwCheck4").innerHTML = "";
				});

		$("#inputEmail").blur(function() {
			if ($("#inputEmail").val() == "") {
				var str = "Email 주소를 입력해주세요.";
				document.getElementById("emailCheck").innerHTML = str;
				$("#inputEmail").focus();
			} else
				document.getElementById("emailCheck").innerHTML = "";
		});

		$("#backEmail").blur(function() {
			if ($("#backEmail").val() == "") {
				var str = "도메인 주소를 입력해주세요.";
				document.getElementById("emailCheck").innerHTML = str;
				$("#backEmail").focus();
			} else
				document.getElementById("emailCheck").innerHTML = "";
		});

		$("#inputNickname").blur(
				function() {
					if ($("#inputNickname").val() == "") {
						var str = "닉네임을 입력해주세요.";
						document.getElementById("nickCheck").innerHTML = str;
						$("#inputNickname").focus();
					} else if ($("#inputNickname").val() != ""
							&& $("#inputNickname").val().length < 2) {
						var str = "최소 2자 이상으로 입력해주세요.";
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
			if (!((event.keyCode >= 37 && event.keyCode <= 40) || event.keyCode  == 46)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^a-z0-9.]/gi, ''));
			}
		});

		$("#inputId").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^a-z0-9.]/gi, ''));
			}
		});

	});

	$(function() {
		
		$("#signin-btn").click(function() {
			var type = $('input:radio[name=FavorRecipe]').is(':checked');

			if (type == false) {
				var str = "선호하는 레시피를 선택해주세요.";
				document.getElementById("radioCheck").innerHTML = str;
				$("#radioCheck").focus();
				return;
			}
		});
		
	});
	
	
	var cnt = 30;
	function countdown()
    {     
       cnt--;
       if (cnt == 0) //0초일때는 다시 입력하게 세션을 끊는다거나 다른 조치가 필요~!!
          document.getElementById('emailCheck').innerHTML = "인증번호를 다시 전송하세요.";
       else if (cnt > 0)
       {
          document.getElementById('emailCheck').innerHTML = cnt+'초 안에 입력해주세요';
             /* cnt+'초 안에 입력해주세요'; */
          setTimeout("countdown()", 1000);
       }
    
    };
    
    function check4444()
	{
		alert("확인 완료.");
		cnt=0;
		document.getElementById('emailCheck').innerHTML = "";
	}
    
    var cnt2 = 30;
	function countdown2()
    {     
       cnt2--;
       if (cnt2 == 0) //0초일때는 다시 입력하게 세션을 끊는다거나 다른 조치가 필요~!!
          document.getElementById('telCheck').innerHTML = "인증번호를 다시 전송하세요.";
       else if (cnt2 > 0)
       {
          document.getElementById('telCheck').innerHTML = cnt2+'초 안에 입력해주세요';
             /* cnt+'초 안에 입력해주세요'; */
          setTimeout("countdown2()", 1000);
       }
    
    };
    
    function check5555()
	{
		alert("확인 완료.");
		cnt2=0;
		document.getElementById('telCheck').innerHTML = "";
	}
    
    
    
    function CheckId()
	{
    	
    	if ($.trim($("#inputId").val()) == '') 
        {
            alert('아이디를 입력해주세요.');
            $("#inputId").focus();
            return isSubmit = false;
        }
    	
    	
		var inputId = document.getElementById("inputId").value;
		
		// URL 구성
		var url = "/99_Dispatcher/ucheckid.action?u_id="+inputId;

		// XMLHTTPRequest 객체 생성
		var ajax = createAjax();

		ajax.open("GET", url, true);

		ajax.onreadystatechange = function() {

		// alert(ajax.readyState);

			if (ajax.readyState == 4) {
			// alert(ajax.status);

				if (ajax.status == 200) {
					callBack(ajax);
				}
			}
		}

		ajax.send("");
	}

	// AJAX 요청이 완료된 후 호출되는 최종 함수 (콜백 함수)
	function callBack(ajax) {
		var data = ajax.responseText;
		
		var checkHTML = "";
		
		if (data==0)
		{
			checkHTML += "사용 가능한 아이디 입니다.";
			alert(checkHTML);
		}
		else
		{
			checkHTML += "이미 등록된 아이디 입니다.";
			alert(checkHTML);
			$("#inputId").val('');
			$("#inputId").focus();
		}
	}
	
	
	function CheckNick()
	{
    	
    	if ($.trim($("#inputNickname").val()) == '') 
        {
            alert('닉네임을 입력해주세요.');
            $("#inputNickname").focus();
            return isSubmit = false;
        }
    	
		var inputNickname = document.getElementById("inputNickname").value;
		

		
		// URL 구성
		var url = "/99_Dispatcher/uchecknick.action?u_nick="+inputNickname;

		// XMLHTTPRequest 객체 생성
		var ajax = createAjax();

		ajax.open("GET", url, true);

		ajax.onreadystatechange = function() {

		// alert(ajax.readyState);

			if (ajax.readyState == 4) {
			// alert(ajax.status);

				if (ajax.status == 200) {
					callBackNick(ajax);
				}
			}
		}

		ajax.send("");
	}

	// AJAX 요청이 완료된 후 호출되는 최종 함수 (콜백 함수)
	function callBackNick(ajax) {
		var data = ajax.responseText;
		
		var checkHTML = "";
		
		
		if (data==0)
		{
			checkHTML += "사용 가능한 닉네임 입니다.";
			alert(checkHTML);
		}
		else
		{
			checkHTML += "이미 등록된 닉네임 입니다.";
			alert(checkHTML);
			$("#inputNickname").val('');
			$("#inputNickname").focus();
		}
				
	}
	
	
	
	
</script>

<script type="text/javascript">
	
	function signsubmit()
	{
		if ($.trim($("#inputId").val()) == '') 
        {
            alert('아이디를 입력해주세요.');
            $("#inputId").focus();
            return isSubmit = false;
        }
		
		
		var form = document.getElementById("SignupForm");
		form.action = "/99_Dispatcher/signinsert.action";
		form.submit();
	}
</script>


</head>
<body>

	<c:import url="WaveHeader.jsp" />

	<div class="container">

		<div class="signin-header">
			<h2>회원가입</h2>
		</div>

		<form class="form-horizontal" id="SignupForm" name="SignupForm"
			action="" method="post">

			<div class="form-group">
				<label for="inputId" class="col-sm-2 control-label">아이디</label>

				<div class="col-sm-10">
					<input type="text" class="form-control inputText" id="inputId"
						name="inputId" placeholder="ID">
					<button type="button" class="btn btn-default checkBtn" onclick="CheckId()"
						id="checkIdBtn">중복확인</button>
				</div>
				<span id="idCheck" class="errId"></span>
			</div>
			<div class="form-group">
				<label for="inputPassword1" class="col-sm-2 control-label">비밀번호</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="inputPassword1"
						name="inputPassword1" placeholder="비밀번호">
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
						<option value="">비밀번호 분실 시 사용할 질문을 선택해 주세요.</option>
						<c:forEach var="pqList" items="${pqList }">
							<option value="${pqList.pq_id }">${pqList.pq_val }</option>
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
						name="inputPassword4" placeholder="비밀번호 정답 (1자 이상으로 작성해주세요.)">
				</div>
				<span id="pwCheck4" class="errId"></span>
			</div>
			<div class="form-group">
				<label for="inputEmail" class="col-sm-2 control-label">이메일</label>
				<div class="col-sm-10 container">
					<input type="text" class="form-control" id="inputEmail"
						name="inputEmail" placeholder="이메일"
						style="width: 21%; display: inline-block;">
					<div style="width: 3%; display: inline-block;">@</div>
					<input type="text" class="form-control" id="backEmail"
						name="backEmail" placeholder="직접 입력"
						style="width: 21%; display: inline-block;"> <select
						class="form-control" id="emailSelect" name="emailSelect"
						style="width: 21%; display: inline-block; padding: 0 0 0 0;">
						<option value="1">직접 입력</option>
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
						<option value="daum.net">daum.net</option>
						<option value="paran.com">paran.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="yahoo.co.kr">yahoo.co.kr</option>
						<option value="empal.com">empal.com</option>
						<option value="lycos.co.kr">lycos.co.kr</option>
						<option value="korea.com">korea.com</option>
						<option value="dreamwiz.com">dreamwiz.com</option>
						<option value="freechal.com">freechal.com</option>

					</select>
					<button type="button" class="btn btn-default checkBtn" id="EmailCodeBtn" onclick="countdown();">인증번호
						전송</button>
					<div id="emailcount"></div>
				</div>
				<span id="emailCheck" class="errId"></span>
			</div>
			<div class="form-group">
				<label for="inputCode" class="col-sm-2 control-label">인증번호</label>
				<div class="col-sm-10">
					<input type="text" class="form-control inputText" id="inputCode1"
						name="inputCode1" placeholder="인증번호">
					<button type="button" class="btn btn-default checkBtn" onclick="check4444();" id="checkCodeBtn1">중복확인</button>
				</div>
				
				<span id="emailCheck2" class="errId"></span>
				
			</div>
			<div class="form-group">
				<label for="inputNickname" class="col-sm-2 control-label">닉네임</label>
				<div class="col-sm-10">
					<input type="text" class="form-control inputText" id="inputNickname" name="inputNickname" placeholder="닉네임">
					<button type="button" onclick="CheckNick();" class="btn btn-default checkBtn" id="checkNicknameBtn">중복확인</button>
				</div>
				<span id="nickCheck" class="errId"></span>
			</div>
			<div class="form-group">
				<label for="inputPhoneNum" class="col-sm-2 control-label">전화번호</label>
				<div class="col-sm-10">
					<select class="form-control" style="width: 21%; display: inline-block;"
					  id="phoneNum1" name="phoneNum1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="017">017</option>
					</select>
					<div style="width: 2%; display: inline-block;">-</div>
					<input type="text" class="form-control" id="inputPhoneNum1"
						name="inputPhoneNum1" style="width: 21%; display: inline-block;">
					<div style="width: 2%; display: inline-block;">-</div>
					<input type="text" class="form-control" id="inputPhoneNum2"
						name="inputPhoneNum2" style="width: 21%; display: inline-block;">
					<button type="button" class="btn btn-default checkBtn" id="TelCodeBtn" onclick="countdown2();">인증번호
						전송</button>
					<span id="telCheck" class="errId"></span>
				</div>
			</div>
			<div class="form-group">
				<label for="inputCode" class="col-sm-2 control-label">인증번호</label>
				<div class="col-sm-10">
					<input type="text" class="form-control inputText" id="inputCode2"
						name="inputCode2" placeholder="인증번호">
					<button type="button" class="btn btn-default checkBtn" onclick="check5555();" id="checkCodeBtn2">중복확인</button>
				</div>
			</div>
			<div class="form-group">
				<label for="inputFavorRecipe" class="col-sm-2 control-label"
					style="padding-top: 0px;">선호 레시피</label>
				<div class="col-sm-10">
					<c:forEach var="fList" items="${fList }">
						<input type="radio" id="inputFavorRecipe${fList.f_id }" name="FavorRecipe" value="${fList.f_id }" class="labelF" style="margin-right: 10px;"> 
						<label for="inputFavorRecipe${fList.f_id }" id="FavorRecipe${fList.f_id }" style="margin-right: 20px;">${fList.f_val}</label> 
					</c:forEach>
				</div>
				<span id="radioCheck" class="errId"></span>
			</div>
			<div class="form-group">
				<div>
					<button type="button" class="btn btn-default btn-lg"
						id="signin-btn" onclick="signsubmit()">회원가입</button>
				</div>

			</div>
		</form>
	</div>

</body>
</html>