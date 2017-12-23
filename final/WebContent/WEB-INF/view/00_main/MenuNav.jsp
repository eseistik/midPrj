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

<link rel="stylesheet" href="<%=cp %>/css/main/navigation.css">
</head>
<body>
		
	<div class="nav-background" style="position: relative;">
	<a href="main.action"><img alt="" src="<%=cp %>/images/main/logo.png" style="width: 200px; float: left;" ></a>		
		<nav role="navigation" class="nav" style="margin-left: 600px; margin-right: 500px;">
			
			<ul class="nav-items">
				<li class="nav-item dropdown">
				<a href="recipe.action"
					class="nav-link"><span>레시피</span></a>
					<nav class="submenu">
						<ul class="submenu-items">
							<li class="submenu-item"><a href="recipe.action"
								class="submenu-link">레시피</a></li>
							<li class="submenu-item"><a href="recipeRequest.action"
								class="submenu-link">레시피 요청</a></li>
						</ul>
					</nav></li>
				<li class="nav-item"><a href="cookingclass.action"
					class="nav-link"><span>쿠킹클래스</span></a></li>
				<li class="nav-item"><a href="talkviewlist.action"
					class="nav-link"><span>토크</span></a></li>
				<li class="nav-item"><a href="event.action"
					class="nav-link"><span>이벤트</span></a></li>
				<li class="nav-item"><a href="brand.action"
					class="nav-link"><span>브랜드</span></a></li>
				<li class="nav-item dropdown"><a href="customermain.action"
               class="nav-link"><span>고객센터</span></a>
               <nav class="submenu">
                  <ul class="submenu-items">
                     <li class="submenu-item"><a href="customeragreelist.action" class="submenu-link">이용약관</a></li>
                     <li class="submenu-item"><a href="customertablelist.action"
                        class="submenu-link">1:1 문의</a></li>
                  </ul>
               </nav></li>
			</ul>
		</nav>
	</div>
	<script src="<%=cp %>/js/main/navigation.js"></script>

</body>
</html>