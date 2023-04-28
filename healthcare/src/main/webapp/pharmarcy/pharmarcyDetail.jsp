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
<style>
ul {
	display: flex;
	padding: 10px;
}

li {
	padding: 10px;
}
</style>

<script>

let tfRrep = true;

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
	reps();
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
	xhttp.send("hpid=${PharmarcyVo.hpid}");
}


function addRep(){
	const xhttp = new XMLHttpRequest();
	let newRep = document.getElementById("newRep").value;
	
	// 새로 받은 댓글 넣기
	xhttp.onload = function(){
		let txt = xhttp.responseText;
		console.log(txt);
		let arr = JSON.parse(txt);
	
		let temp = document.createElement('div');
		let html ='';
		for(let obj of arr){
			html += '<ul class="repMain">'
				+ '<li>'+obj.date+'</li>'
				+ '<li>'+obj.id+'</li>'
				+ '<li>'+obj.content+'</li>'
				+ '</ul>'
				+ '<ul  id = "prep'+obj.num+'">'
				+ '</ul>'
				+ '<ul class="reppWrite">'
				+ '<li><input type = "text" placeholder="답글 작성하기" id = "rrep"></li>'
				+ '<li><input type = "button" value="답글 작성" onclick = "addRrep('+obj.num+')"></li>'
				+ '<li><input type = "button" value="답글 보기" onclick = "rreps('+obj.num+')"></li>'
				+ '</ul>';
		}
		temp.innerHTML = html;
		let repList = document.getElementsByClassName("rreps")[0];
		repList.innerHTML = '';
		repList.append(temp);
	}
	
	xhttp.open("POST","${pageContext.request.contextPath}/pharmarcy/pharmarcyRep/load.do");
	xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=UTF-8");
	xhttp.send("hpid=${PharmarcyVo.hpid}&newRep="+newRep);
	
}

function reps(){
	const xhttp = new XMLHttpRequest();
	
	// 새로 받은 댓글 넣기
	xhttp.onload = function(){
		let txt = xhttp.responseText;
		let arr = JSON.parse(txt);
		let temp = document.createElement('div');
		let html ='';
		for(let obj of arr){
			html += '<ul class="repMain">'
			+ '<li>'+obj.date+'</li>'
			+ '<li>'+obj.id+'</li>'
			+ '<li>'+obj.content+'</li>'
			+ '</ul>'
			+ '<ul  id = "prep'+obj.num+'">'
			+ '</ul>'
			+ '<ul class="reppWrite">'
			+ '<li><input type = "text" placeholder="답글 작성하기" id = "rrep'+obj.num+'"></li>'
			+ '<li><input type = "button" value="답글 작성" onclick = "addRrep('+obj.num+')"></li>'
			+ '<li><input type = "button" value="답글 보기" onclick = "rreps('+obj.num+')"></li>'
			+ '</ul>';
		}
		temp.innerHTML = html;
		let repList = document.getElementsByClassName("rreps")[0];
		repList.innerHTML = '';
		repList.append(temp);
	}
	
	xhttp.open("GET","${pageContext.request.contextPath}/pharmarcy/pharmarcyRep/load.do?hpid=${PharmarcyVo.hpid}");
	xhttp.send();
}

function rreps(pnum){
	const xhttp = new XMLHttpRequest();
	let rrepList = document.getElementById("prep"+pnum);
	rrepList.innerHTML = '';
	
	// 새로 받은 댓글 넣기
	xhttp.onload = function(){
		let txt = xhttp.responseText;
		console.log(txt);
		let arr = JSON.parse(txt);
	
		let temp = document.createElement('div');
		let html ='';
		for(let obj of arr){
			html += '<ul class="reppMain">'
			+ '<li>'+obj.date+'</li>'
			+ '<li>'+obj.id+'</li>'
			+ '<li>'+obj.content+'</li>'
			+ '</ul>';
		}
			temp.innerHTML = html;
			rrepList.append(temp);
	}
	
	xhttp.open("GET","${pageContext.request.contextPath}/pharmarcy/pharmarcyRrep/load.do?pnum="+pnum);
	xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=UTF-8");
	xhttp.send();
}
	
function addRrep(pnum){
	const xhttp = new XMLHttpRequest();
	let newRrep = document.getElementById("rrep"+pnum).value;
	let rrepList = document.getElementById("prep"+pnum);
	rrepList.innerHTML = '';
	// 새로 받은 댓글 넣기
	xhttp.onload = function(){
		let txt = xhttp.responseText;
		console.log(txt);
		let arr = JSON.parse(txt);
	
		let temp = document.createElement('div');
		let html ='';
		for(let obj of arr){
			html += '<ul class="reppMain">'
			+ '<li>'+obj.date+'</li>'
			+ '<li>'+obj.id+'</li>'
			+ '<li>'+obj.content+'</li>'
			+ '</ul>';
		}
			temp.innerHTML = html;
			rrepList.append(temp);
	}
	
	xhttp.open("POST","${pageContext.request.contextPath}/pharmarcy/pharmarcyRrep/load.do");
	xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=UTF-8");
	xhttp.send("pnum="+pnum+"&newRrep="+newRrep);
	}
</script>
</head>
<body>
	<table border="1">
		<tr>
			<th>이름</th>
			<td>${PharmarcyVo.dutyName }</td>
			<td><span class="material-symbols-outlined" style="color: gray"
				onclick="change()"> stars </span></td>
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
					<td>${time }</td>
				</c:forEach>
			</tr>
		</c:forEach>

		<tr>
			<th>기관 id</th>
			<td>${PharmarcyVo.hpid }</td>
		</tr>
		<tr>
			<th>위도</th>
			<td>${PharmarcyVo.wgs84Lat }</td>
		</tr>
		<tr>
			<th>경도</th>
			<td>${PharmarcyVo.wgs84Lon }</td>
		</tr>

	</table>
	<div id="map" style="width: 500px; height: 400px;"></div>
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

	<table border="1">
		<tr>
			<td><c:if test="${empty sessionScope.loginId }">
					<input type="text" placeholder="로그인 후 댓글을 달 수 있습니다." readonly
						style="width: 200px">
				</c:if> <c:if test="${not empty sessionScope.loginId}">
					<form action="">
						<input type="text" name="rep" id="newRep" placeholder="댓글 작성">
						<input type="button" value="작성하기" onclick="addRep()">
					</form>
				</c:if></td>
		</tr>
	</table>
	<div id="repList">
		<ul class="repTitle">
			<li>작성일</li>
			<li>작성자</li>
			<li>내용</li>
		</ul>
		<ul class = "rreps">
		</ul>
	</div>
</body>
</html>