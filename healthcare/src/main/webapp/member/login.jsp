<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function a(){
		
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let tags = document.getElementsByTagName("input");
			let res = document.getElementById("res");
			let obj = xhttp.responseText;
			let arr = JSON.parse(obj);
			if(arr.flag == "로그인 완료"){
			window.location.href="${pageContext.request.contextPath}/index.jsp";
			} else {
			res.innerHTML = arr.flag;
			}
			
		}
		let param = "?id=" + f.id.value+"&pwd="+f.pwd.value;
		xhttp.open("get", "${pageContext.request.contextPath}/member/login.do"+param);
		xhttp.send();
		
	}
</script>
</head>
<body>
<div class="login-wrapper">
<h2>login</h2>
<form method="post" action="${pageContext.request.contextPath }/member/login.do" name="f">
	<fieldset>
		<label>아이디:<input type="text" name="id" placeholder="id"></label><br/>
		<label>비밀번호:<input type="password" name="pwd" placeholder="Password"></label>
		<input type="button" id="button" onclick="a()" value="로그인"> 
	</fieldset>
</form>
<div id="res"></div>
</div>
</body>
</html>