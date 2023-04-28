<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>


<h3>글작성 페이지</h3>
<a href="${pageContext.request.contextPath }/board/list.do">글목록으로 이동</a><br/>
<a href="${pageContext.request.contextPath }/like_board.do?id=${sessionScope.loginId}&num=${vo.num}">좋아요 누르기</a><td>${count }</td>
<%-- <form action="${pageContext.request.contextPath }/board/add" method="post"> --%>
<table border="1">
<tr><th>로그인 ID</th><td><input type="text" name="id" value="${vo.id }" readonly ></td></tr>
<tr><th>제목</th><td><input type="text" name="title" value="${vo.title }" readonly></td></tr>

<tr><th>글내용</th><td><textarea rows="20" cols="30" name="content" value="${vo.content }" readonly></textarea></td></tr>
<tr><th>작성</th><td><input type="submit" name="저장" value="저장"></td></tr>


</table>
</body>
</html>