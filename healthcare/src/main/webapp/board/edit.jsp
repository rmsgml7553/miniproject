<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>


<%-- 
<!-- // int num = (int) request.getAttribute("num"); -->
<!-- // String id = (String) request.getAttribute("id"); -->
<!-- // String title = (String) request.getAttribute("title"); -->
<!-- // String content = (String) request.getAttribute("content"); -->
--%>


</head>
<body>
<!-- id, ����, �۳��� ����������. -->
<h3>����������</h3>
${sessionScope.loginId }
<form action="${pageContext.request.contextPath }/board/edit.do?num=${num}" method="POST">
<table border="1">
<tr><th>�α��� ID</th><td><input type="text" name="id" value="${id }"  ></td></tr>
<tr><th>����</th><td><input type="text" name="title" value="${title }" ></td></tr>

<tr><th>�۳���</th><td><textarea rows="20" cols="30" name="content">${content }</textarea></td></tr>
<tr><th>�ۼ�</th><td><input type="submit" name="�Ϸ�" value="�Ϸ�"><input type="submit" name="���" value="���"></td></tr>
</table>
</form>

<!-- �Ϸ� ������ ������.jsp�� �̵� ��� ������ detail.jsp�� �̵� -->

</body>
</html>