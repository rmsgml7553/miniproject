<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
<script>


</script>
<style>
input, select{
height: 36px;
margin: 2px;
border: 1px solid #e2e2e2;
}
input:focus{
border: none;
outline: 1px solid #32E8E2;
}
body {
color:red;
font-size: 10px;
}
label{
color:black;
font-size:20px;
}

</style>

</head>
<body>


<div>
<input type="button" value="일반" onclick="javascript:location.href='${pageContext.request.contextPath}/member/joinN.do'">
<input type="button" value="관계자" onclick="javascript:location.href='${pageContext.request.contextPath}/member/joinR.do'">
</div>
<c:if test="${not empty view}">
<jsp:include page="${view}"/>
</c:if>
