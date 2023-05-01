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
<style>
.material-symbols-outlined {
	font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 48
}
</style>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.9.0/proj4.js"></script>

<script type="text/javascript"> 

window.onload = function(){
	star();
// 	comments();
}
// function comments(){
// const xhttp = new XMLHttpRequest();
	
	
// 	let param = "?code=${vo.code}";  
// 	xhttp.open("GET","${pageContext.request.contextPath}/clinic/comment.do"+param);

// 	xhttp.send();
	
// 	xhttp.onload = function(){
	
// 		var button = document.createElement("input");
// 		button.type= "button";
		
		
// 		let val = xhttp.responseText;
// 		console.log(val);
// 		let arr = JSON.parse(val);
// 		let html = "<table border ='1'>";
// 		for(let obj of arr ){
// 		html += '<tr><td> 작성자 : ' + obj.id + '<br/>';
// 		html += '내용 : ' + obj.content + '<br/>';
// 		html += '작성일 : ' + obj.date + '<br/>';
// 		html += '</td></tr>';
		
//  		};
// 		html += '</table>';
// 		let div = document.getElementById("r");
// 		 div.innerHTML = html;
// 	}
	 
	
// }


// function addcomments(){
// 	const xhttp = new XMLHttpRequest();
	
// 	let param = 'id=${sessionScope.loginId}';
// 	param += '&code=${vo.code}';  
// 	param += "&content=" + document.getElementById('content').value;

	
// 	xhttp.open("POST","${pageContext.request.contextPath}/clinic/addrep.do");
// 	xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=euc-kr");
// 	xhttp.send(param);
	
	
// 	xhttp.onload = function(){
	
// 		let val = xhttp.responseText;
// 		console.log(val);
// 		let arr = JSON.parse(val);
// 		console.log(arr);
// 		let html = "<table border ='1'>";
// 		for(let obj of arr ){
// 		html += '<tr><td> 작성자 : ' + obj.id + '<br/>';
// 		html += '내용 : ' + obj.content + '<br/>';
// 		html += '작성일 : ' + obj.date + '<br/>';
// 		html += '</td></tr>';
		
//  		};
// 		html += '</table>';
// 		let div = document.getElementById("r");
// 		 div.innerHTML = html;
// 	}
	 
// 	document.getElementById('content').value = "";
// }


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
	${sessionScope.loginId}
	<br />
	<h3>병원 정보</h3>
	<table border="1">
		<tr>
			<th>병원이름</th>
			<td>${vo.name }<span class="material-symbols-outlined"
				id="${vo.code}"> star </span>
			</td>
		</tr>
		<tr>
			<th>code</th>
			<td>${vo.code }</td>
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
			<th>업태 구분명</th>
			<td>${vo.clinic }</td>
		</tr>
		<tr>
			<th>좌표x</th>
			<td id="x">${vo.x }</td>
		</tr>
		<tr>
			<th>좌표y</th>
			<td id="y">${vo.y }</td>
		</tr>
		<tr>
			<th>진료 과목</th>
			<td><c:forEach var="item" items="${vo.subject }">
				</c:forEach></td>
		</tr>
	</table>

	<div id="map" style="width: 500px; height: 400px;"></div>
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
	<table border="1">
		<tr>
			<td><c:if test="${empty sessionScope.loginId }">
					<input type="text" placeholder="로그인 후 댓글을 달 수 있습니다." readonly
						style="width: 200px">
				</c:if> <c:if test="${not empty sessionScope.loginId}">
				<form action="${pageContext.request.contextPath }/clinic/addrep.do?hpid=${vo.code}" method = "post">
					<input type="text" name="newRep" placeholder="댓글 작성">
					<input type="submit" value="작성하기">
				</form>
				</c:if></td>
		</tr>
	</table>
	<div id="repList">
		<ul class = "repWrite">
		</ul>
			<c:forEach var = "repVo" items="${repList }">
				<ul class = "repMain${repVo.num }">
					<li>작성자 : ${repVo.id }</li>
					<li>내용 : ${repVo.content }</li>
					<li>작성 날짜 : ${repVo.date }</li>
					<li>${repVo.num }</li>
					<c:if test="${not empty sessionScope.loginId && sessionScope.loginId eq repVo.id }">
					<li>
						<form action="${pageContext.request.contextPath }/clinic/delRep.do?num=${repVo.num}&hpid=${vo.code}" method="post">
						<input type="submit" value="삭제하기" >
						</form>
					</li>
					</c:if>
					<c:if test="${code eq vo.code}">
					<li>
						<form action="${pageContext.request.contextPath }/clinic/addRrep.do?cnum=${repVo.num}&hpid=${vo.code}" method="post">
							<input type="text" placeholder="답글을 작성해주세요." name="newRrep">
							<input type="submit" value = "답글 작성하기">
						</form>
					</li>
					</c:if>
				<c:forEach var ="rrepVo" items="${repVo.list }">
					<ul class = "rrepMain">
						<li>답글 작성자 : ${rrepVo.id }</li>
						<li>답글 내용 : ${rrepVo.content }</li>
						<li>답글 작성 날짜 : ${rrepVo.date }</li>
						<c:if test="${not empty code && code eq vo.code }">
						<li>
							<form action="${pageContext.request.contextPath }/clinic/delRrep.do?num=${rrepVo.num}&hpid=${vo.code}" method="post">
								<input type="submit" value="삭제하기">
							</form>
						</li>
						</c:if>
					</ul>
				</c:forEach>
				</ul>
			</c:forEach>
	</div>
</body>
</html>