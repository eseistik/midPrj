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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	function readURL1(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah1').attr('src', e.target.result);
			};

			reader.readAsDataURL(input.files[0]);
		}
	}
	
	function requestModify() {
		
		var point = $('#inputPoint').val();
		var title = $('#inputTitle').val();
		var content = $('#inputContent').val();
		
		if (point < 0 || point > 100 || point == "") {
			alert("0에서 100 밥알을 입력해 주세요.");
			$('#inputPoint').focus();
			return;
		}
		
		if (title == "" || title == null) {
			alert("제목을 입력해 주세요.");
			$('#inputTitle').focus();
			return;
		}
		else if (title.length < 5) {
			alert("다섯 글자 이상의 제목을 입력해 주세요.");
			return;
		}
		
		if (content == "" || content == null) {
			alert("내용을 입력해 주세요.");
			$('#inputcontent').focus();
			return;
		}
		else if (content.length < 20) {
			alert("스무 글자 이상의 내용을 입력해 주세요.");
			return;
		}
		
		$('#requestModifyForm').submit();
	}
</script>
<style type="text/css">
input[type=file] {
	padding: 10px;
	background: #2d2d2d;
}

input {
	display: none;
}

.sidebar-module {
	margin-top: 10%;
	text-align: center;
}

textarea 
{ 
	resize: none;
}

</style>
</head>
<body>
	<c:import url="../00_main/Menu.jsp"></c:import>

	<div class="container" style="width: 1200px;">

		<div id="contents_area" class="col-xs-9">
			<h2 style="text-align: center;">레시피 요청 등록</h2>
			<hr>
			<div class="blank_bottom"></div>

			<form name="requestModifyForm" id="requestModifyForm" method="get"
				action="recipeModify.action" style="margin-top: 10px;">

				<div class="cs_write">
					<h4>밥알 냠냠 개수</h4>
					<input type="number" class="form-control" id="inputPoint" name="inputPoint" placeholder="0 ~ 100"
						style="margin-bottom: 30px; width: 200px;" value="${recipeContent.rr_point }">
					<h4>요청 레시피 제목</h4>
					<input type="text" class="form-control" id="inputTitle" name="inputTitle" placeholder="제목"
						style="margin-bottom: 30px;" value="${recipeContent.rr_title }">
					<h4>요청 레시피 내용</h4>
					<textarea name="inputContent" class="form-control fixed" id="inputContent"
						placeholder="내용" style="height: 300px;">${recipeContent.rr_content }</textarea>
						
					<hr>

					<div class="form-group">
						<h4>첨부이미지</h4>
						<label for="ccphoto1"><img id="blah1"
							src="images/AD/photo1.PNG" alt="your image"
							style="height: 400px;"> </label> <input type='file'
							onchange="readURL1(this);" id="ccphoto1" style="display: none;" />
						<hr>
					</div>
					
					<input type="hidden" id="rr_id" name="rr_id" value="${recipeContent.rr_id }">

					<div class="blank_bottom"></div>
					<div class="btn-group-lg col-lg-12" role="group" align="center"
						style="margin-top: 30px;">
						<button type="button" class="btn-lg" onclick="requestModify();"
							style="color: black; background-color: white; border: 1px solid #e9e9e9">수정하기</button>
						<button type="button" class="btn-lg"
							style="color: white; background-color: #ff9b19; border: 1px solid #ff9b19;"
							onclick="location.href='recipeRequest.action'">목록으로</button>
					</div>
				</div>
				<!-- /cs_write -->
				
			</form>

		</div>
		<!-- /contents_area -->
		<div id="right_area" class="col-xs-3 blog-sidebar">
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

	<!-- /container -->

	<!-- Site footer -->
	<footer class="footer">
		<c:import url="../00_main/Copyright.jsp"></c:import>
	</footer>
</body>
</html>
