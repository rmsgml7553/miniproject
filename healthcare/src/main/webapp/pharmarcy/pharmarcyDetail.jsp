<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

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


window.onload = function(){
	let star = document.getElementsByClassName("material-symbols-outlined")[0];
	const xhttp = new XMLHttpRequest();
	xhttp.onload = function(){
		let txt = xhttp.responseText;
		console.log(txt)
		let obj = JSON.parse(txt);
		if(obj.tf == "Y"){
			star.style.color = "#ffcc00";
		}else if(obj.tf == "N"){
			star.style.color = "gray";
		}
	}
	xhttp.open("GET","${pageContext.request.contextPath}/pharmarcy/pharmarcyLike/load.do?hpid=${PharmarcyVo.hpid}");
	xhttp.send();
}

function change(){
	let star = document.getElementsByClassName("material-symbols-outlined")[0];
	const xhttp = new XMLHttpRequest();
	console.log("change");
	xhttp.onload = function() {
		let txt = xhttp.responseText;
		let obj = JSON.parse(txt);

		if(obj.tf == "Y"){
			star.style.color = "#ffcc00";
		}else if(obj.tf == "N"){
			star.style.color = "gray";
		}else if(obj.tf == "NotLogin"){
			alert("login 후 이용 가능합니다.");	
		}
	}
	xhttp.open("POST","${pageContext.request.contextPath}/pharmarcy/pharmarcyLike/load.do");
	xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=UTF-8")
	xhttp.send("hpid=${PharmarcyVo.hpid}&name=${PharmarcyVo.dutyName}");
}
</script>
<script>
function selfChkChk(){
	alert("로그인 후 사용 가능합니다.");
}
</script>
<style>
ul {
	padding: 10px;
}
th{
	width:100px;	
}
li {
	display: flex;
	padding: 10px;
}
#map{
padding: 0px;
}
.card{
border-radius: 20px 20px 20px 20px;
margin: 10px;
}
.material-symbols-outlined {
  font-variation-settings:
  'FILL' 1,
  'wght' 400,
  'GRAD' 0,
  'opsz' 48
}
</style>
<style>

}
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
z-index: 3;
}
section{
padding-top: 80px;
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
	<img alt="logo" src="/healthcare/img/logo.png" width="9%" height="9%" onclick = "javascript:location.href='${pageContext.request.contextPath }/index.jsp'"  style="cursor: pointer">
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
         
         
         
         
         
         
<section>
<!------------------------------- 내용입력 여기에다가!!!!! ----------------------------------------->
<body>
	<div class="container mt-5">
    	<h1>${PharmarcyVo.dutyName }
			<span class="material-symbols-outlined" style="color: gray; font-size:30px;" onclick="change()"> stars </span>
    	</h1>  
		<div class="row">
			<div class="col-sm-7">
     			<div id="map" style="width: 100%; height: 400px;"></div>
			<hr class="d-sm-none">
			</div>
    		<div class="col-sm-4">
				<div class = "table-responsive">
					<table class="table table-hover">
						<tr>
							<th>이름</th>
							<td>${PharmarcyVo.dutyName }</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>${PharmarcyVo.dutyAddr }</td>
						</tr>
						<tr>
							<th>전화 번호</th>
							<td>${PharmarcyVo.dutyTel }</td>
						</tr>
						<c:forEach var="day" items="${PharmarcyVo.dutyTime }">
							<tr>
								<c:forEach var="time" items="${day }">
									<c:if test = "${empty time }">
									<td>휴무</td>
									</c:if>					
									<c:if test = "${not empty time }">
									<td>${time }</td>
									</c:if>					
								</c:forEach>
							</tr>
						</c:forEach>
					</table>
				</div>
    		</div>
		</div>
	</div>
	
     
     <script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=49a26a707e1180839f672089c3c60e78"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(${PharmarcyVo.wgs84Lat }, ${PharmarcyVo.wgs84Lon }), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(${PharmarcyVo.wgs84Lat }, ${PharmarcyVo.wgs84Lon });

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);
	</script>
	

	<div class = "container mt-3">
		<c:if test="${empty sessionScope.loginId }">
				<input type="text" placeholder="로그인 후 댓글을 달 수 있습니다." readonly style="width: 200px">
		</c:if> 
		<c:if test="${not empty sessionScope.loginId}">
			<form action="${pageContext.request.contextPath }/pharmarcy/pharmarcyRep/load.do?hpid=${PharmarcyVo.hpid}" method = "post">
				<input type="text" class = "form-control" name="newRep" placeholder="댓글 작성" style="width:90%;display:inline;margin-bottom:20px;">
				<input type="submit" class = "btn btn-light" value="작성하기" style = "float:right; background-color:rgb(233, 236, 239);color:black;border: 0px">
			</form>
		</c:if>
		댓글
		<ul class = "list-group">
			<c:forEach var = "repVo" items="${repList }">
				<li class="list-group-item d-flex justify-content-between">
					<div>내용 : ${repVo.content }</div>
					<div>
						작성자 : ${repVo.id }, 작성 날짜 : ${repVo.date }
						<c:if test="${not empty sessionScope.loginId && sessionScope.loginId eq repVo.id }">
								<form action="${pageContext.request.contextPath }/pharmarcy/pharmarcyRepDel/load.do?num=${repVo.num}&hpid=${PharmarcyVo.hpid}" method="post">
								<input type="submit" class = "btn btn-danger" value="del" >
								</form>
						</c:if>
					</div>
				</li>
				<c:if test="${code eq PharmarcyVo.hpid}">
					<li class="list-group-item">
						<form action="${pageContext.request.contextPath }/pharmarcy/pharmarcyRrep/load.do?pnum=${repVo.num}&hpid=${PharmarcyVo.hpid}" method="post">
							<input type="text" placeholder="답글을 작성해주세요." name="newRrep">
							<input type="submit" class="btn btn-light" value = "답글 작성하기" style=" background-color:#3AA2D2;">
						</form>
					</li>
				</c:if>
				<c:if test = "${not empty repVo.list }">
					<li class="list-group-item">
						답글
						<ul class = "list-group ">
						<c:forEach var ="rrepVo" items="${repVo.list }">
							<li class="list-group-item d-flex justify-content-between">
								<div>답글 내용 : ${rrepVo.content }</div>
								<div>
									답글 작성자 : ${rrepVo.id }, 답글 작성 날짜 : ${rrepVo.date }
									<c:if test="${not empty code && code eq PharmarcyVo.hpid }">
										<form action="${pageContext.request.contextPath }/pharmarcy/pharmarcyRrepDel/load.do?num=${rrepVo.num}&hpid=${PharmarcyVo.hpid}" method="post">
											<input type="submit" class="btn btn-danger" value="del">
										</form>
									</c:if>
								</div>
							</li>
						</c:forEach>
						</ul>
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>


</section>
<footer style="background-color : white;position: fixed;bottom: 0px;z-index:4;left:0px;width:100%;height:60px;border-top: 1px solid rgb(221, 221, 221);font-size: 12px; ">
<span style="position: absolute;left:30px;">서울특별시 송파구 위례성대로 14 | 대표번호 | 02-410-9114 | 소비자상담실 : 080-916-9000 <br>
투자문의 02-410-0404 (알빠노 주식회사)<br>
[SSL 보안프로그램 적용]ALBBANO는 더욱 안심하고 신뢰할 수 있는 서비스를 제공하기 위해 최선을 다하고 있습니다.
<b>©ALBBANO .Co.,Ltd.</b></span>
</footer>
</body>
</html>