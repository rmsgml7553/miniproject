<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form
		action="${pageContext.request.contextPath }/pharmarcy/pharmarcyList/load.do">
		<input type="text" name="search" placeholder="약국 주소 및 이름 검색">
		<input type="submit" value="검색">
	</form>
	<table border="1">
		<tr>
			<th>이름</th>
			<th>주소</th>
			<th>번호</th>
		</tr>
		<c:forEach var="vo" items="${list }">
			<tr>
				<td><a
					href="${pageContext.request.contextPath }/pharmarcy/pharmarcyDetail/load.do?hpid=${vo.hpid}">${vo.dutyName }</a></td>
				<td>${vo.dutyAddr }</td>
				<td>${vo.dutyTel }</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>