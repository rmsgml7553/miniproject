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
			alert('사용가능한 아이디입니다.');
			let val = '${id}';
			ff.id.value=val;
			html += '<input type="button" value="아이디사용" onclick="a(\''+val+'\')">';
		} else {
			alert('중복된 아이디 입니다.');
		}
		let div =document.getElementById("res");
		div.innerHTML = html;
	}
}
</script>
</head>
<body>
<div>id중복체크</div>
<form action="${pageContext.request.contextPath }/member/idcheck.do" method="post" name="ff">
사용할 아이디: <br/><input type="text" name="id"><input type="submit" value="중복체크">
<div id="res"></div> 
</form>
</body>
</html>