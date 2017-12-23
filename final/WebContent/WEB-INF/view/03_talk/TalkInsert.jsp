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
<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	function readURL1(input) {
		if (input.files && input.files[0])
		{
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah1').attr('src', e.target.result);
			};

			reader.readAsDataURL(input.files[0]);
		}
	}
	
	$(document).ready(function ()
	{
		$("#submitBtn").click(function()
		{
			
			if($("#t_content").val()=="")
			{
				$("#err").html("토크내용을 작성해주세요!");
				$("#err").css("display", "inline");
				return
			}
			
			var src = $('#blah1').attr('src')

			$('t_img').val(src)
			
			$("#talkForm").submit();
			
		});
	});
	
</script>
<style type="text/css">
input[type=file] {
	padding: 10px;
	background: #2d2d2d;
}

input {
	display: none;
}
</style>
</head>
<body>

	<c:import url="../00_main/Menu.jsp"></c:import>

	<div class="container" style="width: 1200px;">

		<div id="contents_area" class="col-xs-9">
			<div class="row talk_title">
				<div class="col-xs-12">
					<h2 style="text-align: center;">토크 등록</h2>
					<hr>
				</div>
			</div>
			<div class="blank_bottom"></div>

			<form name="talkForm" action="inserttalk.action" id="talkForm" method="post" enctype="multipart/form-data"
				style="margin-top: 10px;">
				<div class="cs_write">

					<h4>토크 내용</h4>
					<input type="hidden" value="coyo4" id="u_id" name="u_id">
					<textarea id="t_content" name="t_content"
						class="form-control fixed" placeholder="내용" style="height: 200px;"></textarea>
					<div class="blank_bottom"></div>

					<!-- ☆important☆ -->
					<div class="form-group">
						<h4>첨부이미지</h4>
						<label for="t_img"> <img id="blah1"
							src="images/AD/photo1.PNG" style="height: 300px;">
						</label> <input type='file' onchange="readURL1(this);" name="t_img"
							id="t_img" style="display: none;"  />
						<hr>
					</div>

					<div class="blank_bottom"></div>
					<div class="btn-group-lg col-lg-12" role="group" align="center"
						style="margin-top: 30px;">
						<button type="button" class="btn-lg" id="listBtn"
							style="color: black; background-color: white; border: 1px solid #e9e9e9"
							onclick="location.href='talkviewlist.action'">목록으로</button>
						<button type="button" class="btn-lg"
							style="color: white; background-color: #ff9b19; border: 1px solid #ff9b19;"
							id="submitBtn">등록하기</button>
						<br> <span id="err"
							style="color: red; font-weight: bold; display: none;"> </span>
					</div>
				</div>
				<!-- /cs_write -->
			</form>

		</div>
		<!-- /contents_area -->
		<input type="hidden" name="" value="" />
		<div id="right_area" class="col-xs-3">
			<c:import url="../00_main/ADLine.jsp"></c:import>
		</div>
	</div>
	<!-- /contents_area -->
	<!-- /container -->

	<!-- Site footer -->
	<footer class="footer">
		<c:import url="../00_main/Copyright.jsp"></c:import>
	</footer>

</body>
</html>
