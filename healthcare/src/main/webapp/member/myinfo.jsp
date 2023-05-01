<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif;}
.w3-sidebar {
  z-index: 3;
  width: 250px;
  top: 43px;
  bottom: 0;
  height: inherit;
}
</style>

</head>
<body>



      <h3>${m.id }의정보</h3>
			<div>${m.name }</div>
			<br />
			<div>${m.mCode }</div>
			<br />
			<div>${m.code }</div>
			<br />
			<div>${m.phone }</div>
			<br />
			<div>${m.gender }</div>
			<br />
			<div>${m.birth }</div>
			<br />
			<div>${m.address }</div>
			<br /> 
			<a href='${pageContext.request.contextPath}/member/getpwd.do?chk=수정'>수정</a>
			<a href='${pageContext.request.contextPath}/member/getpwd.do?chk=삭제'>탈퇴</a>
			<a href="${pageContext.request.contextPath }/index.jsp">home</a>






	
</body>
</html>