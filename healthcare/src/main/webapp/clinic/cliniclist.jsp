<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%
    request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=UTF-8");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script type = "text/javascript"> 



</script>
</head>
<body>


<form action = "${pageContext.request.contextPath }/clinic/search.do" method = "post">

<input type = "text" name = "search" id = "search" placeholder ="병원검색">
<input type="submit" value = "검색" >
</form>
<br/><br/><br/>

<c:if test = "${not empty list }">
 <table border = "1" id = "table"> <!--style = "display:none" -->
<tr><th>순번</th><th>병원 이름</th><th>전화번호</th><th>주소</th><th>영업 상태</th><th>업태 구분</th><th>진료 과목</th></tr>

<c:forEach var = "vo" items="${list}" varStatus="status">
<tr >
<td>${status.count}</td>

<td><a href = "${pageContext.request.contextPath }/clinic/detail.do?code=${vo.code }">${vo.name }</a></td>
<td>${vo.phone }</td>
<td>${vo.address }</td>
<td>${vo.onoff }</td>
<td>${vo.clinic }</td>

<td>
<c:forEach var = "item" items="${vo.subject }">
${item }
</c:forEach>
</td>
</tr>
</c:forEach>
</table>
</c:if>

</body>
</html>