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
<form action="${pageContext.request.contextPath }/board/add.do" method="post">
<table border="1">



<tr><th>�α��� ID</th><td><input type="text" name="id" value="${sessionScope.loginId }" ></td></tr>
<tr><th>����</th><td><input type="text" name="title"></td></tr>
<tr><th>path</th><td><input type="file" name="path"></td></tr>

<tr><th>�۳���</th><td><textarea rows="20" cols="30" name="content"></textarea></td></tr>
<tr><th>�ۼ�</th><td><input type="submit" name="����" value="����"></td></tr>


</table>
</form>

<!-- ������ ������ vo�� ����Ǿ� �Ѵ�. �������� num���� ���� �����ͼ� �������� ó���Ѵ�.-->

<%-- <a href="${pageContext.request.contextPath}/diary/detail?num=${vo.num }">${vo.w_date }</a> --%>



</body>
</html>