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
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<style type="text/css">
.form-agree #agreeText1, .form-agree #agreeText2 {
	margin-left: 40px;
}
</style>

<!-- Bootstrap CSS -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link rel="stylesheet" href="css/login/base.css">
<link rel="stylesheet" href="css/login/membershipAgree.css">
<script type="text/javascript">
	$(document).ready(function() {
		$(".checkbox1").click(function() {
			var checked = $(this).prop("checked");

			if (checked) {
				$(":checkbox[class=checkbox2]").prop("checked", true);
				$(":checkbox[class=checkbox3]").prop("checked", true);
			} else {
				$(":checkbox[class=checkbox2]").prop("checked", false);
				$(":checkbox[class=checkbox3]").prop("checked", false);
			}
		});

	});

	function doAgreeCheck() {
		if (!$('.checkbox2').is(':checked') || !$('.checkbox3').is(':checked')) {
			$('#checkMsg').show();
			return;
		} else {
			location.href="signup.action";
		}
	}
</script>
</head>

<body>

	<c:import url="WaveHeader.jsp" />

	<div class="container">

		<form class="form-agree">

			<div class="allCheck">
				<p class="agree1">이용약관, 개인정보 수집 및 이용에 모두 동의합니다.</p>
				<input type="checkbox" class="checkbox1">
			</div>
			<div class="agreeBoth">
				<div class="agreeCheck1">
					<p class="agree2">맛있당 이용약관 동의</p>
					<input type="checkbox" class="checkbox2">
					<textarea rows="10" cols="45" id="agreeText1" readonly="readonly">맛있당 이용약관은 다음과 같은 내용을 담고 있습니다. (2015년 6월 1일 시행)
 
1. 총칙 
2. 서비스 이용계약
3. 계약 당사자의 의무
4. 서비스 이용
5. 계약 해지 및 이용 제한
6. 손해배상 등

제1장 총칙

제 1 조 (목적) 

이 약관은 전기통신사업법령 및 정보통신망이용촉진등에 관한 법령에 의하여 (주)이지에이치엘디(이하 "회사"라 합니다)가 운영하는 10000recipe.com(맛있당) 인터넷 서비스 (이하 “서비스"라 한다)의 이용조건 및 절차에 관한 사항을 규정함을 목적으로 합니다.
 
제 2 조 (약관의 효력 및 변경) 

(1) 이 약관은 회사가 그 내용을 서비스 화면을 통해 게시하고 이용자가 이에 동의를 함으로써 효력을 발생합니다. 
(2) 회사는 합리적인 사유가 있을 경우 약관규제에 관한 법률, 정보통신망 이용촉진 및 정보보호등에 관한 법률 등 관련법을 위배하지 않는 범위에서 본 약관을 변경할 수 있으며, 이 경우 적용일자 및 개정사유를 명시하여 현행약관과 함께 맛있당의 초기화면에 그 적용일자 7일이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 맛있당는 개정전 내용과 개정후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. 
(3) 변경된 약관은 그 내용이 법령에 위배되지 않는 한 변경 이전에 회원으로 가입한 이용자에게도 적용됩니다. 변경된 약관에 이의가 있는 회원은 회사가 정한 양식에 따라 언제든지 회원등록을 취소(회원탈퇴)할 수 있으며, 약관의 효력발생일 이후 의 계속적인 서비스 이용은 약관의 변경사항에 동의한 것으로 간주됩니다
 
제 3 조 (약관 외 준칙) 

(1) 이 약관은 회사가 제공하는 서비스에 관한 이용규정 및 별도 약관과 함께 적용 됩니다.
(2) 이 약관에 명시되지 않은 사항과 이 약관의 해석에 관하여는 관련법령 및 상관 례에 따릅니다.
 
제 4 조 (용어의 정의) 

(1) 회원 : 회사에 일정한 개인정보를 제공하여 이용계약을 체결하고 아이디(ID)를 부여 받은 개인,회사,단체로 회사가 제공하는 서비스(제휴업체가 제공하는 서비스 제외)를 이용할 수 있는 자 
(2) 비밀번호 : 회원의 본인확인과 비밀보호를 위하여 선정한 문자, 숫자 또는 양자의 조합 
(3) 이용계약 : 서비스를 제공받기 위하여 이 약관으로 회사와 회원간에 체결하는 계약 
(4) 계약해지 : 회사 또는 회원이 서비스 개통 후 이용계약을 해약하는 것
 
제2장 서비스 이용계약

제 5 조 (이용계약의 성립) 

(1) 서비스 가입 신청시 본 약관을 읽고 "동의" 버튼을 누르면 이 약관에 동의하는 것으로 간주 됩니다. 
(2) 이용계약은 서비스 이용희망자의 이용약관 동의 후 이용신청에 대하여 회사가 승낙함으로써 성립합니다.
 
제 6 조 (이용신청) 

(1) 이용신청은 회사가 요청하는 소정의 가입신청 양식에서 요구하는 사항을 기록하여 신청합니다. 
(2) 온라인 가입신청 양식에 기재하는 모든 회원 정보는 실제 데이터인 것으로 간주하며 실제 정보를 입력하지 않은 사용자는 법적인 보호를 받을 수 없으며, 서비스 사용의 제한을 받을 수 있습니다.
 
제 7 조 : 개인정보 보호 정책 
(1) 회사는 이용 신청시 회원이 제공하는 정보, 커뮤니티 활동, 각종 이벤트 참가를 위하여 회원이 제공하는 정보 등을 통하여 회원에 관한 정보를 수집하며, 회원의 개인정보는 본 이용계약의 이행과 본 이용계약상의 서비스제공을 위한 목적으로 이용합니다. 
(2) 회사는 서비스 제공과 관련하여 취득한 회원의 신상정보를 본인의 승낙없이 제3자에게 누설 또는 배포할 수 없으며 상업적 목적으로 사용할 수 없습니다. 
다만, 다음의 각 호의 경우에는 그러하지 아니합니다.
1. 관계 법령에 의하여 수사상의 목적으로 관계기관으로부터 요구가 있는 경우 
2. 정보통신윤리위원회의 요청이 있는 경우 
3. 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우 
4. 정보통신서비스의 제공에 따른 요금 정산을 위하여 필요한 경우 
5. 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 알 아볼 수 없는 형태로 가공하여 제공하는 경우
(3) 회원이 회사 및 회사와 제휴한 서비스들을 편리하게 이용할 수 있도록 하기 위해 회원 정보는 회사와 제휴한 업체에 제공될 수 있습니다. 
단, 회사는 회원 정보 제공 이전에 제휴 업체, 제공 목적, 제공할 회원 정보의 내용 등을 사전에 공지하고 회원의 동의를 얻어야 합니다.
(4) 회사는 위 3항의 범위 내에서 회사의 업무와 관련하여 회원 전체 또는 일부의 개인정보에 관한 집합적인 통계 자료를 작성하여 이를 사용할 수 있고, 서비스를 통하여 회원의 컴퓨터에 쿠키를 전송할 수 있습니다. 
이 경우 회원은 쿠키의 수신을 거부하거나 쿠키의 수신에 대하여 경고 하도록 사용하는 컴퓨터의 브라우져의 설정을 변경할 수 있습니다.
(5) 회사는 다음의 각 호와 같은 경우에는 이용자의 동의 하에 개인정보를 제3자에게 제공할 수 있습니다. 
이러한 경우에도 개인정보의 제3자 제공은 이용자의 동의 하에서만 이루어지며 개인 정보가 제공되는 것을 원하지 않는 경우에는, 특정 서비스를 이용하지 않거나 특정한 형태의 판촉이나 이벤트에 참여하지 않으면 됩니다. 
1. 사이트 내의 컨텐츠 및 서비스 제공을 위하여 이용자의 ID 닉네임 이메일 주소 등이 해당 컨텐츠 및 서비스 제공자 또는 제휴사에게 제공될 수 있습니다. 
2. 사이트 내에서 벌어지는 각종 이벤트 행사에 참여한 회원의 개인정보가 해당 이벤트의 주최자에게 제공될 수 있습니다. 
(6) 회원이 이용신청서에 회원정보를 기재하고, 회사에 본 약관에 따라 이용신청을 하는 것은 회사가 본 약관에 따라 이용신청서에 기재된 회원정보를 수집, 이용 및 제공하는 것에 동의하는 것으로 간주됩니다. 
(7) 서비스에서의 개인정보보호와 관련된 보다 자세한 사항은 홈페이지에 게시된 개인정보취급방침을 참조하시기 바랍니다.
 
제 8 조 (이용신청의 승낙) 

(1) 회사는 회원이 제 6 조에서 정한 모든 사항을 정확히 기재하여 이용신청을 하였을 때 특별한 사정이 없는 한 접수 순서대로 이용신청을 승락합니다. 
(2) 회사는 다음 각 호에 해당하는 이용신청에 대하여는 승낙을 유보할 수 있고, 그 사유가 해소될 때까지 승낙을 유보할 수 있습니다. 
    1. 서비스 관련 설비에 여유가 없는 경우 
    2. 기술상 지장이 있는 경우 
    3. 기타 회사의 사정상 이용승낙이 곤란한 경우 
(3) 회사는 다음 각 호의 1에 해당하는 이용신청에 대하여는 이를 승낙하지 아니 할 수 있습니다. 
    1. 
    1. 다른 사람의 이메일 주소를 사용하여 신청한 경우 
    2. 이용 신청시 필요내용을 허위로 기재하여 신청한 경우 
    3. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우 
    4. 기타 회사가 정한 이용신청요건이 미비 된 경우
 
제 9 조 (계약사항의 변경) 

회원은 개인정보수정(http://10000recipe.com/user/update.html)을 통해 언제든지 개인정보를 열람하고 수정할 수 있습니다. 
회원은 이용신청시 기재한 사항이 변경되었을 경우에는 온라인으로 수정을 해야 하고 미변경으로 인하여 발생되는 문제의 책임은 회원에게 있습니다.
 
제3장 계약당사자의 의무

제 10 조 (회사의 의무) 

회사는 이 약관에서 정한 바에 따라 계속적이고 안정적인 서비스의 제공을 위하여 지속적으로 노력하며, 설비에 장애가 발생하는 경우 지체없이 이를 수리 복구하여야 합니다. 
다만, 천재지변, 비상사태 또는 그 밖에 부득이한 경우에는 그 서비스를 일시 중단하거나 중지할 수 있습니다. 
회사는 회원의 프라이버시 보호와 관련하여 제 7 조에 제시된 내용을 지킵니다. 
회사는 이용계약의 체결, 계약사항의 변경 및 해지 등 이용고객과의 계약 관련 절차 및 내용 등에 있어 이용고객에게 편의를 제공하도록 노력합니다.
 
제 11 조 (회원의 의무) 

(1) 회원은 서비스를 이용할 때 다음 각 호의 행위를 하지 않아야 합니다. 
1. 다른 회원의 ID와 비밀번호 등을 도용하는 행위 
2. 서비스에서 얻은 정보를 회사의 사전승낙 없이 회원의 이용이외의 목적으로 복제하거나 이를 출판및 방송 등에 사용하거나 제3자에게 제공하는 행위 
3. 회사의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 행위 
  - 위 사항을 위반시에는 즉각적인 경고 조치를 취하며 경고 2회시 탈퇴 조치를 취합니다. 
    단 저작권등 법적인(민,형사상 소송포함)문제를 발생시킬 경우 즉각적인 탈퇴 조치를 취합니다. 
    저작권등 법적인 문제 발생시에 당사는 책임이 없으며 게시물을 올린 게시자에게 책임이 있습니다. 
4. 공공질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형 등을 타인에게 유포하는 행위 
5. 범죄와 결부된다고 객관적으로 판단되는 행위 
6. 기타 관계법령에 위배되는 행위 
(2) 회원은 이 약관에서 규정하는 사항과 서비스 이용안내 또는 주의사항을 준수하여야 합니다. 
(3) 회원은 내용별로 회사가 서비스 공지사항에 게시하거나 별도로 공지한 이용제한 사항을 준수 하여야 합니다. 
(4) 회원은 회사의 사전 승낙없이는 서비스를 이용하여 영업활동을 할 수 없으며, 영업활동의 결과와 회원이 약관에 위반한 영업활동을 이용하여 발생한 결과에 대하여 회사는 책임을 지지 않습니다. 회원은 이와 같은 영업활동에 대하여 회사에 대하여 손해배상의무를 집니다. 
(5) 회원은 회사의 명시적인 동의가 없는 한 서비스의 이용권한, 기타 이용계약상 지위를 타인에 양도,증여할 수 없으며,이를 담보로 제공할 수 없습니다.
 
제4장 서비스 이용

제 12 조(서비스 이용 범위) 

회원은 회사를 통한 가입시 발급된 ID 하나로 서비스 모두를 이용할 수 있습니다.
 
제 13 조 (정보의 제공) 

(1) 맛있당는 회원이 서비스를 이용할 때 필요하다고 인정되는 다양한 정보의 추가 또는 변경내용을 공지사항이나 e-mail 등의 방법으로 회원에게 제공할 수 있습니다. 회원은 동 정보의 제공을 원하지 않는 경우 정보수신 거부를 할 수 있습니다. 
(2) 회원이 맛있당의 제휴사에서 제공하는 서비스를 이용할 경우, 회원은 제휴사에서 서비스 이용에 대하여 별도의 서비스 이용 절차를 필요로 하는 경우 서비스이용 신청을 하고 해당 서비스를 이용할 수 있습니다. 
1. 서비스제공 (TM 마케팅서비스를 포함합니다)과 회원관리 
2. 회사의 별첨 회사와의 업무제휴로 인한 회원의 정보 제공 및 활용
 
제 14 조 (요금 및 유료정보 등) 

회사가 제공하는 서비스는 기본적으로 무료입니다. 단, 별도의 유료정보에 대해서는 해당 정보에 명시된 요금을 지불하여야 사용 가능합니다.
 
제 15조 (유료정보 및 유료부가서비스의 이용) 

이용자의 유료 정보제공사이트나 부가서비스의 이용은 이용자가 다음의 결제정보를 회사에 전화 또는 온라인으로 다음 사항을 기입하여 신청을 하여야 합니다. 
(1) 납입자 이름 
(2) 영수증 수령 주소 
(3) 요금 결제 방법 및 세부사항 
(4) 전화번호
 
제 16 조 (회원의 개인정보) 

회사는 회원이 등록하는 서비스내의 내용물이 다음 각호에 해당한다고 판단되는 경우에는 사전동의 없이 조회, 수정, 삭제할 수 있습니다. 
(1) 다른 회원 또는 제3자를 비방하거나 중상모략으로 명예를 손상시키는 내용인 경우 
(2) 공공질서 및 미풍양속에 위반되는 내용인 경우 
(3) 범죄적 행위에 결부된다고 인정되는 내용일 경우 
(4) 회사의 저작권, 제 3 자의 저작권 등 기타 권리를 침해하는 내용인 경우 
(5) 회사에서 규정한 기간을 초과한 경우 
(6) 회원이 자신의 홈페이지와 음란물을 게재하거나 음란사이트를 링크하는 경우 
(7) 게시판의 성격에 부합하지 않는 게시물의 경우 
(8) 다른 회원의 신고로 조사가 필요한 경우 
(9) 회원이 관리자 접근을 허용한 경우 
(10) 기타 관계법령에 위반된다고 판단되는 경우
 
제 17 조 (저작권의 귀속 및 게시물의 이용) 

(1) 회사가 작성한 저작물에 대한 저작권, 기타 지적 재산권은 회사에 귀속합니다.
(2) 회원은 회사가 제공하는 서비스를 이용함으로써 얻은 정보를 회사의 사전 승낙없이 복제, 전송, 출판, 배포, 방송, 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.
(3) 회원이 서비스 내에 게시한 게시물의 저작권은 게시한 회원에게 귀속됩니다. 단, 회사는 서비스의 운영, 전시, 전송, 배포, 홍보의 목적일 경우 저작권법에 규정하는 공정한 관행에 합치된 합리적인 범위 내에서 회원의 별도의 허락없이 무상으로 다음과 같이 회원이 등록한 게시물을 사용할 수 있습니다.
    1. 서비스 내에서 회원 게시물을 저작물성을 해치지 않는 범위 내에서 복제, 수정, 개조할 수 있으며 이를 서비스의 운영, 전시, 전송, 배포할 수 있습니다.
    2. 미디어, 통신사 등 서비스 제휴 파트너사에 회원의 게시물 내용을 제공, 전시 혹은 홍보할 수 있습니다. 단, 이 경우 회사는 별도의 동의없이 회원의 이용자 ID
(또는 닉네임) 외에 회원의 개인정보를 제공하지 않습니다.
    3. 회사는 전항 이외의 방법이나 유상으로 회원의 게시물을 이용하고자 하는 경우 전화, 팩스, 전자우편 등의 방법을 통해 사전에 회원의 동의를 얻어야 합니다.
 
제 18 조 (정보의 제공 및 광고의 게재) 

(1) 회사는 서비스를 운영함에 있어 각종 정보를 서비스 화면에 게재하거나 e-mail, SMS 및 서신우편 등의 방법으로 회원에게 제공할 수 있습니다. 
(2) 회사는 서비스의 운영과 관련하여 홈페이지, 서비스 화면, SMS, e-mail등에 광고 등을 게재할 수 있습니다. 
(2) 회사는 본 서비스상에 게재되어 있거나 본 서비스를 통한 광고주의 판촉활동에 회원이 참여하거나 교신 또는 거래의 결과로서 발생하는 모든 손실 또는 손해에 대해 책임을 지지 않습니다.
 
제 19 조 (서비스 이용시간) 

(1) 서비스의 이용은 회사의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴 1일 24시간을 원칙으로 합니다. 
다만 정기 점검 등의 필요로 회사가 정한 날이나 시간은 그러하지 않습니다. 
(2) 회사는 서비스를 일정범위로 분할하여 각 범위별로 이용가능 시간을 별도로 정할 수 있습니다. 이 경우 그 내용을 사전에 공지합니다.
 
제 20 조 (서비스 이용 책임) 

회원은 회사에서 권한 있는 사원이 서명한 명시적인 서면에 구체적으로 허용한 경우를 제외하고는 서비스를 이용하여 상품을 판매하거나 사이트를 홍보하는 영업/홍보활동을 할 수 없으며 특히 해킹, 돈벌이 광고, 음란사이트를 통한 상업행위, 상용S/W 불법배포 등을 할 수 없습니다. 
이를 어기고 발생한 영업활동의 결과 및 손실, 관계기관에 의한 구속 등 법적 조치등에 관해서는 회사가 책임을 지지 않습니다.
 
제 21 조 (서비스 제공의 중지) 

(1) 회사는 다음 각 호에 해당하는 경우 서비스 제공을 중지할 수 있습니다. 
가.서비스용 설비의 보수 등 공사로 인한 부득이한 경우 
나.전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지했을 경우 
다.무료서비스에서 유료서비스로 전환한 후 공지한 기간내에 이용대금을 지불하지 않은 경우 
라.장기간 비로그인으로 인하여 휴면회원으로 변경된 경우 
    1. 회사는 장기간 로그인하지 않는 회원으로 인해 발생되는 불가피한 서비스 재원을 줄이기 위해서 휴면회원 관리정책을 실시합니다. 
    2. 회원이 이용약관을 통해서 맛있당 회원가입 후 서비스를 이용하는 도중 6개월 동안 로그인을 하지 않으면 회사는 회원으로 하여금 서비스 이용을 제한할 수 있습니다. 
    3. 서비스 제한중인 회원이 다시 로그인을 한 후, 제한해제를 시행하기 전까지 서비스 이용은 중지됩니다. 
마.기타 불가항력적 사유가 있는 경우 
(2) 회사는 국가비상사태, 정전, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 때에는 서비스의 전부 또는 일부를 제한하거나 정지할 있습니다. 
(3) 회사는 제 1 항 및 2항의 규정에 의하여 서비스의 이용을 제한하거나 중지한 때에는 그 사유 및 제한기간 등을 지체없이 회원에게 알려야 합니다.
   
제 5 장 계약해지 및 이용제한

제 22 조 (계약해지 및 이용제한) 

(1) 회원이 이용계약을 해지하고자 하는 때에는 회원 본인이 온라인을 통해 회사에 해지 신청을 하여야 합니다. 
단, 제22조 2항에 해당이 되어 맛있당에서 조사중인 경우에는 해지신청을 하실 수 없습니다. 
(2) 회사는 회원이 다음 각 호에 해당하는 행위를 하였을 경우 사전통지 없이 이용계약을 해지 하거나 또는 기간을 정하여 서비스 이용을 중지할 수 있습니다. 
    1. 타인의 서비스 ID 및 비밀번호를 도용한 경우 
    2. 서비스 운영을 고의로 방해한 경우 
    3. 가입한 이메일 주소가 본인의 이메일 주소가 아닌 경우 
    4. 공공질서 및 미풍양속에 저해되는 내용을 고의로 유포시킨 경우 
    5. 회원이 국익 또는 사회적 공익을 저해할 목적으로 서비스이용을 계획 또는 실행하는 경우 
    6. 타인의 명예를 손상시키거나 불이익을 주는 행위를 한 경우 
    7. 서비스의 안정적 운영을 방해할 목적으로 다량의 정보를 전송하거나 광고성 정보를 전송하는 경우 
    8. 정보통신설비의 오작동이나 정보 등의 파괴를 유발시키는 컴퓨터 바이러스 프로그램 등을 유포하는 경우 
    9. 회사, 다른 회원 또는 제3자의 지적재산권을 침해하는 경우 위원회의 유권해석을 받은 경우 
    10. 타인의 개인정보, 이용자ID 및 비빌번호를 부정하게 사용하는 경우 
    11. 회사의 서비스 정보를 이용하여 얻은 정보를 회사의 사전 승낙없이 복제 또는 유통시키거나 상업적으로 이용하는 경우 
    12. 회원이 자신의 홈페이지와 게시판에 음란물을 게재하거나 음란사이트 링크하는 경우 
 
    13. 본 약관을 포함하여 기타 회사가 정한 이용조건에 위반한 경우

제 6 장 손해배상 등

제 23 조 (손해배상)  

회사는 서비스 요금이 무료인 서비스 이용과 관련하여 회사의 고의, 과실에 의한 것이 아닌 한 회원에게 발생한 어떠한 손해에 관하여도 책임을 지지 않습니다. 
유료 서비스의 경우는 별도로 정하는 바에 따릅니다. 

제 24조 (면책조항)  

(1) 회사는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다. 
(2) 회사는 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다. 
(3) 회사는 회원이 서비스를 이용하여 기대하는 수익을 상실한 것에 대하여 책임을 지지않으며 그밖에 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다. 
(4) 회사는 회원이 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다. 
(5) 회사는 기간통신 사업자가 전기통신 서비스를 중지하거나 정상적으로 제공하지 아니하여 손해가 발생한 경우 책임이 면제됩니다. 
(6) 회사는 서비스용 설비의 보수, 교체, 정기점검, 공사, 과실이 없는 디스크 장애, 시스템 다운 등 부득이한 사유로 발생한 손해에 대한 책임이 면제됩니다. 
(7) 회사는 이용자 상호간 및 이용자와 제 3자 상호 간에 서비스를 매개로 발생한 분쟁에 대해 개입할 의무가 없으며, 이로 인한 손해를 배상할 책임도 없습니다. 
(8) 회사에서 회원에게 무료로 제공하는 서비스의 이용과 관련해서는 어떠한 손해도 책임을 지지 않습니다. 

제 25조 (관할법원)  

전자상거래등에서의소비자보호에관한법률 제36조(전속관할)조항에 따라, 맛있당와 이용자간에 발생한 전자거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속 관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 아니 하거나, 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.

[부칙]

부 칙 (2015. 6. 1 개정) 
1. (시행일) 본 약관은 2015년 6월 1일부터 시행합니다. 
2. 본 약관 시행 전에 이미 가입된 회원은 변경전의 약관이 적용됨을 원칙으로 합니다. 
다만, 공지된 바에 따라 변경된 약관의 시행일 이후에도 본 약관에 따른 서비스를 계속 이용하는 경우에는 변경후의 약관에 대해 동의한 것으로 봅니다.</textarea>
				</div>
				<div class="agreeCheck2">
					<p class="agree3">개인정보 수집 및 이용에 대한 안내</p>
					<input type="checkbox" class="checkbox3">
					<textarea rows="10" cols="45" id="agreeText2" readonly="readonly">· 수집하는 개인정보의 항목 및 수집방법
· 개인정보의 수집목적 및 이용목적
· 개인정보의 보유기간 및 이용기간, 파기절차, 파기방법


수집하는 개인정보의 항목 및 수집방법
가. 당사는 회원가입 시 서비스 제공을 위해 필요한 최소한의 개인정보만을 수집합니다.
나. 이용자가 당사의 서비스를 이용하기 위해서는 회원가입 시 개인정보를 입력하셔야 합니다.
1. 필수항목 : 아이디(ID), 비밀번호, 닉네임, 이메일주소, 성별, 생년월일
2. 선택항목 : 사진, 블로그주소, 위치정보(모바일서비스 이용 시)
다. 그 외에 이용자가 유료컨텐츠 및 일부 컨텐츠를 이용하는 경우 다음과 같은 결제를 위한 추가정보를 요구할 수 있습니다.
1. 결제방법에 따라
- 카드결제의 경우 : 신용카드 종류, 카드번호, 유효기한 등
- 휴대폰 결제의 경우 : 휴대폰 번호, 통신사 등
- 계좌이체의 경우 : 거래은행명, 계좌번호, 거래자성명 등
- 기타 결제방법별로 결제에 필요한 필수 정보
2. 상품배송에 필요한 정보로서 보내는 사람과 받는 사람의 성명, 주소, 연락처 등
라. 개인정보 수집방법
1. 회사는 다음과 같은 방법으로 개인정보를 수집합니다
- 홈페이지 회원가입, 회원정보수정, 팩스, 전화, 고객센터 문의하기, 이메일, 이벤트 응모, 배송요청
- 협력회사로부터의 제공 
- 생성정보 수집 툴을 통한 수집

개인정보의 수집목적 및 이용목적
가. 당사는 고객에게 서비스를 제공하기 위하여 필요한 개인정보를 수집, 이용하고 있습니다. 수집하는 개인정보 항목에 따른 구체적인 수집목적 및 이용목적은 다음과 같습니다.
① 아이디 : 서비스이용을 위한 본인확인
② 비밀번호 : 서비스이용을 위한 본인확인, 아이디도용 방지
③ 닉네임 : 일부 서비스에서 실명노출을 방지하여 개인정보 및 인격권 보호
④ 이메일주소 : 서비스이용을 위한 본인확인, 고객응대시의 본인확인, 이용자에 대한 고지사항 전달, 이용자의 불만사항 수렴을 위한 의사소통 경로의 확보, 서비스품질에 대한 의견 청취, 서비스이용에 대한 이용자 의사수렴, 각종 이벤트 혜택을 위한 안내, 아이디/비밀번호 분실 시 아이디 찾기 및 신규비밀번호 발급
⑤ 성별, 생년월일 : 회원제 서비스 이용에 따른 개인식별, 인구통계학적 특성에 따른 서비스 제공, 회원의 서비스이용에 대한 통계
⑥ 사진 : 프로필 상 이용자의 구분
⑦ 자녀정보 : 서비스이용 시 편리한 사용을 위한 자녀정보 등록, 맞춤 서비스 제공
⑧ 블로그주소 : 마니아 및 기타 활동을 위한 자격확인
⑨ 일반 전화번호, 주소 : 유료서비스/이벤트경품/쇼핑물품 등의 배송, 고지사항 전달, 지역정보 및 지역광고 서비스 제공
⑩ 은행계좌정보, 카드정보, 휴대폰번호 : 유료서비스 이용에 대한 요금 결제
단, 이용자의 기본적 인권 침해의 우려가 있는 민감한 개인정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록, 건강상태 및 성생활 등)는 수집하지 않습니다.


개인정보의 보유기간 및 이용기간, 파기절차, 파기방법
가. 이용자가 맛있당의 회원으로서의 자격을 유지하고 있는 동안에는 이용자가 회사에 제공한 개인정보를 계속 보유합니다.
나. 회원 탈퇴를 요청하거나 개인정보의 수집 및 이용에 대한 동의를 철회하는 경우, 수집 및 이용목적이 달성되거나 보유 및 이용기간이 종료한 경우 해당 개인정보를 지체 없이 파기합니다.
단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.
불건전한 서비스 이용으로 서비스에 물의를 일으킨 회원의 경우 사법기관 수사의뢰 및 서비스 계약을 해지한 고객의 서비스 이용신청에 대한 승낙을 유보하고, 다른 회원을 보호할 목적으로 회원탈퇴 이후에도 해당 개인정보를 1년간 보유할 수 있습니다.
다. 그리고 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.
① 보존 항목: 서비스 이용기록, 접속 로그, 접속 IP 정보 
② 보존 근거: 통신비밀보호법 
③ 보존 기간: 3개월 
④ 표시/광고에 관한 기록: 6개월 (전자상거래등에서의 소비자보호에 관한 법률) 
⑤ 계약 또는 청약철회 등에 관한 기록: 5년 (전자상거래등에서의 소비자보호에 관한 법률)
⑥ 대금결제 및 재화 등의 공급에 관한 기록: 5년 (전자상거래등에서의 소비자보호에 관한 법률) 
⑦ 소비자의 불만 또는 분쟁처리에 관한 기록: 3년(전자상거래등에서의 소비자보호에 관한 법률) 
라. 회원이 본인이 당사의 회원임을 증빙하기 위해 회사에 발송한 신분증 사본 등 서류일체는 본인확인 후 즉시 파기합니다.
마. 귀하의 동의를 받아 보유하고 있는 거래정보 등을 귀하께서 열람을 요구하는 경우 당사는 지체 없이 그 열람 확인 할 수 있도록 조치합니다.
바. 이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다. 파기절차 및 방법은 다음과 같습니다. 
① 파기절차 
- 이용자가 회원가입 등을 위해 입력한 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조)일정 기간 저장된 후 파기됩니다.
- 동 개인정보는 법률에 의한 경우가 아니고서는 보유되는 이외의 다른 목적으로 이용되지 않습니다.
② 파기방법 
- 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.
- 전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.</textarea>
				</div>
			</div>
		</form>

	</div>
	<!-- /container -->

	<div class="container-footer">
		<p id="checkMsg"
			style="margin-top: 10px; text-align: center; color: #FF0000; display: none;">이용약관과
			개인정보 수집 및 이용에 대한 안내 모두 동의해 주세요.</p>
		<p style="text-align: center;">
			<button type="button" onclick="doAgreeCheck()"
				class="btn btn-default btn-lg" id="signupBtn" style="width: 210px;">동의</button>
			<button type="button" onclick="location.href='LoginMain.jsp'"
				class="btn btn-default btn-lg" style="width: 210px;">비동의</button>
		</p>
	</div>

</body>
</html>
