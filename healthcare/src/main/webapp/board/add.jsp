<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
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
<body>

<div class="container">
<h3>글작성</h3>
<a href="${pageContext.request.contextPath }/board/list.do">글목록으로 이동</a><br/>
<form action="${pageContext.request.contextPath }/board/add.do" method="post">
<table border="1">

	<div class="form-group">
		<label for="comment">작성자:</label>
		<input type="text" class="form-control" id="comment" name="id" value="${sessionScope.loginId }" readonly>
	</div>
	<div class="form-group">
		<label for="comment">제목:</label>
		<input type="text" class="form-control" id="comment" name="title" >
	</div>
	<div class="form-group">
      <label for="comment">글내용:</label>
      <textarea class="form-control" rows="10" id="comment" name="content"></textarea>
    </div>
    <button type="submit" class="btn btn-primary">작성</button>
<%-- <tr><th>로그인 ID</th><td><input type="text" name="id" value="${sessionScope.loginId }" readonly></td></tr> --%>
<!-- <tr><th>제목</th><td><input type="text" name="title"></td></tr> -->
<!-- <tr><th>글내용</th><td><textarea rows="20" cols="30" name="content"></textarea></td></tr> -->
<!-- <tr><th>작성</th><td><input type="submit" name="저장" value="저장"></td></tr> -->

</table>
</form>
</div>


</body>
</html>