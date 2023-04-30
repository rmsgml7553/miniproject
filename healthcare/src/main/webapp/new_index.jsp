<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>Insert title here</title>
<style>
body, html{
margin: 0px;
padding: 0px;
}
nav{
position: fixed;
display: flex; 
justify-content: center;
border-bottom: 1px solid rgb(229, 229, 229);  
/* background-color: rgb(235, 236, 237); */
}
#nav_main{
width: 100%;
height: 60px;
background-color: rgb(235, 236, 237);
border-radius: 50px;
margin: 15px;
}
.logo {
position: relative;
top: -32px;
float: left;
height: 120px;
width : 120px;
display: flex;
align-items: center;
}
#logo_img{
width: 105%;
height: 105%;
}
.menu{
float: left; 
width: 550px;
height:60px;
display: flex;
align-items: center;
}
.member{
float: left; 
width: 430px;
height:60px;
display: flex;
align-items: center;
font-weight: bold;
}
.member a{
 color: RGB(58, 162, 201);
}
.search{
float: right; 
width: 25%;
height:60px;
display: flex;
align-items: center;

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
	height: 45px;
	border: none;
	background-color: RGB(58, 162, 201);
	font-weight: bold;
}
#searchbtn {
	border-radius: 0px 30px 30px 0px;
	margin-right: 10px;
	 color: white;
}

#search {
	border-radius: 30px 0px 0px 30px;
}

#option {
	border-radius: 0px 0px 0px 0px;
	width: 120px;
	margin-left: -5px;
	margin-right: 3.5px;
}
section{
padding-top: 91px;
}

footer{
width: 100%;
height: 100px;
background-color: white;
border-top: 1px solid rgb(229, 229, 229); 
}
</style>
</head>
<body>
<nav>

	<div id="nav_main">
		<div class="logo"><a href="${pageContext.request.contextPath }/newindex.jsp"><img id="logo_img" src="./img/logo.png" ></a></div>
		<div class="menu">
			<div class="btn-group">
				<button type="button" class="btn btn-primary" id="btn1" data-bs-toggle="modal" data-bs-target="#myModal">건강정보</button>
				<div class="btn-group">
				<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" id="btn2">자가건강 테스트</button>
					<div class="dropdown-menu">
					<a class="dropdown-item" href="#">테스트 하기</a> 
					<a class="dropdown-item" href="#">테스트 결과</a>
				</div>
			<div class="btn-group">
				<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" id="btn3">의료 기관</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="${pageContext.request.contextPath }/clinic/cliniclist.jsp">병원 검색</a> 
						<a class="dropdown-item" href="${pageContext.request.contextPath }/pharmarcy/pharmarcyList.jsp">약국 검색</a>
					</div>
					<button type="button" class="btn btn-primary" id="btn4">약 정보</button>
					<button type="button" class="btn btn-primary" id="btn5" onclick="javascript:location.href='${pageContext.request.contextPath }/'">자유게시판</button>
				</div>
			</div>
		</div>	
	</div>
	
	<div class="member">
		<c:if test = "${empty sessionScope.loginId }">
		<ul class="nav">
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/member/login.jsp">로그인</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/member/join.jsp">회원가입</a></li>
		</ul>
		</c:if>
		<c:if test = "${not empty sessionScope.loginId }">
			<ul class="nav">
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/member/myinfo.jsp">마이페이지</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a></li>
			</ul>
		</c:if>
	</div>
	<div class="search">
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
<section>
<h1>Section</h1>
</section>
<footer>
<h1>Footer</h1>
</footer>
</body>
</html>