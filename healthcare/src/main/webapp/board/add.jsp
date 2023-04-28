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
<form action="${pageContext.request.contextPath }/board/add.do" method="post">
<table border="1">



<tr><th>로그인 ID</th><td><input type="text" name="id" value="${sessionScope.loginId }" ></td></tr>
<tr><th>제목</th><td><input type="text" name="title"></td></tr>
<tr><th>path</th><td><input type="file" name="path"></td></tr>

<tr><th>글내용</th><td><textarea rows="20" cols="30" name="content"></textarea></td></tr>
<tr><th>작성</th><td><input type="submit" name="저장" value="저장"></td></tr>


</table>
</form>

<!-- 저장을 누르면 vo에 저장되야 한다. 서블릿에서 num같은 값을 가져와서 서블릿에서 처리한다.-->

<%-- <a href="${pageContext.request.contextPath}/diary/detail?num=${vo.num }">${vo.w_date }</a> --%>



</body>
</html>