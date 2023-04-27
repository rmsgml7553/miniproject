<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="login-wrapper">
<h2>login</h2>
<form method="post" action="${pageContext.request.contextPath }/member/login.do" method="post">
	<fieldset>
		<label>아이디:<input type="text" name="id" placeholder="id"></label><br/>
		<label>비밀번호:<input type="password" name="pwd" placeholder="Password"></label>
		<input type="submit" value="로그인"> 
	</fieldset>
</form>
</div>
</body>
</html>