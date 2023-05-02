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
	html, body {
	padding: 0px;
	width: 100%;
	height: 100%;
	disdplay: block;
	margin: 0;
	position: relative;
}
#header{
background-color: rgb(248, 249, 250);
position: fixed;
top:0;
height: 112px;
width: 100%;
border-bottom: 1px solid rgb(203, 205, 206);
}

nav {
	margin: 15px;
	border-radius: 40px 40px 40px 40px;
	height: 10%;
}

#searchbtn {
	border-radius: 0px 30px 30px 0px;
	height: 50px;
}

#search {
	border-radius: 30px 0px 0px 30px;
	height: 50px;
}

#option {
	border-radius: 0px 0px 0px 0px;
	width: 110px;
	margin-left: -5px;
	margin-right: 3.5px;
}

#btn1 {
	border-radius: 30px 0px 0px 30px;
}

#btn2, #btn3 {
	border-radius: 0px 0px 0px 0px;
}

#btn5 {
	border-radius: 0px 30px 30px 0px;
}

#btn1, #btn2, #btn3, #btn4, #btn5, #searchbtn {
	height: 50px;
	border: none;
	background-color: RGB(58, 162, 201);
	font-weight: bold;
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
section, hr{
margin-top: 112px;
}

</style>

</head>
<body>
<div class="header">
	<nav class="navbar navbar-expand-sm bg-success fixed-top bg-light">
		<div class="container-fluid">
			<img alt="logo" src="./img/logo.png" width="9%" height="9%" onclick = "javascript:location.href='${pageContext.request.contextPath }/index.jsp'"  style="cursor: pointer">

			<div class="collapse navbar-collapse" id="mynavbar">
				<ul class="navbar-nav me-auto">
					<li id="menu">
						<div class="btn-group">
							<button type="button" class="btn btn-primary" id="btn1"
								data-bs-toggle="modal" data-bs-target="#myModal">건강정보</button>
							<div class="btn-group">
								<button type="button" class="btn btn-primary dropdown-toggle"
									data-bs-toggle="dropdown" id="btn2">자가건강 테스트</button>
								<div class="dropdown-menu">
									<a class="dropdown-item " href="">테스트 하기</a> 
									<a class="dropdown-item" href="#">테스트 결과</a>
								</div>
								<div class="btn-group">
									<button type="button" class="btn btn-primary dropdown-toggle"
										data-bs-toggle="dropdown" id="btn3">의료 기관</button>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="${pageContext.request.contextPath }/clinic/cliniclist.jsp">병원 검색</a> 
										<a class="dropdown-item" href="${pageContext.request.contextPath }/pharmarcy/pharmarcyList.jsp">약국 검색</a>
									</div>
									<button type="button" class="btn btn-primary" id="btn4">약 정보</button>
									<button type="button" class="btn btn-primary" id="btn5" onclick="javascript:location.href='${pageContext.request.contextPath }/selfcheck/기본양식.jsp'">자유게시판</button>
								</div>
							</div>
						</div>
					</li>
					<c:if test = "${empty sessionScope.loginId }">
					<li class="loginbox">
						<ul class="nav">
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/member/login.jsp">로그인</a></li>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/member/join.jsp">회원가입</a></li>
						</ul>
					</li>
					</c:if>
					<c:if test = "${not empty sessionScope.loginId }">
					<li class="loginbox">
						<ul class="nav">
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/member/myinfo.jsp">마이페이지</a></li>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a></li>
						</ul>
					</li>					
					</c:if>
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
					<input class="btn btn-primary" type="submit" id="searchbtn" value="search">
				</form>
			</div>
		</div>
	</nav>
</div>
<div id="header"></div>
<section>
aaa<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
bbb<br>
</section>
<footer style="background-color : rgb(248, 249, 250); height:100px;width:100%; border"><hr></footer>
</body>
</html>