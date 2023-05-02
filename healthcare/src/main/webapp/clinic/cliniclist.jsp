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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
	
</script>
</head>
<body>
	<div class = "container">
		<h2>병원 리스트</h2>
		<div class = "table-responsive">
			<table class="table table-hover">		
				<thead>
					<tr>					
						<th>이름</th>
						<th>주소</th>
						<th>전화번호</th>	
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list}" varStatus="status">
						<tr>				
							<td><a
								href="${pageContext.request.contextPath }/clinic/detail.do?code=${vo.code }">${vo.name }</a></td>							
							<td>${vo.address }</td>
							<td>${vo.phone }</td>
						</tr>
					</c:forEach>
				</tbody>		
			</table>
		</div>
	</div>

</body>
</html>