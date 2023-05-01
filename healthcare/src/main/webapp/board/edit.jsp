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
<!-- id, 제목, 글내용 가져가야함. -->
<h3>수정페이지</h3>
${sessionScope.loginId }
<form action="${pageContext.request.contextPath }/board/edit.do?num=${num}" method="POST">
<table border="1">
<tr><th>로그인 ID</th><td><input type="text" name="id" value="${id }"  ></td></tr>
<tr><th>제목</th><td><input type="text" name="title" value="${title }" ></td></tr>

<tr><th>글내용</th><td><textarea rows="20" cols="30" name="content">${content }</textarea></td></tr>
<tr><th>작성</th><td><input type="submit" name="완료" value="완료"><input type="submit" name="취소" value="취소"></td></tr>
</table>
</form>

<!-- 완료 누르면 디테일.jsp로 이동 취소 누르면 detail.jsp로 이동 -->

</body>
</html>