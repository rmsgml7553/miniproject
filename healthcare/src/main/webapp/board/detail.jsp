<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>


<h3>���ۼ� ������</h3>
<a href="${pageContext.request.contextPath }/board/list.do">�۸������ �̵�</a><br/>
<a href="${pageContext.request.contextPath }/like_board.do?id=${sessionScope.loginId}&num=${vo.num}">���ƿ� ������</a><td>${count }</td>
<%-- <form action="${pageContext.request.contextPath }/board/add" method="post"> --%>
<table border="1">
<tr><th>�α��� ID</th><td><input type="text" name="id" value="${vo.id }" readonly ></td></tr>
<tr><th>����</th><td><input type="text" name="title" value="${vo.title }" readonly></td></tr>

<tr><th>�۳���</th><td><textarea rows="20" cols="30" name="content" value="${vo.content }" readonly></textarea></td></tr>
<tr><th>�ۼ�</th><td><input type="submit" name="����" value="����"></td></tr>


</table>
</body>
</html>