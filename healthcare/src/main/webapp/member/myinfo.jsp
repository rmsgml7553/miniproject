<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
.material-symbols-outlined {
  font-variation-settings:
  'FILL' 1,
  'wght' 400,
  'GRAD' 0,
  'opsz' 48;
  margin-left: 5px;
 	
}
body{
	height:1000px;
}
.w3-card-4 {
	border-radius: 5px;
	margin-left: 20px;
	margin-top: 20px;
}
i {
	margin-top: 10px;
	margin-left: 10px;
}

.w3-container{
	margin-top:40px;
}

.button {
	text-decoration: none;
	color: #7F899A;
	float: right;
	border-color: #C0C0C0; 
	border-radius: 3px;
	
}
a {
	text-decoration: none;
}

a.out {
	color: #767678;
	font-weight: bolder;
	margin-top: 10px;
	margin-left: 5px;
	}
header {
	height: 200px;
	display: flex;
	position: relative;
}

header .btns{
	position: absolute;
	right:0;
	bottom:0;
	margin-bottom:20px;
	margin-right:20px;
}
header .btns button{
	margin: 0 6px;
}
header h3{
	position: absolute;
	bottom : 0;
	font-size: 32px;
	margin-left: 38px;
}
header a{
	display:block;
	padding:26px;
	position: absolute;
	right : 0;
}

.inner{
	position:absolute;
	left:0;
	right:0;
	bottom:0;
	top:0;
	margin:auto;
	width:60%;
	height:60%;
}

hr{
	border-top:1px solid black;
}
</style>
<script>
function a(temp){
	
	const xhttp = new XMLHttpRequest();
	xhttp.onload = function(){
		let txt = xhttp.responseText;
		console.log("val : " + txt);
		let obj = JSON.parse(txt);
		if(obj.tf == "false"){
			alert("비밀번호가 틀립니다.");
		}else{
			let hid = document.getElementById("hid");
			hid.value=temp;
			f.submit();
		}
	}
	let param = "pwdcheck="+ f.pwdcheck.value+"&chk="+temp;
	xhttp.open("GET", "${pageContext.request.contextPath}/member/getpwd.do?"+param);
	xhttp.send();
	
}</script>
</head>
<body>
<div class="inner">
 <div class="w3-container">
  <div class="w3-card-4" >
    <header class="w3-container w3-light-grey">
		<span class="material-symbols-outlined" style="font-size:140px">
			account_circle
		</span>
        <c:if test="${empty sessionScope.loginId }">
        회원 정보가 없습니다. 
        </c:if>
      <h3>${m.id }</h3>
      <div class="btns">
    	  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#chk" id="btn3">수정 및 탈퇴</button>
      </div>
  				
		<a href="${pageContext.request.contextPath }/index.jsp">home</a>
    </header>
    <div class="w3-container">
      <p> 이름 : ${m.name }</p>
      <hr>
      <p> 관계자 유무 : ${m.mCode==0?"일반":"관계자" } ${m.code }</p>
      <hr>
      <p> 전화 번호 : ${m.phone }</p>
      <hr>
      <p> 성별 : ${m.gender.equals("f")?"남자":"여자" }</p>
      <hr>
      <p> 생년월일 : ${m.birth }</p>
      <hr>
      <p> 주소 : ${m.address }</p>
      <hr>
    </div>
  </div>
</div>
</div>
	



<div class="modal" id="chk" >
  <div class="modal-dialog modal-lg" >
    <div class="modal-content" style="width:535px;height:400px;">

      <!-- Modal Header -->
      <div class="modal-header" >
        <h5 class="modal-title"><b>비밀번호 확인</b></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class = "modal-body">
	<form action="${pageContext.request.contextPath }/member/getpwd.do" method="post" name="f">
		<label for="pwdcheck" >현재 비밀번호</label>
		<input type="hidden" name="chk" id = "hid">
		<input type="text" name="pwdcheck" id = "pwdcheck">

      <!-- Modal body -->
	
		<div style="text-align: center; margin-top :150px;">
           <input type="button" class="btn btn-primary" id="button" onclick="a('수정')" value="수정 하기">
           <input type="button" class="btn btn-primary" id="button" onclick="a('삭제')" value="탈퇴 하기">
        </div>
	</form>
      </div>
    </div>
  </div>
</div>
















</body>
</html>