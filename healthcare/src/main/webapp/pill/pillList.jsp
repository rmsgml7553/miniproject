<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class = "container">
		<h2>약 리스트</h2>
		<div class ="table-responsive">
			<table class = "table table-hover">
				<thead>
					<tr>
						<th>업체명</th>
						<th>제품명</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list }">
						<tr>
							<td><a
								href="${pageContext.request.contextPath }/pill/pillDetail/load.do?itemSeq=${vo.itemSeq}">${vo.entpName }</a></td>
							<td>${vo.itemName }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>