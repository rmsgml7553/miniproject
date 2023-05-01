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
				<!--style = "display:none" -->
				<thead>
					<tr>
						<th>순번</th>
						<th>병원 이름</th>
						<th>전화번호</th>
						<th>주소</th>
						<th>영업 상태</th>
						<th>업태 구분</th>
						<th>진료 과목</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list}" varStatus="status">
						<tr>
							<td>${status.count}</td>
			
							<td><a
								href="${pageContext.request.contextPath }/clinic/detail.do?code=${vo.code }">${vo.name }</a></td>
							<td>${vo.phone }</td>
							<td>${vo.address }</td>
							<td>${vo.onoff }</td>
							<td>${vo.clinic }</td>
							<td>
								<c:forEach var="item" items="${vo.subject }">
									${item }
								</c:forEach>
							</td>
						</tr>
					</c:forEach>
				</tbody>		
			</table>
		</div>
	</div>

</body>
</html>