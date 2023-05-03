<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.14.6/dist/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<style>
/* 기본 css */
* {
	box-sizing: border-box;
}

body {
	background-color: rgb(0, 134, 248);
	width: 100%;
	font-family: SF Pro Text, Helvetica Neue, sans-serif;
}

/* body { */
/*   background-color: rgb(48, 154, 176); */
/*   width:100%; */
/*   font-family: SF Pro Text,Helvetica Neue,sans-serif; */

/*  } */
main {
	position: absolute;
	left: 50%;
	transform: translate(-50%);
}

.material-symbols-outlined {
	font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 48 width:
		 120px;
	height: 100px;
}

span {
	display: inline-block;
	width: 70px;
	height: 70px;
	margin: 6px;
	background-color: #f9f9f9;
}

main .first {
	display: flex;
}

div .card {
	border-radius: 25px;
	overflow: hidden;
	display: flex;
	position: relative;
	margin: 15px;
}

main .first .card:nth-child(1) {
	width: 315px;
	height: 315px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

main .first div{
	margin-left: 10px;
}

main .first div:nth-child(2){
	font-color: #1D1D1F;
	font-size: 17px;
	
}


main .first .card:nth-child(2) {
	width: 660px;
	height: 315px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	text-align: center;
}

main .first .card:nth-child(3) {
	width: 1005px;
	height: 345px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	text-align: center;
	background-color: black;
}

div.card.grow-on-hover.card4 {
	width: 1005px;
	height: 345px;
	top: 20px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	text-align: center;
}




.toolbar {
	width: 100%;
	heigth: 70px;
}

.material-symbols-outlined #main {
	width: 70px;
	heigth: 70px;
}

.grow-on-hover {
	display: inline-block;
	vertical-align: middle;
	-webkit-transition: perspective(1px) translateZ(0);
	tranform: perspective(1px) translateZ(0);
	box-shadow: 0 0 1px rgba(0, 0, 0, 0);
	-webkit-transition-duration: 0.3s;
	transition-duration: 0.3s;
	-webkit-transition-property: transform;
	transition-property: transform;
}

.grow-on-hover:hover, .grow-on-hover:focus, .grow-on-hover:active {
	-webkit-transform: scale(1.1);
	transform: scale(1.1);
}

#navbar {
	background-color: rgba(37, 38, 40, .21);
	opacity: 0.5;
}

.material-symbols-outlined {
	font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 48
}

.container>i {
	margin-top: 15px;
	color: gray;
	margin-left: 25%;
}


.container div{
	margin-bottom: 10px;
}



.container div:nth-child(2) {
	margin-top: 15px;
}

a {
	text-decoration: none;
	color: black;
}

.carousel-control-prev-icon {
	background-color: black;
	border-radius: 10px;
}

.carousel-control-next-icon {
	background-color: black;
	border-radius: 10px;
}


.carousel2 {
	height: 250px;
}

/* 즐겨찾기 */

 div.card-img-overlay {
 background-color: #F8F9FA;
 width: 280px;
 height: 310px; 
 }
 
 div.list {
 background-color: #E9ECEF;
 width: 250px;
 height: 166px;
 margin-top: 10px;
 border-radius: 8px;
 }
 
 p, h4 {
 margin: 0;
 padding: 0;
 }
 
 div.container.box.contrast {
 height: 345px;
 width: 1005px;
 
 }


/* 주변지도 (병원, 약국) css */
.info {
	position: relative;
	top: 5px;
	left: 5px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	font-size: 12px;
	padding: 5px;
	background: #fff;
	list-style: none;
	margin: 0;
}

.info:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .label {
	display: inline-block;
	width: 50px;
}

.number {
	font-weight: bold;
	color: #00a0e9;
}

.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}

#category {
	position: absolute;
	top: 10px;
	left: 10px;
	border-radius: 5px;
	border: 1px solid #909090;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
	background: #fff;
	overflow: hidden;
	z-index: 2;
}

#category li {
	float: left;
	list-style: none;
	width: 50px; px;
	border-right: 1px solid #acacac;
	padding: 6px 0;
	text-align: center;
	cursor: pointer;
}

#category li.on {
	background: #eee;
}

#category li:hover {
	background: #ffe6e6;
	border-left: 1px solid #acacac;
	margin-left: -1px;
}

#category li:last-child {
	margin-right: 0;
	border-right: 0;
}

#category li span {
	display: block;
	margin: 0 auto 3px;
	width: 27px;
	height: 28px;
}

#category li .category_bg {
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png)
		no-repeat;
}

#category li .pharmacy {
	background-position: -10px -72px;
}

#category li .hospital {
	background-position: -10px -72px;
}

#category li.on .category_bg {
	background-position-x: -46px;
}

.placeinfo_wrap {
	position: absolute;
	bottom: 28px;
	left: -150px;
	width: 300px;
}

.placeinfo {
	position: relative;
	width: 100%;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	padding-bottom: 10px;
	background: #fff;
}

.placeinfo:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.placeinfo_wrap .after {
	content: '';
	position: relative;
	margin-left: -12px;
	left: 50%;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.placeinfo a, .placeinfo a:hover, .placeinfo a:active {
	color: #fff;
	text-decoration: none;
}

.placeinfo a, .placeinfo span {
	display: block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.placeinfo span {
	margin: 5px 5px 0 5px;
	cursor: default;
	font-size: 13px;
}

.placeinfo .title {
	font-weight: bold;
	font-size: 14px;
	border-radius: 6px 6px 0 0;
	margin: -1px -1px 0 -1px;
	padding: 10px;
	color: #fff;
	background: #d95050;
	background: #d95050
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.placeinfo .tel {
	color: #0f7833;
}

.placeinfo .jibun {
	color: #999;
	font-size: 11px;
	margin-top: 0;
}
</style>

</head>
<body>
	<div>
		<!-- 	네비바 start-->
		<header class="">
			<nav class="navbar navbar-expand-sm" id="navbar">
				<div class="container-fluid">
					<a class="navbar-brand" href="#"> <img src="/img/logo.png">
					</a>
				</div>
			</nav>
		</header>
		<!-- 	네비바 end-->






		<!---------------------- 메인	 card-1 : 내 정보	start  ---------------------->
		<main>
			<div class="first">
				<div class="card grow-on-hover"
					onclick="javascript:location.href='${pageContext.request.contextPath }/member/myinfo.do'">
					<div class="container">
						<i class='fas fa-user-circle' style='font-size: 120px;'></i>
						<div style="font-size: 32px;font-weight: 400;">${sessionScope.loginId }</div>
						<div>${vo.mcode == 1 ? "일반":"관계자"}</div>
						<div>
							<a href="${pageContext.request.contextPath }/member/myinfo.do">내정보
								보기</a>
						</div>
					</div>
				</div>
				<!-- 메인	 card-1	end -->
















				<!---------------------- 메인	 card-2 :셀프체크 그래프 start ---------------------->
				<div class="card grow-on-hover">
					<div class="container">
						<div id="carouselExampleControls" class="carousel slide"
							data-ride="carousel">
							<div class="carousel-inner">
								<div class="carousel-item active">
									<canvas id="amr"></canvas>
								</div>
								<div class="carousel-item ">
									<canvas id="bmr"></canvas>
								</div>
								<div class="carousel-item">
									<canvas id="bmi"></canvas>
								</div>
								<div class="carousel-item">
									<canvas id="stress"></canvas>
								</div>
							</div>
							<a class="carousel-control-prev" href="#carouselExampleControls"
								role="button" data-slide="prev"> <span
								class="carousel-control-prev-icon" aria-hidden="false"></span>
								<span class="sr-only">Previous</span>
							</a> <a class="carousel-control-next" href="#carouselExampleControls"
								role="button" data-slide="next"> <span
								class="carousel-control-next-icon" aria-hidden="false"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>

					</div>
				</div>
			</div>
			<!-- 메인	 card-2	end-->

			<script type="text/javascript">
            var context = document
                .getElementById('amr')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'bar', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        //x 축
                        'avg','mine','danger','low'
                    ],
                    datasets: [
                        { //데이터
                            label: 'amr', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                                '1500',${amr},'2500','500'//x축 label에 대응되는 데이터 값
                            ],
                            backgroundColor: [
                                //색상
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgba(38, 159, 184, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 2 //경계선 굵기
                        }/* ,
                        {
                            label: 'test2',
                            fill: false,
                            data: [
                                8, 34, 12, 24
                            ],
                            borderColor: 'rgb(157, 109, 12)'
                        } */
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
        </script>
			<script type="text/javascript">
            var context = document
                .getElementById('bmr')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'bar', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        //x 축
                        'avg','mine','danger','low'
                    ],
                    datasets: [
                        { //데이터
                            label: 'bmr', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                                '1500',${bmr},'2500','500'//x축 label에 대응되는 데이터 값
                            ],
                            backgroundColor: [
                                //색상
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgba(38, 159, 184, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 2 //경계선 굵기
                        }/* ,
                        {
                            label: 'test2',
                            fill: false,
                            data: [
                                8, 34, 12, 24
                            ],
                            borderColor: 'rgb(157, 109, 12)'
                        } */
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
        </script>
			<script type="text/javascript">
            var context = document
                .getElementById('bmi')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'bar', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        //x 축
                        'avg','mine','danger','low'
                    ],
                    datasets: [
                        { //데이터
                            label: 'bmi', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                                '50',${bmi},'100','10'//x축 label에 대응되는 데이터 값
                            ],
                            backgroundColor: [
                                //색상
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgba(38, 159, 184, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 2 //경계선 굵기
                        }/* ,
                        {
                            label: 'test2',
                            fill: false,
                            data: [
                                8, 34, 12, 24
                            ],
                            borderColor: 'rgb(157, 109, 12)'
                        } */
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
        </script>
			<script type="text/javascript">
            var context = document
                .getElementById('stress')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'bar', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        //x 축
                        'avg','mine','danger','low'
                    ],
                    datasets: [
                        { //데이터
                            label: 'stress', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                                '50',${stress},'100','10'//x축 label에 대응되는 데이터 값
                            ],
                            backgroundColor: [
                                //색상
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgba(38, 159, 184, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 2 //경계선 굵기
                        }/* ,
                        {
                            label: 'test2',
                            fill: false,
                            data: [
                                8, 34, 12, 24
                            ],
                            borderColor: 'rgb(157, 109, 12)'
                        } */
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
        </script>
























			<!---------------------- 메인	 card-3	내주변검색 지도 : start ---------------------->

			<div class="card grow-on-hover">
				<div class="containe">
					<div class="map_wrap">
						<div id="map" style="width: 100%; height: 400px;"></div>
						<ul id="category">
							<li id="PM9" data-order="2"><span
								class="category_bg pharmacy"></span> 약국</li>
							<li id="HP8" data-order="5"><span
								class="category_bg hospital"></span> 병원</li>
						</ul>
					</div>
				</div>
			</div>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=49a26a707e1180839f672089c3c60e78&libraries=services"></script>
			<script>

	// 지도 생성 및 지도 중심을 주소에 맞추기
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.5666805, 126.9784147), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	var geocoder = new kakao.maps.services.Geocoder();
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${address}', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
// 	        var infowindow = new kakao.maps.InfoWindow({
// 	            content: '<div style="width:150px;text-align:center;padding:6px 0;">내 위치</div>'
// 	        });
// 	        infowindow.open(map, marker);
			
	        map.setCenter(coords);
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	     } 
	});

	
	
	// 카테고리별 위치 보기
	
	
	// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
	var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
	    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
	    markers = [], // 마커를 담을 배열입니다
	    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
	 
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(map); 

	// 지도에 idle 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'idle', searchPlaces);

	// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
	contentNode.className = 'placeinfo_wrap';

	// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
	// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
	addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
	addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

	// 커스텀 오버레이 컨텐츠를 설정합니다
	placeOverlay.setContent(contentNode);  

	// 각 카테고리에 클릭 이벤트를 등록합니다
	addCategoryClickEvent();

	// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
	function addEventHandle(target, type, callback) {
	    if (target.addEventListener) {
	        target.addEventListener(type, callback);
	    } else {
	        target.attachEvent('on' + type, callback);
	    }
	}

	// 카테고리 검색을 요청하는 함수입니다
	function searchPlaces() {
	    if (!currCategory) {
	        return;
	    }
	    
	    // 커스텀 오버레이를 숨깁니다 
	    placeOverlay.setMap(null);

	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true, radius:1000}); 
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {

	        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
	        displayPlaces(data);
	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

	    } else if (status === kakao.maps.services.Status.ERROR) {
	        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
	        
	    }
	}

	// 지도에 마커를 표출하는 함수입니다
	function displayPlaces(places) {

	    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
	    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
	    var order = document.getElementById(currCategory).getAttribute('data-order');

	    

	    for ( var i=0; i<places.length; i++ ) {

	            // 마커를 생성하고 지도에 표시합니다
	            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

	            // 마커와 검색결과 항목을 클릭 했을 때
	            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
	            (function(marker, place) {
	                kakao.maps.event.addListener(marker, 'click', function() {
	                    displayPlaceInfo(place);
	                });
	            })(marker, places[i]);
	    }
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, order) {
	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
	            spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });

	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

	    return marker;
	}

	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}

	// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
	function displayPlaceInfo (place) {
	    var content = '<div class="placeinfo">' +
	                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

	    if (place.road_address_name) {
	        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
	                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
	    }  else {
	        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
	    }                
	   
	    content += '    <span class="tel">' + place.phone + '</span>' + 
	                '</div>' + 
	                '<div class="after"></div>';

	    contentNode.innerHTML = content;
	    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
	    placeOverlay.setMap(map);  
	}


	// 각 카테고리에 클릭 이벤트를 등록합니다
	function addCategoryClickEvent() {
	    var category = document.getElementById('category'),
	        children = category.children;

	    for (var i=0; i<children.length; i++) {
	        children[i].onclick = onClickCategory;
	    }
	}

	// 카테고리를 클릭했을 때 호출되는 함수입니다
	function onClickCategory() {
	    var id = this.id,
	        className = this.className;

	    placeOverlay.setMap(null);

	    if (className === 'on') {
	        currCategory = '';
	        changeCategoryClass();
	        removeMarker();
	    } else {
	        currCategory = id;
	        changeCategoryClass(this);
	        searchPlaces();
	    }
	}

	// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
	function changeCategoryClass(el) {
	    var category = document.getElementById('category'),
	        children = category.children,
	        i;

	    for ( i=0; i<children.length; i++ ) {
	        children[i].className = '';
	    }

	    if (el) {
	        el.className = 'on';
	    } 
	} 
	
	
	
	
	
	
	// 원 그리기
	var drawingFlag = false; // 원이 그려지고 있는 상태를 가지고 있을 변수입니다
	var centerPosition; // 원의 중심좌표 입니다
	var drawingCircle; // 그려지고 있는 원을 표시할 원 객체입니다
	var drawingLine; // 그려지고 있는 원의 반지름을 표시할 선 객체입니다
	var drawingOverlay; // 그려지고 있는 원의 반경을 표시할 커스텀오버레이 입니다
	var drawingDot; // 그려지고 있는 원의 중심점을 표시할 커스텀오버레이 입니다

	var circles = []; // 클릭으로 그려진 원과 반경 정보를 표시하는 선과 커스텀오버레이를 가지고 있을 배열입니다

	// 지도에 클릭 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
		removeCircles();
	    // 클릭 이벤트가 발생했을 때 원을 그리고 있는 상태가 아니면 중심좌표를 클릭한 지점으로 설정합니다
	    if (!drawingFlag) {    
	        
	        // 상태를 그리고있는 상태로 변경합니다
	        drawingFlag = true; 
	        
	        // 원이 그려질 중심좌표를 클릭한 위치로 설정합니다 
	        centerPosition = mouseEvent.latLng; 

	        // 그려지고 있는 원의 반경을 표시할 선 객체를 생성합니다
	        if (!drawingLine) {
	            drawingLine = new kakao.maps.Polyline({
	                strokeWeight: 3, // 선의 두께입니다
	                strokeColor: '#00a0e9', // 선의 색깔입니다
	                strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
	                strokeStyle: 'solid' // 선의 스타일입니다
	            });    
	        }
	        
	        // 그려지고 있는 원을 표시할 원 객체를 생성합니다
	        if (!drawingCircle) {                    
	            drawingCircle = new kakao.maps.Circle({ 
	                strokeWeight: 1, // 선의 두께입니다
	                strokeColor: '#00a0e9', // 선의 색깔입니다
	                strokeOpacity: 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
	                strokeStyle: 'solid', // 선의 스타일입니다
	                fillColor: '#00a0e9', // 채우기 색깔입니다
	                fillOpacity: 0.2 // 채우기 불투명도입니다 
	            });     
	        }
	        
	        // 그려지고 있는 원의 반경 정보를 표시할 커스텀오버레이를 생성합니다
	        if (!drawingOverlay) {
	            drawingOverlay = new kakao.maps.CustomOverlay({
	                xAnchor: 0,
	                yAnchor: 0,
	                zIndex: 1
	            });              
	        }
	    }
	    });

	// 지도에 마우스무브 이벤트를 등록합니다
	// 원을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 원의 위치와 반경정보를 동적으로 보여주도록 합니다
	kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {
	        
	    // 마우스무브 이벤트가 발생했을 때 원을 그리고있는 상태이면
	    if (drawingFlag) {

	        // 마우스 커서의 현재 위치를 얻어옵니다 
	        var mousePosition = mouseEvent.latLng; 
	        
	        // 그려지고 있는 선을 표시할 좌표 배열입니다. 클릭한 중심좌표와 마우스커서의 위치로 설정합니다
	        var linePath = [centerPosition, mousePosition];     
	        
	        // 그려지고 있는 선을 표시할 선 객체에 좌표 배열을 설정합니다
	        drawingLine.setPath(linePath);
	        
	        // 원의 반지름을 선 객체를 이용해서 얻어옵니다 
	        var length = drawingLine.getLength();
	        
	        if(length > 0) {
	            
	            // 그려지고 있는 원의 중심좌표와 반지름입니다
	            var circleOptions = { 
	                center : centerPosition, 
	            radius: length,                 
	            };
	            
	            // 그려지고 있는 원의 옵션을 설정합니다
	            drawingCircle.setOptions(circleOptions); 
	                
	            // 반경 정보를 표시할 커스텀오버레이의 내용입니다
	            var radius = Math.round(drawingCircle.getRadius()),   
	            content = '<div class="info">반경 <span class="number">' + radius + '</span>m</div>';
	            
	            // 반경 정보를 표시할 커스텀 오버레이의 좌표를 마우스커서 위치로 설정합니다
	            drawingOverlay.setPosition(mousePosition);
	            
	            // 반경 정보를 표시할 커스텀 오버레이의 표시할 내용을 설정합니다
	            drawingOverlay.setContent(content);
	            
	            // 그려지고 있는 원을 지도에 표시합니다
	            drawingCircle.setMap(map); 
	            
	            // 그려지고 있는 선을 지도에 표시합니다
	            drawingLine.setMap(map);  
	            
	            // 그려지고 있는 원의 반경정보 커스텀 오버레이를 지도에 표시합니다
	            drawingOverlay.setMap(map);
	            
	        } else { 
	            
	            drawingCircle.setMap(null);
	            drawingLine.setMap(null);    
	            drawingOverlay.setMap(null);
	            
	        }
	    }     
	});     

	// 지도에 마우스 오른쪽 클릭이벤트를 등록합니다
	// 원을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면
	// 마우스 오른쪽 클릭한 위치를 기준으로 원과 원의 반경정보를 표시하는 선과 커스텀 오버레이를 표시하고 그리기를 종료합니다
	kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {

	    if (drawingFlag) {

	        // 마우스로 오른쪽 클릭한 위치입니다 
	        var rClickPosition = mouseEvent.latLng; 

	        // 원의 반경을 표시할 선 객체를 생성합니다
	        var polyline = new kakao.maps.Polyline({
	            path: [centerPosition, rClickPosition], // 선을 구성하는 좌표 배열입니다. 원의 중심좌표와 클릭한 위치로 설정합니다
	            strokeWeight: 3, // 선의 두께 입니다
	            strokeColor: '#00a0e9', // 선의 색깔입니다
	            strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
	            strokeStyle: 'solid' // 선의 스타일입니다
	        });
	        
	        // 원 객체를 생성합니다
	        var circle = new kakao.maps.Circle({ 
	            center : centerPosition, // 원의 중심좌표입니다
	            radius: polyline.getLength(), // 원의 반지름입니다 m 단위 이며 선 객체를 이용해서 얻어옵니다
	            strokeWeight: 1, // 선의 두께입니다
	            strokeColor: '#00a0e9', // 선의 색깔입니다
	            strokeOpacity: 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
	            strokeStyle: 'solid', // 선의 스타일입니다
	            fillColor: '#00a0e9', // 채우기 색깔입니다
	            fillOpacity: 0.2  // 채우기 불투명도입니다 
	        });
	        
	        var radius = Math.round(circle.getRadius()), // 원의 반경 정보를 얻어옵니다
	            content = getTimeHTML(radius); // 커스텀 오버레이에 표시할 반경 정보입니다

	        
	        // 반경정보를 표시할 커스텀 오버레이를 생성합니다
	        var radiusOverlay = new kakao.maps.CustomOverlay({
	            content: content, // 표시할 내용입니다
	            position: rClickPosition, // 표시할 위치입니다. 클릭한 위치로 설정합니다
	            xAnchor: 0,
	            yAnchor: 0,
	            zIndex: 1 
	        });  

	        // 원을 지도에 표시합니다
	        circle.setMap(map); 
	        
	        // 선을 지도에 표시합니다
	        polyline.setMap(map);
	        
	        // 반경 정보 커스텀 오버레이를 지도에 표시합니다
	        radiusOverlay.setMap(map);
	        
	        // 배열에 담을 객체입니다. 원, 선, 커스텀오버레이 객체를 가지고 있습니다
	        var radiusObj = {
	            'polyline' : polyline,
	            'circle' : circle,
	            'overlay' : radiusOverlay
	        };
	        
	        // 배열에 추가합니다
	        // 이 배열을 이용해서 "모두 지우기" 버튼을 클릭했을 때 지도에 그려진 원, 선, 커스텀오버레이들을 지웁니다
	        circles.push(radiusObj);   
	    
	        // 그리기 상태를 그리고 있지 않는 상태로 바꿉니다
	        drawingFlag = false;
	        
	        // 중심 좌표를 초기화 합니다  
	        centerPosition = null;
	        
	        // 그려지고 있는 원, 선, 커스텀오버레이를 지도에서 제거합니다
	        drawingCircle.setMap(null);
	        drawingLine.setMap(null);   
	        drawingOverlay.setMap(null);
	    }
	});    
	    
	// 지도에 표시되어 있는 모든 원과 반경정보를 표시하는 선, 커스텀 오버레이를 지도에서 제거합니다
	function removeCircles() {         
	    for (var i = 0; i < circles.length; i++) {
	        circles[i].circle.setMap(null);    
	        circles[i].polyline.setMap(null);
	        circles[i].overlay.setMap(null);
	    }         
	    circles = [];
	}

	// 마우스 우클릭 하여 원 그리기가 종료됐을 때 호출하여 
	// 그려진 원의 반경 정보와 반경에 대한 도보, 자전거 시간을 계산하여
	// HTML Content를 만들어 리턴하는 함수입니다
	function getTimeHTML(distance) {

	    // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
	    var walkkTime = distance / 67 | 0;
	    var walkHour = '', walkMin = '';

	    // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
	    if (walkkTime > 60) {
	        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
	    }
	    walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

	    // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
	    var bycicleTime = distance / 227 | 0;
	    var bycicleHour = '', bycicleMin = '';

	    // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
	    if (bycicleTime > 60) {
	        bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
	    }
	    bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

	    // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
	    var content = '<ul class="info">';
	    content += '    <li>';
	    content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
	    content += '    </li>';
	    content += '    <li>';
	    content += '        <span class="label">도보</span>' + walkHour + walkMin;
	    content += '    </li>';
	    content += '    <li>';
	    content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
	    content += '    </li>';
	    content += '</ul>'

	    return content;
	}
</script>
			<!-- 메인	 card-3	내주변검색 지도 : end -->



			<!-- 메인	 card-4	즐겨찾기(약국, 병원, 약) : start -->

			<div class="card grow-on-hover card4" style="margin-top: 10px;">
				<div class="container box contrast">
				  <div class="card" style="width:500px">
					  <div class="card-img-overlay">
					    <h4 class="card-title">pharmarcy</h4>
					    <p class="card-text">아이디</p>
					    <p class="card-text">count</p>
					    <p class="card-text">2</p>
					    <div class="list">
					    <p>list</p>
					    </div>
					  </div>
					</div>
				  <div class="card" style="width:500px">
					  <div class="card-img-overlay">
					    <h4 class="card-title">pill</h4>
					    <p class="card-text">아이디</p>
					    <p class="card-text">count</p>
					    <p class="card-text">2</p>
					    <div class="list">
					    <p>list</p>
					    </div>
					  </div>
					</div>
				  <div class="card" style="width:500px">
					  <div class="card-img-overlay">
					    <h4 class="card-title">clinic</h4>
					    <p class="card-text">아이디</p>
					    <p class="card-text">count</p>
					    <p class="card-text">2</p>
					    <div class="list">
					    <p>list</p>
					    </div>
					  </div>
					</div>
				</div>
			</div>
		</main>
		<!-- 메인	 card-4	즐겨찾기(약국, 병원, 약) : end -->
		<footer> </footer>



	</div>
</body>
</html>