<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
</style>

<script> <!-- 로그인 -->
   function a() {
      const xhttp = new XMLHttpRequest();
      xhttp.onload = function() {
         let tags = document.getElementsByTagName("input");
         let res = document.getElementById("res");
         let obj = xhttp.responseText;
         console.log(obj);
         let arr = JSON.parse(obj);
         if (arr.flag == "로그인 완료") {
            window.location.href = "${pageContext.request.contextPath}/member/logincomplete.do";
         } else {
            alert(arr.flag);
         }

      }
      let param = "?id=" + f.id.value + "&pwd=" + f.pwd.value;
      xhttp.open("get", "${pageContext.request.contextPath}/member/login.do"
            + param);
      xhttp.send();
   }
</script>
<script>
function selfChkChk(){
	alert("로그인 후 사용 가능합니다.");
}
</script>

<style>
	html, body {
	padding: 0px;
	width: 100%;
	height: 100%;
	disdplay: block;
	margin: 0;
	position: relative;
}

nav {
	margin: 15px;
	border-radius: 40px 40px 40px 40px;
	height: 10%;

}
#nav{
background-color : white;
position: fixed;
top 0px;
left: 0px;
right: 0px;
width : 100%;
height: 117px;
border-bottom: 1px solid rgb(221, 221, 221);
}
section{
padding-top: 130px;
padding-bottom: 80px;
}

#searchbtn {
	border-radius: 0px 30px 30px 0px;
	height: 50px;
}

#search {
	border-radius: 30px 0px 0px 30px;
	height: 50px;
	width: 300px;
	
}

#option {
	border-radius: 0px 0px 0px 0px;
	width: 150px;
	margin-left: -5px;
	margin-right: 3.5px;
}

#btn1 {
	border-radius: 30px 0px 0px 30px;
}

#btn2, #btn3 {
	border-radius: 0px 0px 0px 0px;
}

#btn4 {
	border-radius: 0px 30px 30px 0px;

}

#btn1, #btn2, #btn3, #btn4, #searchbtn {
	height: 50px;
	border: none;
	background-color: RGB(58, 162, 201);
	font-weight: bold;
	color: white;
}

.loginbox {
	margin-top: 8.5px;
	margin-left: 12px;
}

.loginbox a {
	color: RGB(58, 162, 201);
	font-weight: bold;
}

#menu {
	margin-top: 3px;
}

.myModal {
	width: 80%;
	height: 1000px;
}


</style>


</head>
<body>
<!-- 내비시작 -->
<nav class="navbar navbar-expand-sm navbar-dark bg-light fixed-top">
  <div class="container-fluid">
	<img alt="logo" src="../img/logo.png" width="9%" height="9%" onclick = "javascript:location.href='${pageContext.request.contextPath }/index.jsp'"  style="cursor: pointer">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="mynavbar">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
			<div class="btn-group">
				<c:if test="${empty sessionScope.loginId }">
				<button type="button" class="btn btn-primary" id="btn1" onclick="selfChkChk()">자가건강점검</button>
				</c:if>
				<c:if test="${not empty sessionScope.loginId }">
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#bmi" id="btn1">자가건강점검</button>
				</c:if>
  				<button type="button" class="btn btn-primary" id="btn2" onclick = "javascript:location.href='${pageContext.request.contextPath }/board/list.do'"  style="cursor: pointer">자유게시판</button>
  				<c:if test = "${empty sessionScope.loginId }">
  				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#join" id="btn3">회원가입</button>
  				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#login" id="btn4">로그인</button>
  				</c:if>
  				<c:if test = "${not empty sessionScope.loginId }">
  				<button type="button" class="btn btn-primary" id="btn3" onclick = "javascript:location.href='${pageContext.request.contextPath }/member/logincomplete.do'"  style="cursor: pointer">마이페이지</button>
  				<button type="button" class="btn btn-primary" id="btn4" onclick = "javascript:location.href='${pageContext.request.contextPath }/member/logout.do'"  style="cursor: pointer">로그아웃</button>
  				</c:if>
			</div>
        </li>
        <li class="nav-item">
          
        </li>
      </ul>
      <form class="d-flex" action ="${pageContext.request.contextPath }/search/load.do">
        <input class="form-control me-2" type="text" placeholder="검색" name="search" id="search">
        <select class="form-select" id="option" name="institution">
						<option value="clinic">병원</option>
						<option value="pharmarcy">약국</option>
						<option value="pillItem">약 : 제품명</option>
						<option value="pillEntp">약 : 업체명</option>
						<input type="hidden" name="from" value="searchHandler">
					</select>
        <button class="btn btn-primary" type="submit" id="searchbtn">Search</button>
      </form>
    </div>
  </div>
</nav>
<div id="nav"></div>
<!--  내비끝 -->
	<!-- 모달은 여기에 -->
	<!-- 회원가입 -->
<div class="modal" id="join" >
  <div class="modal-dialog modal-lg" style="width:535px;">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header" >
        <h5 class="modal-title"><b>회원가입</b></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"  onclick="location.reload()"></button>
      </div>

      <!-- Modal body -->
      <iframe src="${pageContext.request.contextPath }/member/join.jsp" title="iframe"
							 height="500px" style="border:none;"> </iframe>

    </div>
  </div>
</div>
<!-- 자가건강 -->
<div class="modal" id="bmi">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h5 class="modal-title"><b>자가건강점검</b></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" onclick="location.reload()"></button>
      </div>

      <!-- Modal body -->
      <iframe src="${pageContext.request.contextPath }/selfcheck/bmi.do" title="iframe"
							 height="600px" style="border:none;"> </iframe>

    </div>
  </div>
</div>
<!-- 로그인창 -->
         <div class="modal" id="login">
            <div class="modal-dialog modal-dialog-centered">
               <div class="modal-content">

 <!-- Modal Header -->
      <div class="modal-header">
        <h5 class="modal-title"><b>로그인</b></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"  onclick="location.reload()"></button>
      </div>
                  <!-- Modal body -->
                  <div class="modal-body">
                     <form
                        action="${pageContext.request.contextPath }/member/login.do"
                        name="f" method="post" class="was-validated">
                        <div class="mb-3 mt-3">
                           <label for="id" class="form-label"><b>아이디</b></label> <input
                              type="text" class="form-control" id="id" placeholder="ID"
                              name="id" required>
                           <div class="valid-feedback">Valid.</div>
                           <div class="invalid-feedback">Please fill out this field.</div>
                        </div>
                        <div class="mb-3">
                           <label for="pwd" class="form-label"><b>비밀번호</b></label> <input
                              type="password" class="form-control" id="pwd"
                              placeholder="Password" name="pwd" required>
                           <div class="valid-feedback">Valid.</div>
                           <div class="invalid-feedback">Please fill out this field.</div>
                        </div>
                        <div style="text-align: center;">
                           <input type="button" class="btn btn-default" id="button"
                              onclick="a()"
                              value="로그인">
                        </div>
                     </form>
                  </div>
               </div>
            </div>
         </div>
<section><!-- 내용입력 여기에다가!!!!! -->
<div class="container">
<h3><b>글작성</b></h3>
<form action="${pageContext.request.contextPath }/board/add.do" method="post">
<table border="1">

	<div class="form-group">
		<label for="comment">작성자:</label>
		<input type="text" class="form-control" id="comment" name="id" value="${sessionScope.loginId }" readonly>
	</div>
	<div class="form-group">
		<label for="comment">제목:</label>
		<input type="text" class="form-control" id="comment" name="title" >
	</div>
	<div class="form-group">
      <label for="comment">글내용:</label>
      <textarea class="form-control" rows="10" id="comment" name="content"></textarea>
    </div>
    <button type="button" class="btn btn-light btn-sm" style="margin-right:10px;margin-top: 10px;" onclick = "javascript:location.href='${pageContext.request.contextPath }/board/list.do'">취소</button>
    <button type="submit" class="btn btn-primary btn-sm" style="background-color:rgb(233, 236, 239);color:black;border: 0px;margin-top: 10px;" >작성</button>
</table>
</form>
</div>
</section>


<footer style="background-color : white;position: fixed;bottom: 0px;left:0px;width:100%;height:60px;border-top: 1px solid rgb(221, 221, 221);font-size: 12px; ">
<span style="position: absolute;left:30px;">서울특별시 송파구 위례성대로 14 | 대표번호 | 02-410-9114 | 소비자상담실 : 080-916-9000 <br>
투자문의 02-410-0404 (알빠노 주식회사)<br>
[SSL 보안프로그램 적용]ALBBANO는 더욱 안심하고 신뢰할 수 있는 서비스를 제공하기 위해 최선을 다하고 있습니다.
<b>©ALBBANO .Co.,Ltd.</b></span>
</footer>
</body>
</html>