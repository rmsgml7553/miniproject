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
function id_check(){
	let win = open('idcheck.jsp', 'win', 'width=70,hegiht=100,top=300,lefth=300');
	
}



function joinform_check(){
	let id = document.getElementByName("id").value;
	let pwd = document.getElementByName("pwd").value;
	let pwd2 = document.getElementByName("pwd2").value;
	let name = document.getElementByName("name").value;
	let phone = document.getElementByName("phone").value;
	let sample3_address = document.getElementByName("sample3_address").value;
	let sample3_detailAddress = document.getElementByName("sample3_detailAddress").value;
	let mCode = document.getElementByName("mCode").value;
	let code = document.getElementByName("code").value;
	let gender = document.getElementByName("gender").value;
	let year = document.getElementByName("year").value;
	let month = document.getElementByName("month").value;
	let day = document.getElementByName("day").value;
	
	let birth = year+month+day;
	let address = sample3_address + sample3_detailAddress;
	alert(address);
	if(id == ""){
		alert("아이디를 입력하세요.");
		id.focus();
		return false;
	}
	if(pwd == "" || pwd2 == ""){
		alert("비밀번호를 입력하세요.");
		pwd.focus();
		return false;
	}
	
	if(pwd != pwd2 ){
		alert("비밀번호가 일치하지 않습니다.");
		pwd.focus();
		return false;
	}	
	
	if(name == ""){
		alert("이름을 입력하세요.");
		name.focus();
		return false;
	}
	
	if(year == ""){
		alert("년도를 입력하세요.");
		year.focus();
		return false;
	} 
	
	else if(!(year >= 1900 && year <= 2050)){
		alert("년도를 정확하게 입력해주세요.");
		year.focuse();
		return false;
	}
}
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
