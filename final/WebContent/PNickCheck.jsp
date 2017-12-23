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
{
  box-sizing: border-box;
}

#myInput {
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}

#myTable {
  border-collapse: collapse;
  width: 100%;
  border: 1px solid #ddd;
  font-size: 18px;
}

#myTable th, #myTable td {
  text-align: left;
  padding: 12px;
}

#myTable tr {
  border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
  background-color: #f1f1f1;
}

</style>

<script type="text/javascript">
       function setParentText(name){
            window.opener.document.getElementById("inputNickname").value = name;
            window.close();
       }
</script>


</head>
<body>

<input type="text" id="myInput" onkeyup="myFunction()" placeholder="상호명을 검색해주세요." title="상호명">

<table id="myTable">
  <tr class="header">
    <th style="width:50%;">상호명</th>
    <th style="width:50%;" colspan="2">위치</th>
  </tr>
  <c:forEach var="bs" items="${result }" >
	  <tr>
	    <td><input type="text" readonly="readonly" style="background-color: #0000; border: none; font-size: 18px;" value="${bs.bs_name }"></td>
	    <td>${bs.bs_point }</td>
	    <td><input type="button" value="전달하기" onclick="setParentText('${bs.bs_name }')"></td>
	  </tr>
  </c:forEach>

</table>
<input type="button" value="창닫기" onclick="window.close()">
<script>
function myFunction() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>



</body>
</html>