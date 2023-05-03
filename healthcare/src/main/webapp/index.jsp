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
<script><!-- 페이지넘김 -->
	var mHtml = $("html");
	var page = 1;
	mHtml.animate({
		scrollTop : 0
	}, 10);
	window.addEventListener("wheel", function(e) {
		e.preventDefault();
	}, {
		passive : false
	});
	$(window).on("wheel", function(e) {
		if (mHtml.is(":animated"))
			return;
		if (e.originalEvent.deltaY > 0) {
			if (page == 4)
				return;
			page++;
		} else if (e.originalEvent.deltaY < 0) {
			if (page == 1)
				return;
			page--;
		}
		var posTop = (page - 1) * $(window).height();
		mHtml.animate({
			scrollTop : posTop
		});
	});
</script>


<style>
html {
	overflow: hidden;
}
	html, body {
	padding: 0px;
	width: 100%;
	height: 100%;
	disdplay: block;
	margin: 0;
	position: relative;
}

video {
	width: 100%;
	position: fixed;
	z-index: 1;
	opacity:;
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

.section {
	width: 100%;
	height: 100%;
	position: relative;
	opacity: 1;
	z-index: 2;
}

.img {
	position: absolute;
	right: 0px; 
	bottom: 0px; 
	width:100%;

	
}

#section1 {
	
}

#section2 {
	
}

#section3 {
	
}

#section4 {<!-- footer -->
 	background-color: white; 
}
</style>


</head>
<body>
	<nav class="navbar navbar-expand-sm bg-success fixed-top bg-light">
		<div class="container-fluid">
			<img alt="logo" src="img/logo.png" width="9%" height="9%" onclick = "javascript:location.href='${pageContext.request.contextPath }/index.jsp'"  style="cursor: pointer">

			<div class="collapse navbar-collapse" id="mynavbar">
				<ul class="navbar-nav me-auto">
					<li id="menu">
						<div class="btn-group">
							<button type="button" class="btn btn-primary" id="btn1">건강정보</button>
							<div class="btn-group">
								<button type="button" class=button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" id="btn2">자가건강 테스트</button>
									<div class="dropdown-menu">
										<a class="dropdown-item " href="#">테스트 하기</a> 
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
									<button type="button" class="btn btn-primary" id="btn5" onclick="javascript:location.href='${pageContext.request.contextPath }/board/list.do'">자유게시판</button>
								</div>
							</div>
						</div>
					</li>
					<c:if test = "${empty sessionScope.loginId }">
					<li class="loginbox">
						<ul class="nav">
							<li class="nav-item">    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#join" style="background-color: rgb(248, 249, 250);color: RGB(58, 162, 201);font-weight: bold;border: 0px;">회원가입</button></li>
							<li class="nav-item">    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#login" style="background-color: rgb(248, 249, 250);color: RGB(58, 162, 201);font-weight: bold;border: 0px;">로그인</button></li>
						</ul>
					</li>
					</c:if>
					<c:if test = "${not empty sessionScope.loginId }">
					<li class="loginbox">
						<ul class="nav">
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/mypage.jsp">마이페이지</a></li>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/member/logout.do">로그아웃</a></li>
						</ul>
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


	<video muted autoplay loop>
		<source src="img/video.mp4" type="video/mp4">
	</video>

	<div class="section" id="section1">
		<div class="img">
			<img src="img/a.png">
		</div>
	</div>
	<div class="section" id="section2">
		<div class="img">
			<img src="img/2.png">
		</div>
	</div>
	<div class="section" id="section3">
		<div class="img">
			<img src="img/3.png">
		</div>
	</div>
	<div class="section" id="section4">
		<div class="img">
			<img src="img/4.png">
		</div>
	</div>
	
	<!-- 모달은 여기에 -->
	 <!-- The Modal : login -->
         <div class="modal" id="login">
            <div class="modal-dialog modal-dialog-centered">
               <div class="modal-content">


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
                           <input type="button" class="btn btn-primary" id="button"
                              onclick="a()"
                              style="background-color: RGB(58, 162, 201); border: 0px;"
                              value="로그인">
                        </div>
                     </form>
                  </div>
               </div>
            </div>
         </div>
	 <!-- The Modal : join -->
         <div class="modal" id="join">
            <div class="modal-dialog modal-dialog-centered">
               <div class="modal-content">


                  <!-- Modal body -->
                  <div class="modal-body">
                     <iframe src="${pageContext.request.contextPath }/member/join.jsp" title="iframe"
								width="100%" height="400px" style="border:none;"> </iframe>
                  </div>
               </div>
            </div>
         </div>
    <!-- Modal : join -->
  <div class="modal fade" id="join" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><b>자가건강검진</b></h4>
        </div>
        <div class="modal-body">
          <iframe src="${pageContext.request.contextPath }/selfcheck/bmi.do" title="iframe"
							 height="700px" style="border:none;"> </iframe>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

	
</body>
</html>