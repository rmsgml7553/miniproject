<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
window.onload=function(){
	if('${pageContext.request.method}'=='GET'){
		ff.id.value = opener.document.f.id.value;
	} else {
		let html = "";
		if('${flag}' == 'true'){
			alert('��밡���� ���̵��Դϴ�.');
			let val = '${id}';
			ff.id.value=val;
			html += '<input type="button" value="���̵���" onclick="a(\''+val+'\')">';
		} else {
			alert('�ߺ��� ���̵� �Դϴ�.');
		}
		let div =document.getElementById("res");
		div.innerHTML = html;
	}
}
</script>
</head>
<body>
<div>id�ߺ�üũ</div>
<form action="${pageContext.request.contextPath }/member/idcheck.do" method="post" name="ff">
����� ���̵�: <br/><input type="text" name="id"><input type="submit" value="�ߺ�üũ">
<div id="res"></div> 
</form>
</body>
</html>