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
<link href="<%=cp%>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
.sidebar-module {
	margin-top: 10%;
	text-align: center;
}
</style>
<script type="text/javascript">

	function customerInsert() {

		// 유효성 검사
		if ($('#qna_title').val() == null || $('#qna_title').val() == "") {
			alert("제목을 입력해 주세요.");
			return;
		}
		if ($('#qna_content').val() == null || $('#qna_content').val() == "") {
			alert("내용을 입력해 주세요.");
			return;
		}
		
		// 비공개 선택 시 value = 2 
		if ($('#se_type_id').is(':checked')) {
			$('#se_type_id').val('2');
		}
		else {
			$('#se_type_id').val('1');
		}
		
		$('#qnaForm').attr("action", "customerinsert.action").submit();
	}
</script>
</head>
<body>
	<c:import url="../00_main/Menu.jsp"></c:import>

	<div class="container" style="width: 1200px;">
		<div id="contents_area" class="col-sm-8">
			<form id="qnaForm" name="qnaForm">
				<h3 style="text-align: center;">고객센터 1:1 문의 등록</h3>
				<hr>
				<div class="form-group col-md-12">
					<input type="hidden" id="u_id" name="u_id" value="<%=session.getAttribute("id")%>"> 
					<label for="qna_type_id">문의 종류</label> 
						<select class="form-control" id="qna_type_id" name="qna_type_id" style="height: 32px; width: 250px;">
							<c:forEach var="type" items="${typeList }">
								<option value="${type.qna_type_id }">${type.qna_type_val }</option>
							</c:forEach>
						</select>
				</div>
				<div class="form-group col-md-12">
					<label for="qna_title">제목</label>
					<input type="text" class="form-control" id="qna_title" name="qna_title" placeholder="문의 제목"/>
				</div>
				<div class="form-group col-md-12">
					<label for="qna_content">문의 내용</label>
					<textarea style="height: 200px;" class="form-control" id="qna_content" name="qna_content" placeholder="내용"></textarea>
				</div>
				<div class="form-group col-md-12">
					<label for="qna_url">URL 주소</label>
					<input type="text" class="form-control" id="qna_url" placeholder="URL을 입력하세요.">
				</div>
				<div class="form-group col-md-12">
					<input type='file' onchange="readURL1(this);"
						name="qna_file" id="qna_file" style="display: none;" />
				</div>

				<div class="checkbox col-md-12">
					<label> <input type="checkbox" id="se_type_id" name="se_type_id" >
					<span class="glyphicon glyphicon-lock" aria-hidden="true"></span> 비밀글
					</label>
				</div>
				<hr>
				<div class="btn-group-lg col-lg-12" role="group" align="center"
					style="padding-top: 30px;">
					<button type="button" class="btn"
						style="background-color: #fff; border: 1px solid #e9e9e9;"
						onclick="history.back()">취소하기</button>
					<button type="button" class="btn btn-lg"
						style="color: white; background-color: #ff9b19;"
						onclick="customerInsert();">등록하기</button>
				</div>
			</form>
		</div>

		<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
			<div class="sidebar-module sidebar-module-inset">
				<ul class="list-group">
					<li class="list-group-item"><a href="customeragreelist.action">이용약관</a></li>
					<li class="list-group-item"><a href="customertablelist.action">1:1
							문의</a></li>
				</ul>
			</div>
			<div class="sidebar-module sidebar-module-inset">
				<c:import url="../00_main/ADLine.jsp"></c:import>
			</div>
		</div>

	</div>
	<!-- /container -->

	<!-- Site footer -->
	<footer class="footer">
		<c:import url="../00_main/Copyright.jsp"></c:import>
	</footer>
</body>
</html>
