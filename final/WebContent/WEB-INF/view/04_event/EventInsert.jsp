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

<!-- 합쳐지고 최소화된 최신 CSS -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<!-- <script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<script>
	$(document).ready(function() {
		
		 var options=
		 {
		  closeText: '닫기',
			  prevText: '이전',
			  nextText: '다음',
			  currentText: '오늘',
			  monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			  monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
			  dayNames: ['일','월','화','수','목','금','토'],
			  dayNamesShort: ['일','월','화','수','목','금','토'],
			  dayNamesMin: ['일','월','화','수','목','금','토'],
			  weekHeader: 'Wk',
			  dateFormat: 'yy-mm-dd',
			  firstDay: 0,
			  isRTL: false,
			  showMonthAfterYear: true,
			  yearSuffix: ''
		  };

		$("#datepicker1").datepicker(options);
		$("#datepicker2").datepicker(options);
	});
</script>

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
	
	function readURL2(input) {
		if (input.files && input.files[0])
		{
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah2').attr('src', e.target.result);
			};

			reader.readAsDataURL(input.files[0]);
		}
	}
	
	function readURL3(input) {
		if (input.files && input.files[0])
		{
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah3').attr('src', e.target.result);
			};

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
<style type="text/css">
.image-upload>input 
{
	display: none;
}

textarea
{
	 resize : none; 
}
</style>
</head>
<body>

	<c:import url="../00_main/Menu.jsp"></c:import>

	<div class="container" style="width: 800px; padding: 30px;">

		<form>
			<h2 style="text-align: center;">이벤트 등록</h2>
			<hr>
			<div class="form-group col-md-12">
				<label for="exampleInputName1">상호명</label> <input type="text"
					class="form-control" id="exampleInputEmail1" value="${bs }" readonly="readonly">
			</div>
			<div class="form-group col-md-6">
				<label for="exampleInputStartDate1">이벤트 시작 날짜</label> 
				<input type="text" class="form-control" id="datepicker1">
			</div>
			<div class="form-group col-md-6">
				<label for="exampleInputEndDate1">이벤트 끝 날짜</label> 
				<input type="text" class="form-control" id="datepicker2">
			</div>
			<div class="form-group col-md-12">
				<label for="exampleInputContent1">이벤트 설명</label>
				<textarea style="height: 200px;" class="form-control"
					id="exampleInputEmail1" placeholder="(주)최명호사업"></textarea>
			</div>
			<div class="form-group col-md-12">
				<label for="exampleInputURL1">주소</label> <input type="text"
					class="form-control" id="exampleInputURL1"
					placeholder="URL을 입력하세요.">
			</div>
			<div class="form-group col-md-12">
				<label for="exampleInputFile">배너 이미지</label>
			</div>
			
			
			
			<div class="col-sm-3">
				<div class="form-group">
					<label for="tiphoto1"> 
						<img id="blah1" src="images/event/photo1.PNG" style="width: 155px; height: 155px;">
					</label> 
						<input type='file' onchange="readURL1(this);" name="tiphoto1" id="tiphoto1" style="display: none;" />
				</div>
			</div>
			
			<div class="col-sm-3">
				<div class="form-group">
					<label for="tiphoto2"> 
						<img id="blah2" src="images/event/photo1.PNG" style="width: 155px; height: 155px;">
					</label> 
						<input type='file' onchange="readURL2(this);" name="tiphoto2" id="tiphoto2" style="display: none;" />
				</div>
			</div>
			
			<div class="col-sm-3">
				<div class="form-group">
					<label for="tiphoto3"> 
						<img id="blah3" src="images/event/photo1.PNG" style="width: 155px; height: 155px;">
					</label> 
						<input type='file' onchange="readURL3(this);" name="tiphoto3" id="tiphoto3" style="display: none;" />
				</div>
			</div>
			
			
			<div class="btn-group-lg col-lg-12" role="group" align="center"
				style="padding-top: 30px;">
				<button type="button" class="btn btn-default"
					onclick="history.back()">취소하기</button>
				<button type="button" class="btn btn-lg btn-default"
					style="color: white; background-color: #ff9b19;"
					onclick="location.href='EventViewList(con).jsp'">등록하기</button>
			</div>
		</form>

	</div>
	<!-- /container -->

	<!-- Site footer -->
	<footer class="footer">
		<c:import url="../00_main/Copyright.jsp"></c:import>
	</footer>
</body>
</html>
