<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    <!-- 태그 라이브러리 지시자이다. 반복문 사용하는듯 -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>

<body>
<h3>글목록</h3>
<a href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a>
<a href="${pageContext.request.contextPath}/board/add.do">글작성 페이지로 이동합니다.</a></<br/> <!-- 디스패처로 이동한다. -->

<table border="1">
<tr><th>num</th><th>id</th><th>title</th><th>content</th><th>cnt</th><th>path</th><th>w_date</th></tr>

<c:forEach var="vo" items="${list }"> <!-- 서버에 적어둔 list를 가져와서 하나씩 꺼내서 사용한다. -->
<tr>
<td>${vo.num }</td><td>${vo.id }</td><td><a href="${pageContext.request.contextPath }/board/detail.do?num=${vo.num}">${vo.title }</a></td>
<td>${vo.content }</td><td>${vo.cnt }</td><td>${vo.path }</td><td>${vo.w_date }</td> 
</tr>
</c:forEach>

</table>
</body>
</html>







