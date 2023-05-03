<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.9.0/proj4.js"></script>


<style>
.material-symbols-outlined {
	font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 48
}

th{
width:100px;
}

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
</style>


<script type="text/javascript"> 

window.onload = function(){
	star();

}



function a(num){
	let div = document.getElementById("rrep_"+num);
	if(div.style.display == 'none'){
		div.style.display = '';
	}else if(div.style.display == ''){
		div.style.display = 'none';
	}
}

function star(){
const xhttp = new XMLHttpRequest();
let star = document.getElementById('${vo.code}');
	
	let param = "?code=${vo.code}";  
	param += "&id=${sessionScope.loginId}";
	xhttp.open("GET","${pageContext.request.contextPath}/clinic/bookmark.do"+param);

	xhttp.send();
	
	xhttp.onload = function(){
	
		let txt = xhttp.responseText;
		let obj = JSON.parse(txt);
		console.log(obj);
		if(obj.txt == 'Y'){
			star.style.color = "#fde600";
		}else if(obj.txt == 'N'){
			star.style.color = "gray";
		}else if(obj.txt == "NotLogin"){
			alert("로그인 후 이용 가능합니다.");
		}
		
	}
}
$(document).ready(function(){

	
	$('.material-symbols-outlined').click(function(){
		let code = $(this).attr("id");
		console.log(code);
		let star = document.getElementById('${vo.code}');
		

		$.ajax({
			url:'${pageContext.request.contextPath}/clinic/bookmark.do',
			type : 'post',
			data : {'code': code,'name': '${vo.name}'},
			success:function(result){
				console.log(result);
				let obj = JSON.parse(result);
				if(obj.txt == 'Y'){
					star.style.color = "#fde600";
				}else if(obj.txt == 'N'){
					star.style.color = "#000000";
				}else if(obj.txt == 'NotLogin'){
					alert("Login 후 이용 가능합니다.");
				}
			},
			error:function(req,status){
				alert(status);
			}		
		});
	});
	
	
});
</script>
</head>
<body>

	<div class="container mt-5">
		<h1>${vo.name }<span class="material-symbols-outlined"
				id="${vo.code}"> star </span>
		</h1>
		
		<div class="row">
			<div class="col-sm-6">	
				<div id="map" style="width: 100%; height: 400px;"></div>
			<hr class="d-sm-none">
			</div>
				<div class="col-sm-5">
					<div class = "table-responsive">
						<table class="table table-hover">
							<tr>
								<th>이름</th>
								<td>${vo.name }</td>
							</tr>
							<tr>
								<th>운영상태</th>
								<td>${vo.onoff }</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>${vo.phone }</td>
							</tr>
							<tr>
								<th>주소</th>
								<td>${vo.address }</td>
							</tr>
					
							<tr>
								<th>구분</th>
								<td>${vo.clinic }</td>
							</tr>
							
							<tr>
								<th>진료 과목</th>
								<td>
								<c:forEach var="item" items="${vo.subject }">
								${item}
								</c:forEach>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>


	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=49a26a707e1180839f672089c3c60e78"></script>
	<script>


	const epsg5174 = '+proj=tmerc +lat_0=38 +lon_0=127.0028902777778 +k=1 +x_0=200000 +y_0=500000 +ellps=bessel +units=m +no_defs +towgs84=-115.80,474.99,674.11,1.16,-2.31,-1.63,6.43';
	const wgs84 = '+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs';
	const x = ${vo.x};
	const y = ${vo.y};

	const wgs84arr = proj4(epsg5174, wgs84, [x, y]); // [127.12180235561323, 37.51468090683734]
	// 좌표 변환
// 	const proj4 = require('proj4');

	// EPSG 2097 좌표계와 WGS84 좌표계 정의
// 	proj4.defs("EPSG:2097", "+proj=tmerc +lat_0=38 +lon_0=127.5 +k=1 +x_0=200000 +y_0=500000 +ellps=GRS80 +units=m +no_defs");
// 	proj4.defs("EPSG:4326", "+proj=longlat +datum=WGS84 +no_defs");
	
	let tempx = wgs84arr[0];
	let tempy = wgs84arr[1];
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
	// proj4js 라이브러리 로드

        center: new kakao.maps.LatLng(tempy,tempx), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
    
var map = new kakao.maps.Map(mapContainer, mapOption); 
var markerPosition  = new kakao.maps.LatLng(tempy, tempx); 

//마커를 생성합니다
var marker = new kakao.maps.Marker({
 position: markerPosition
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);
// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다


</script>
<div class = "container mt-3">
	<c:if test="${empty sessionScope.loginId }">
			<input type="text"  class="form-control" placeholder="로그인 후 댓글을 달 수 있습니다." readonly style="width: 85%;margin-bottom:20px">
	</c:if>
	 <c:if test="${not empty sessionScope.loginId}">
				<form action="${pageContext.request.contextPath }/clinic/addrep.do?hpid=${vo.code}" method = "post">
					<input type="text" class="form-control" name="newRep" placeholder="댓글 작성" style="width:90%;display:inline;margin-bottom:20px" >
					<input type="submit" class="btn btn-light"  style="float:right;background-color:#3AA2D2" value="작성하기">
				</form>
		</c:if>
		
		
	
		댓글
		<ul class = "list-group">
		
			<c:forEach var = "repVo" items="${repList }">
				<li class="list-group-item d-flex justify-content-between">
					<div>내용 : ${repVo.content }</div>
					<div class = "d-flex">
					<c:if test="${not empty sessionScope.loginId && sessionScope.loginId eq repVo.id }">
				
						<form action="${pageContext.request.contextPath }/clinic/delRep.do?num=${repVo.num}&hpid=${vo.code}" method="post">
						<input type="submit" value="삭제하기" >
						</form>
						</c:if>
						작성자 : ${repVo.id },작성 날짜 : ${repVo.date }
						</div>
				
					</li>
					
					<c:if test="${code eq vo.code}">
					<li class="list-group-item">
						<form action="${pageContext.request.contextPath }/clinic/addRrep.do?cnum=${repVo.num}&hpid=${vo.code}" method="post">
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
									<div> 답글 내용 : ${rrepVo.content }</div>
									<div>
									답글 작성자 : ${rrepVo.id }, 답글 작성 날짜 : ${rrepVo.date }
										<c:if test="${not empty code && code eq vo.code }">				
											<form action="${pageContext.request.contextPath }/clinic/delRrep.do?num=${rrepVo.num}&hpid=${vo.code}" method="post">
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