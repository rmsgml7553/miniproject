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
  font-variation-settings:
  'FILL' 0,
  'wght' 400,
  'GRAD' 0,
  'opsz' 48
}
</style>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.9.0/proj4.js"></script>

<script type="text/javascript"> 

window.onload = function(){
	comments();
	star();
}
function comments(){
const xhttp = new XMLHttpRequest();
	
	
	let param = "?code=${vo.code}";  
	xhttp.open("GET","${pageContext.request.contextPath}/clinic/comment.do"+param);

	xhttp.send();
	
	xhttp.onload = function(){
	
		var button = document.createElement("input");
		button.type= "button";
		
		
		let val = xhttp.responseText;
		console.log(val);
		let arr = JSON.parse(val);
		let html = "<table border ='1'>";
		for(let obj of arr ){
		html += '<tr><td> 작성자 : ' + obj.id + '<br/>';
		html += '내용 : ' + obj.content + '<br/>';
		html += '작성일 : ' + obj.date + '<br/>';
		html += '</td></tr>';
		
 		};
		html += '</table>';
		let div = document.getElementById("r");
		 div.innerHTML = html;
	}
	 
	
}


function addcomments(){
	const xhttp = new XMLHttpRequest();
	
	let param = 'id=${sessionScope.loginId}';
	param += '&code=${vo.code}';  
	param += "&content=" + document.getElementById('content').value;

	
	xhttp.open("POST","${pageContext.request.contextPath}/clinic/addrep.do");
	xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=euc-kr");
	xhttp.send(param);
	
	
	xhttp.onload = function(){
	
		let val = xhttp.responseText;
		console.log(val);
		let arr = JSON.parse(val);
		console.log(arr);
		let html = "<table border ='1'>";
		for(let obj of arr ){
		html += '<tr><td> 작성자 : ' + obj.id + '<br/>';
		html += '내용 : ' + obj.content + '<br/>';
		html += '작성일 : ' + obj.date + '<br/>';
		html += '</td></tr>';
		
 		};
		html += '</table>';
		let div = document.getElementById("r");
		 div.innerHTML = html;
	}
	 
	document.getElementById('content').value = "";
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
	
		let val = xhttp.responseText;
		console.log(val);
		if(val == 'Y'){
			star.style.color = "#fde600";
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
			data : {'code': code},
			success:function(result){
				if(result == 'Y'){
					
					star.style.color = "#fde600";
				}else if(result == 'N'){
					star.style.color = "#000000";
				}else if(result == 'NotLogin'){
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
			<td>${vo.name }
			<span class="material-symbols-outlined" id ="${vo.code}" >
			stars
			</span>
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
${item }
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
	<br /> 댓글 :

	<input type="text" id="content" name="content">
	<input type="button" value="댓글 작성" onclick="addcomments()">
		
	<br />

	<div id="r">

<!-- 		<table border="1" id="rep_table"> -->
<%-- 			<c:forEach var="rep" items="${rep }"> --%>
<!-- 				<tr> -->
<%-- 					<td>작성자 : ${rep.id } <br />  --%>
<%-- 					댓글내용 : ${rep.content } <br />  --%>
<%-- 					작성일: ${rep.date } <br />  --%>
<%-- 					<input type="button" value="대댓글" name="rrep" id="rrep" onclick="a(${rep.num})"><br /> --%>
<%-- 						<form action="" method="post" id="rrep_${rep.num }" --%>
<!-- 							style="display: none"> -->
<!-- 							<input type="text" id="rrep_write"><input type="submit" -->
<!-- 								value="작성" id="rrep_submit"> -->
<!-- 						</form> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<%-- 			</c:forEach> --%>
<!-- 		</table> -->
	</div>
</body>
</html>