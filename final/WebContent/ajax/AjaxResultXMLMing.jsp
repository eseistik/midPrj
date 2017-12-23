<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%
	// 위의 코드가 다소 부자연스럽게 보이는 이유는
	// <?xml ... ?> 의 XML 선언문 앞에는 어떤한 공백이나 주석도 있어서는 안되기 때문이다.
	
	// 데이터가 한 개 이상일 경우 XML 이나 JSON 과 같이
	// 구조화시킬 수 있는 데이터로 전달하는 것이 바람직하다
	// 우편번호 검색 결과는 당연히 다량의 데이터를 전송해야 하기 때문에
	// XML 로 반환하려고 한다.
	
	// AJAX 객체에게 데이터를 돌려줄 때
	// 브라우저가 이 데이터를 XML 로 인식해야 하기 때문에
	// MINE 타입을 XML 로 선언해야 한다.
	
	response.setContentType("text/xml");

%><?xml version="1.0" encoding="UTF-8"?>
<root>
	<c:forEach items="${resultList }" var="ming">
		<result>
			<id>${ming.mid_ing_id }</id>
			<name>${ming.mid_ing_name }</name>
		</result>
	</c:forEach>
</root>
