<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
// function a(){
// 	const xhttp = new XMLHttpRequest();
// 	xhttp.onload = function(){
// 		let val = xhttp.responstText;
// 		let arr = JSON.parse(val);
		x
// 	}
// 	let param = "pwdcheck="+ f.pwdcheck.value;
// 	xhttp.open("GET", "${pageContext.request.contextPath}/member/getpwd.do?"+param);
// 	xhttp.send();
	

	
// }
</script>
</head>
<body>
<form action="${pageContext.request.contextPath }/member/getpwd.do" method="post" name="f">
<label for="pwdcheck">현재 비밀번호</label>
<input type="text" value="" name="pwdcheck">
<input type="submit" value="수정" >
</form>
</body>
</html>