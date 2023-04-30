<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		
// 	}
// 	let param = "pwdcheck="+ f.pwdcheck.value;
// 	xhttp.open("GET", "${pageContext.request.contextPath}/member/getpwd.do?"+param);
// 	xhttp.send();
	

	
// }

<%
String chk = request.getParameter("chk");


%>

</script>
</head>
<body>
${chk}
<form action="${pageContext.request.contextPath }/member/getpwd.do" method="post" name="f">
<input type="hidden" value="${chk }" name="chk">
<label for="pwdcheck">현재 비밀번호</label>
<input type="text" name="pwdcheck">
<input type="submit" value="수정">
</form>
</body>
</html>