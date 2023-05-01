<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   <!-- �±� ���̺귯�� �������̴�. �ݺ��� ����ϴµ� -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


</head>
${sessionScope.loginId }
<body>

<div class="container">
<h3>�����Խ���</h3>

<c:if test = "${not empty sessionScope.loginId }">
<a href="${pageContext.request.contextPath}/board/add.do?id=${sessionScope.loginId}">���ۼ�</a></<br/> <!-- ����ó�� �̵��Ѵ�. -->
</c:if>
	<table  class="table" >
 		<thead>
			<tr><th>��ȣ</th><th>����</th><th>�ۼ���</th><th>�ۼ���</th><th>��ȸ��</th></tr>
 		</thead>

		<tbody>
<c:forEach var="vo" items="${list }"> <!-- ������ ����� list�� �����ͼ� �ϳ��� ������ ����Ѵ�. -->
<tr>
<td>${vo.num }</td><td><a href="${pageContext.request.contextPath }/board/detail.do?num=${vo.num}">${vo.title }</a></td><td>${vo.id }</td>
<td>${vo.w_date }</td><td>${vo.cnt }</td>
</tr>
</c:forEach>
  </tbody>
</table>
</body>
</html>







