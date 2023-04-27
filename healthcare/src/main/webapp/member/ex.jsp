<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
function onfocus_event(){
	alert("onfocus");
}
</script>

</head>
<body>
아이디를 입력하세요<input type="text" name="fname" id="fname" onblur="myFunction()">
<div id="box"></div>
<script>
function myFunction(){
	let id = document.getElementById("fname").value;
	let box = document.getElementById("box");
	box.innerHTML = x.value;
	
	let idFlag = false;
	
	$.ajax({
		url: "${pageContext.request.contexPath}/member/Ex.do",
		type: "post",
		data: {
			id: id
		},
		dataType: 'json',
		success: function (result) {
			if(result == 0){
				alert("이미 사용중인 아이디입니다.");
			} else {
				if(event == "first"){
					alert("아이디 사용가능");
				} 
				idFlag = true;
			}
		}, 
		error: function () {
			alert("서버 요청 실패");
		}
	})
	return true;
}
</script>
</body>
</html>