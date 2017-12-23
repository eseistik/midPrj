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
<title>Insert title here</title>
<style type="text/css">
.ad-image .img-responsive {
	margin-bottom: 10px;
	width: 100%;
}
</style>
</head>
<body>

	<div align="center" class="ad-image" style="margin-top: 30px;">
		<img src="<%=cp %>/images/main/ad1.jpg" class="img-responsive center-block">
		<img src="<%=cp %>/images/main/ad2.jpg" class="img-responsive center-block">
		<img src="<%=cp %>/images/main/ad3.JPG" class="img-responsive center-block">
	</div>

</body>
</html>