<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>


function myFunction(){
	let x = document.getElementById("fname").value;
	console.log(x);
	let idMsg = document.getElementById("idMsg");
	let idRegExp =  /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
				let res = idRegExp.test(x);
	
	
	idMsg.style.display = "";
	let html = "";
	
	idMsg.innerHTML = " ";
	
	
	if(x != null ){
	
			const xhttp = new XMLHttpRequest();
			
			xhttp.onload = function(){
				let obj = xhttp.responseText;
				let arr = JSON.parse(obj);
				console.log(arr);
				if(arr.flag =="true"){
					html += "사용가능한 아이디";

				} else {
					html += "중복된 아이디";
				}
		    idMsg.innerHTML = html;	
			}
			let param = "id="+x	;
			xhttp.open("get", "${pageContext.request.contextPath}/member/ex.do?"+param);
			xhttp.send();
		}	
		
	
}
</script>

</head>
<body>
<form action="${pageContext.request.contextPath }/member/ex.do" name="joinform" method="post">
<label for="id">아이디</label><br/>
<input type="text" id="fname" name="fname" onblur="myFunction()" placeholder="4~12자의 영문 대소문자와 숫자로만 입력"><br/>
<span class="error_next_box" id="idMsg"  aria-live="assertive">필수정보 입니다.</span>
</form>
</body>
</html>