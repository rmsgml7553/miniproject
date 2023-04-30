<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <style>
  
  </style>
  
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
		let param = "?id=" + f.uname.value+"&pwd="+f.pwd.value;
		xhttp.open("get", "${pageContext.request.contextPath}/member/login.do"+param);
		xhttp.send();
		
	}
</script>
</head>
<body>
<div class="login-wrapper">
<div class="container mt-3">
  <form action="${pageContext.request.contextPath }/member/login.do" name="f" class="was-validated">
    <div class="mb-3 mt-3">
      <label for="uname" class="form-label"><b>아이디</b></label>
      <input type="text" class="form-control" id="uname" placeholder="ID" name="uname" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="mb-3">
      <label for="pwd" class="form-label"><b>비밀번호</b></label>
      <input type="password" class="form-control" id="pwd" placeholder="Password" name="pswd" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div style="text-align: center;">
  		<button type="submit" class="btn btn-primary"  onclick="a()" style="background-color: RGB(58, 162, 201); border:0px; ">로그인</button>
  	</div>
  </form>
  
</div>

<div id="res"></div> 
</div>
</body>
</html>