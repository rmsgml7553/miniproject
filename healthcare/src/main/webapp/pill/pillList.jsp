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
	<form action="${pageContext.request.contextPath }/pill/pillList/load.do">
		<input type="text" name="entpName" placeholder="업체명"> <input
			type="text" name="itemName" placeholder="제품명"> <br> <span
			style="color: red">입력이 없을 시 모든 제품을 표시합니다. 최대 100개의 제품이 표시됩니다.</span> <br> <input
			type="submit" value="검색 하기">
	</form>
	<table border="1">
		<tr>
			<th>업체명</th>
			<th>제품명</th>
		</tr>
		<c:forEach var="vo" items="${list }">
			<tr>
				<td><a
					href="${pageContext.request.contextPath }/pill/pillDetail/load.do?itemSeq=${vo.itemSeq}">${vo.entpName }</a></td>
				<td>${vo.itemName }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>