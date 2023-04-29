<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  
<style>
	html{overflow: hidden;}
	html, body {
	padding:0px;
	width:100%;
	height:100%;
	disdplay:block;
	margin : 0;
	position:relative;
	}
	
	video { 
		width: 100%; 
		position:fixed;
		z-index:1;
	}

	nav{
	margin : 15px;
	border-radius: 40px 40px 40px 40px ;
	height : 10%;
	border: 10px, solid, black;
	}
	
	#searchbtn{
	border-radius: 0px 30px 30px 0px ;
	height: 50px;
	}
	#search{
	border-radius: 30px 0px 0px 30px ;
	height: 50px;
	}
	#option{
	border-radius: 0px 0px 0px 0px ;
	width: 110px;
	margin-left: -5px;
	margin-right: 3.5px;
	}
	#btn1{
	border-radius: 30px 0px 0px 30px;
	}
	#btn2, #btn3{
	border-radius: 0px 0px 0px 0px;
		}
	#btn5{
	border-radius: 0px 30px 30px 0px;
	}
	#btn1,#btn2,#btn3,#btn4,#btn5, #searchbtn{
	height: 50px;
	border : none;
	background-color: RGB(58, 162, 201);
	font-weight: bold;
	}
	.loginbox{
	margin-top : 8.5px;
	margin-left : 12px;
	}
	.loginbox a{
	color:RGB(58, 162, 201);
	font-weight: bold;
	}
	#menu{
	margin-top : 3px;
	}
	
	.myModal{
	width : 80%;
	height: 1000px;
	background-color: red;
	}
	
	
	.section {
    width: 100%;
    height: 100%;
    position: relative;
	opacity:1;
	z-index:2;
	}
	.img{
	position: absolute; right: 0px; bottom: 0px;
	}

#section1 {
    
}

#section2 {
 
}

#section3 {

}

#section4 {
background-color: white;
}
	
</style>
<script>

var mHtml = $("html");
var page = 1;
mHtml.animate({scrollTop : 0},10);
window.addEventListener("wheel", function(e){
e.preventDefault();},{passive : false});
$(window).on("wheel", function(e) {
	if(mHtml.is(":animated")) return;
	if(e.originalEvent.deltaY > 0) {
	if(page == 4) return;
	page++;} else if(e.originalEvent.deltaY < 0) {
	        if(page == 1) return;
	        page--;
	    }
	var posTop =(page-1) * $(window).height();
	mHtml.animate({scrollTop : posTop});
	});
 </script>
</head>
<body >
<nav class="navbar navbar-expand-sm bg-success fixed-top bg-light">
  <div class="container-fluid">
   <img alt="logo" src="img/logo.png" width="9%" height="9%">
    
    <div class="collapse navbar-collapse" id="mynavbar">
      <ul class="navbar-nav me-auto">
        <li id="menu">
			<div class="btn-group">
				<button type="button" class="btn btn-primary" id="btn1"  data-bs-toggle="modal"  data-bs-target="#myModal">건강정보</button>
				<div class="btn-group">
					<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown"  id="btn2">자가건강 테스트</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">테스트 하기</a>
						<a class="dropdown-item" href="#">테스트 결과</a>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown"  id="btn3">약정보</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">약 검색</a>
							<a class="dropdown-item" href="#">병원 검색</a>
						</div>
					<button type="button" class="btn btn-primary"  id="btn4">병원정보</button>
					<button type="button" class="btn btn-primary"  id="btn5">자유게시판</button>
				</div>
        </li>
        <li class="loginbox">
         	<ul class="nav">
  				<li class="nav-item">
    				<a class="nav-link" href="#">로그인</a>
 				 </li>
  				<li class="nav-item">
    				<a class="nav-link" href="#">회원가입</a>
 				 </li>
 				 </li>
  				<li class="nav-item">
    				<a class="nav-link" href="#">회원정보</a>
 				 </li>
 				 </li>
  				<li class="nav-item">
    				<a class="nav-link" href="#">마이페이지</a>
 				 </li>
			</ul>
        </li>
     </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="text" placeholder="검색"  id="search">
        <select class="form-select" id="option" >
  			<option>병원</option>
  			<option>약국</option>
  			<option>약</option>
		</select>
        <button class="btn btn-primary" type="button" id="searchbtn">Search</button>
      </form>
    </div>
  </div>
</nav>

<div class="modal" id="myModal">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        Modal body..
      </div>
    </div>
  </div>
</div>

<video muted autoplay loop>
	<source src="img/video.mp4" type="video/mp4">
</video>

<div class="section" id="section1"><div class="img"><img src="img/1.png"></div></div>
<div class="section" id="section2"><div class="img"><img src="img/2.png"></div></div>
<div class="section" id="section3"><div class="img"><img src="img/3.png"></div></div>
<div class="section" id="section4"><div class="img"><img src="img/4.png"></div></div>

</body>
</html>