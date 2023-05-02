<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
ul {
	padding: 10px;
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
</head>
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
	<c:if test="${empty sessionScope.loginId }">
			<input type="text" placeholder="로그인 후 댓글을 달 수 있습니다." readonly style="width: 200px">
	</c:if> 
	<c:if test="${not empty sessionScope.loginId}">
		<form action="${pageContext.request.contextPath }/pharmarcy/pharmarcyRep/load.do?hpid=${PharmarcyVo.hpid}" method = "post">
			<input type="text" name="newRep" placeholder="댓글 작성">
			<input type="submit" value="작성하기">
		</form>
	</c:if>
	

	<div class = "container mt-3">
		댓글
		<ul class = "list-group">
			<c:forEach var = "repVo" items="${repList }">
				<li class="list-group-item d-flex justify-content-between">
					<div>내용 : ${repVo.content }</div>
					<div class = "d-flex">
						<c:if test="${not empty sessionScope.loginId && sessionScope.loginId eq repVo.id }">
								<form action="${pageContext.request.contextPath }/pharmarcy/pharmarcyRepDel/load.do?num=${repVo.num}&hpid=${PharmarcyVo.hpid}" method="post">
								<input type="submit" value="삭제하기" >
								</form>
						</c:if>
						작성자 : ${repVo.id }, 작성 날짜 : ${repVo.date }
					</div>
				</li>
				<c:if test="${code eq PharmarcyVo.hpid}">
					<li class="list-group-item">
						<form action="${pageContext.request.contextPath }/pharmarcy/pharmarcyRrep/load.do?pnum=${repVo.num}&hpid=${PharmarcyVo.hpid}" method="post">
							<input type="text" placeholder="답글을 작성해주세요." name="newRrep">
							<input type="submit" value = "답글 작성하기">
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
											<input type="submit" value="삭제하기">
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
</body>
</html>