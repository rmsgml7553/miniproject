<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
병원 즐겨찾기 목록
<c:forEach var="vo" items="${clinicList }">
	<ul class="clinicLikeList">
		<li><a href="${pageContext.request.contextPath }/clinic/detail.do?code=${vo.code }">${vo.c_name }</a></li>
	</ul>
</c:forEach>
약국 즐겨찾기 목록
<c:forEach var="vo" items="${pharmarcyList }">
	<ul class="pharmarcyLikeList">
		<li><a href="${pageContext.request.contextPath }/pharmarcy/pharmarcyDetail/load.do?hpid=${vo.code}">${vo.name }</a></li>
	</ul>
</c:forEach>
약 즐겨찾기 목록
<c:forEach var="vo" items="${pillList }">
	<ul class="pillLikeList">
		<li><a href="${pageContext.request.contextPath }/pill/pillDetail/load.do?itemSeq=${vo.code}">${vo.name }</a></li>
	</ul>
</c:forEach>
</body>
</html>