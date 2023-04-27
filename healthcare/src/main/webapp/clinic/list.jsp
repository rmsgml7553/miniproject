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
</head>
<body>
<h3>병원 리스트</h3>
<table border="1">
<tr>
<td>번호1</td><td>관리번호5</td><td>운영상태11</td><td>전화번호16</td><td>도로명주소20</td><td>사업장명22</td><td>업태구분명26</td>
<td>좌표정보x27</td><td>좌표정보y28</td><td>진료과목내용35</td>
</tr>
<c:forEach var = "vo" items="${list }" >
<tr>
<td>${vo.num }</td>
<td>${vo.code }</td>
<td>${vo.onoff }</td>
<td>${vo.phone }</td>
<td>${vo.address }</td>
<td>${vo.name }</td>
<td>${vo.clinic }</td>
<td>${vo.x }</td>
<td>${vo.y }</td>
<td>
<c:forEach var = "item" items="${vo.subject }">
${item }
</c:forEach>

</td>

</tr>
</c:forEach>
</table>
</body>
</html>