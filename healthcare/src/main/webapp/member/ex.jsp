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
���̵� �Է��ϼ���<input type="text" name="fname" id="fname" onblur="myFunction()">
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
				alert("�̹� ������� ���̵��Դϴ�.");
			} else {
				if(event == "first"){
					alert("���̵� ��밡��");
				} 
				idFlag = true;
			}
		}, 
		error: function () {
			alert("���� ��û ����");
		}
	})
	return true;
}
</script>
</body>
</html>