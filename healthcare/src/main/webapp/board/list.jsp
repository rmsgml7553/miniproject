<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    <!-- �±� ���̺귯�� �������̴�. �ݺ��� ����ϴµ� -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<body>
<h3>�۸��</h3>
<a href="${pageContext.request.contextPath }/member/logout">�α׾ƿ�</a>
<a href="${pageContext.request.contextPath}/board/add">���ۼ� �������� �̵��մϴ�.</a></<br/>

<table border="1">
<tr><th>num</th><th>id</th><th>title</th><th>content</th><th>cnt</th><th>path</th><th>w_date</th></tr>

<c:forEach var="vo" items="${list }"> <!-- ������ ����� list�� �����ͼ� �ϳ��� ������ ����Ѵ�. -->
<tr>
<td>${vo.num }</td><td>${vo.id }</td><td><a href="${pageContext.request.contextPath }/board/detail?num=${vo.num}">${vo.title }</a></td>
<td>${vo.content }</td><td>${vo.cnt }</td><td>${vo.path }</td><td>${vo.w_date }</td> 
</tr>
</c:forEach>

</table>
</body>
</html>