<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">



</style>


</head>
<body>
<h3>${m.id }의 정보</h3>
<div>${m.name }</div><br/>
<div>${m.mCode }</div><br/>
<div>${m.code }</div><br/>
<div>${m.phone }</div><br/>
<div>${m.gender }</div><br/>
<div>${m.birth }</div><br/>
<div>${m.address }</div><br/>

<input type="button" value="edit"  onclick="javascript:location.href='${pageContext.request.contextPath }/member/edit.do?id=${m.id }'">
<a href = "${pageContext.request.contextPath }/index.jsp">home</a>
</body>
</html>