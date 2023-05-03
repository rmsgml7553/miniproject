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
/* �⺻ css */
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

/* ���ã�� */

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


/* �ֺ����� (����, �౹) css */
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
	font-family: 'Malgun Gothic', dotum, '����', sans-serif;
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
		<!-- 	�׺�� start-->
		<header class="">
			<nav class="navbar navbar-expand-sm" id="navbar">
				<div class="container-fluid">
					<a class="navbar-brand" href="#"> <img src="/img/logo.png">
					</a>
				</div>
			</nav>
		</header>
		<!-- 	�׺�� end-->






		<!---------------------- ����	 card-1 : �� ����	start  ---------------------->
		<main>
			<div class="first">
				<div class="card grow-on-hover"
					onclick="javascript:location.href='${pageContext.request.contextPath }/member/myinfo.do'">
					<div class="container">
						<i class='fas fa-user-circle' style='font-size: 120px;'></i>
						<div style="font-size: 32px;font-weight: 400;">${sessionScope.loginId }</div>
						<div>${vo.mcode == 1 ? "�Ϲ�":"������"}</div>
						<div>
							<a href="${pageContext.request.contextPath }/member/myinfo.do">������
								����</a>
						</div>
					</div>
				</div>
				<!-- ����	 card-1	end -->
















				<!---------------------- ����	 card-2 :����üũ �׷��� start ---------------------->
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
			<!-- ����	 card-2	end-->

			<script type="text/javascript">
            var context = document
                .getElementById('amr')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'bar', // ��Ʈ�� ����
                data: { // ��Ʈ�� �� ������
                    labels: [
                        //x ��
                        'avg','mine','danger','low'
                    ],
                    datasets: [
                        { //������
                            label: 'amr', //��Ʈ ����
                            fill: false, // line ������ ��, �� ������ ä����� ��ä�����
                            data: [
                                '1500',${amr},'2500','500'//x�� label�� �����Ǵ� ������ ��
                            ],
                            backgroundColor: [
                                //����
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                //��輱 ����
                                'rgba(38, 159, 184, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 2 //��輱 ����
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
                type: 'bar', // ��Ʈ�� ����
                data: { // ��Ʈ�� �� ������
                    labels: [
                        //x ��
                        'avg','mine','danger','low'
                    ],
                    datasets: [
                        { //������
                            label: 'bmr', //��Ʈ ����
                            fill: false, // line ������ ��, �� ������ ä����� ��ä�����
                            data: [
                                '1500',${bmr},'2500','500'//x�� label�� �����Ǵ� ������ ��
                            ],
                            backgroundColor: [
                                //����
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                //��輱 ����
                                'rgba(38, 159, 184, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 2 //��輱 ����
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
                type: 'bar', // ��Ʈ�� ����
                data: { // ��Ʈ�� �� ������
                    labels: [
                        //x ��
                        'avg','mine','danger','low'
                    ],
                    datasets: [
                        { //������
                            label: 'bmi', //��Ʈ ����
                            fill: false, // line ������ ��, �� ������ ä����� ��ä�����
                            data: [
                                '50',${bmi},'100','10'//x�� label�� �����Ǵ� ������ ��
                            ],
                            backgroundColor: [
                                //����
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                //��輱 ����
                                'rgba(38, 159, 184, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 2 //��輱 ����
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
                type: 'bar', // ��Ʈ�� ����
                data: { // ��Ʈ�� �� ������
                    labels: [
                        //x ��
                        'avg','mine','danger','low'
                    ],
                    datasets: [
                        { //������
                            label: 'stress', //��Ʈ ����
                            fill: false, // line ������ ��, �� ������ ä����� ��ä�����
                            data: [
                                '50',${stress},'100','10'//x�� label�� �����Ǵ� ������ ��
                            ],
                            backgroundColor: [
                                //����
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                //��輱 ����
                                'rgba(38, 159, 184, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 2 //��輱 ����
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
























			<!---------------------- ����	 card-3	���ֺ��˻� ���� : start ---------------------->

			<div class="card grow-on-hover">
				<div class="containe">
					<div class="map_wrap">
						<div id="map" style="width: 100%; height: 400px;"></div>
						<ul id="category">
							<li id="PM9" data-order="2"><span
								class="category_bg pharmacy"></span> �౹</li>
							<li id="HP8" data-order="5"><span
								class="category_bg hospital"></span> ����</li>
						</ul>
					</div>
				</div>
			</div>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=49a26a707e1180839f672089c3c60e78&libraries=services"></script>
			<script>

	// ���� ���� �� ���� �߽��� �ּҿ� ���߱�
	var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.5666805, 126.9784147), // ������ �߽���ǥ
	        level: 3 // ������ Ȯ�� ����
	    };  
	
	// ������ �����մϴ�    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	var geocoder = new kakao.maps.services.Geocoder();
	// �ּҷ� ��ǥ�� �˻��մϴ�
	geocoder.addressSearch('${address}', function(result, status) {
	
	    // ���������� �˻��� �Ϸ������ 
	     if (status === kakao.maps.services.Status.OK) {
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // ��������� ���� ��ġ�� ��Ŀ�� ǥ���մϴ�
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // ����������� ��ҿ� ���� ������ ǥ���մϴ�
// 	        var infowindow = new kakao.maps.InfoWindow({
// 	            content: '<div style="width:150px;text-align:center;padding:6px 0;">�� ��ġ</div>'
// 	        });
// 	        infowindow.open(map, marker);
			
	        map.setCenter(coords);
	        // ������ �߽��� ��������� ���� ��ġ�� �̵���ŵ�ϴ�
	     } 
	});

	
	
	// ī�װ��� ��ġ ����
	
	
	// ��Ŀ�� Ŭ������ �� �ش� ����� �������� ������ Ŀ���ҿ��������Դϴ�
	var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
	    contentNode = document.createElement('div'), // Ŀ���� ���������� ������ ������Ʈ �Դϴ� 
	    markers = [], // ��Ŀ�� ���� �迭�Դϴ�
	    currCategory = ''; // ���� ���õ� ī�װ��� ������ ���� �����Դϴ�
	 
	// ��� �˻� ��ü�� �����մϴ�
	var ps = new kakao.maps.services.Places(map); 

	// ������ idle �̺�Ʈ�� ����մϴ�
	kakao.maps.event.addListener(map, 'idle', searchPlaces);

	// Ŀ���� ���������� ������ ��忡 css class�� �߰��մϴ� 
	contentNode.className = 'placeinfo_wrap';

	// Ŀ���� ���������� ������ ��忡 mousedown, touchstart �̺�Ʈ�� �߻�������
	// ���� ��ü�� �̺�Ʈ�� ���޵��� �ʵ��� �̺�Ʈ �ڵ鷯�� kakao.maps.event.preventMap �޼ҵ带 ����մϴ� 
	addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
	addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

	// Ŀ���� �������� �������� �����մϴ�
	placeOverlay.setContent(contentNode);  

	// �� ī�װ��� Ŭ�� �̺�Ʈ�� ����մϴ�
	addCategoryClickEvent();

	// ������Ʈ�� �̺�Ʈ �ڵ鷯�� ����ϴ� �Լ��Դϴ�
	function addEventHandle(target, type, callback) {
	    if (target.addEventListener) {
	        target.addEventListener(type, callback);
	    } else {
	        target.attachEvent('on' + type, callback);
	    }
	}

	// ī�װ� �˻��� ��û�ϴ� �Լ��Դϴ�
	function searchPlaces() {
	    if (!currCategory) {
	        return;
	    }
	    
	    // Ŀ���� �������̸� ����ϴ� 
	    placeOverlay.setMap(null);

	    // ������ ǥ�õǰ� �ִ� ��Ŀ�� �����մϴ�
	    removeMarker();
	    
	    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true, radius:1000}); 
	}

	// ��Ұ˻��� �Ϸ���� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
	function placesSearchCB(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {

	        // ���������� �˻��� �Ϸ������ ������ ��Ŀ�� ǥ���մϴ�
	        displayPlaces(data);
	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	        // �˻������ ���°�� �ؾ��� ó���� �ִٸ� �̰��� �ۼ��� �ּ���

	    } else if (status === kakao.maps.services.Status.ERROR) {
	        // ������ ���� �˻������ ������ ���� ��� �ؾ��� ó���� �ִٸ� �̰��� �ۼ��� �ּ���
	        
	    }
	}

	// ������ ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
	function displayPlaces(places) {

	    // ���° ī�װ��� ���õǾ� �ִ��� ���ɴϴ�
	    // �� ������ ��������Ʈ �̹��������� ��ġ�� ����ϴµ� ���˴ϴ�
	    var order = document.getElementById(currCategory).getAttribute('data-order');

	    

	    for ( var i=0; i<places.length; i++ ) {

	            // ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
	            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

	            // ��Ŀ�� �˻���� �׸��� Ŭ�� ���� ��
	            // ��������� ǥ���ϵ��� Ŭ�� �̺�Ʈ�� ����մϴ�
	            (function(marker, place) {
	                kakao.maps.event.addListener(marker, 'click', function() {
	                    displayPlaceInfo(place);
	                });
	            })(marker, places[i]);
	    }
	}

	// ��Ŀ�� �����ϰ� ���� ���� ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
	function addMarker(position, order) {
	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // ��Ŀ �̹��� url, ��������Ʈ �̹����� ���ϴ�
	        imageSize = new kakao.maps.Size(27, 28),  // ��Ŀ �̹����� ũ��
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(72, 208), // ��������Ʈ �̹����� ũ��
	            spriteOrigin : new kakao.maps.Point(46, (order*36)), // ��������Ʈ �̹��� �� ����� ������ �»�� ��ǥ
	            offset: new kakao.maps.Point(11, 28) // ��Ŀ ��ǥ�� ��ġ��ų �̹��� �������� ��ǥ
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // ��Ŀ�� ��ġ
	            image: markerImage 
	        });

	    marker.setMap(map); // ���� ���� ��Ŀ�� ǥ���մϴ�
	    markers.push(marker);  // �迭�� ������ ��Ŀ�� �߰��մϴ�

	    return marker;
	}

	// ���� ���� ǥ�õǰ� �ִ� ��Ŀ�� ��� �����մϴ�
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}

	// Ŭ���� ��Ŀ�� ���� ��� �������� Ŀ���� �������̷� ǥ���ϴ� �Լ��Դϴ�
	function displayPlaceInfo (place) {
	    var content = '<div class="placeinfo">' +
	                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

	    if (place.road_address_name) {
	        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
	                    '  <span class="jibun" title="' + place.address_name + '">(���� : ' + place.address_name + ')</span>';
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


	// �� ī�װ��� Ŭ�� �̺�Ʈ�� ����մϴ�
	function addCategoryClickEvent() {
	    var category = document.getElementById('category'),
	        children = category.children;

	    for (var i=0; i<children.length; i++) {
	        children[i].onclick = onClickCategory;
	    }
	}

	// ī�װ��� Ŭ������ �� ȣ��Ǵ� �Լ��Դϴ�
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

	// Ŭ���� ī�װ����� Ŭ���� ��Ÿ���� �����ϴ� �Լ��Դϴ�
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
	
	
	
	
	
	
	// �� �׸���
	var drawingFlag = false; // ���� �׷����� �ִ� ���¸� ������ ���� �����Դϴ�
	var centerPosition; // ���� �߽���ǥ �Դϴ�
	var drawingCircle; // �׷����� �ִ� ���� ǥ���� �� ��ü�Դϴ�
	var drawingLine; // �׷����� �ִ� ���� �������� ǥ���� �� ��ü�Դϴ�
	var drawingOverlay; // �׷����� �ִ� ���� �ݰ��� ǥ���� Ŀ���ҿ������� �Դϴ�
	var drawingDot; // �׷����� �ִ� ���� �߽����� ǥ���� Ŀ���ҿ������� �Դϴ�

	var circles = []; // Ŭ������ �׷��� ���� �ݰ� ������ ǥ���ϴ� ���� Ŀ���ҿ������̸� ������ ���� �迭�Դϴ�

	// ������ Ŭ�� �̺�Ʈ�� ����մϴ�
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
		removeCircles();
	    // Ŭ�� �̺�Ʈ�� �߻����� �� ���� �׸��� �ִ� ���°� �ƴϸ� �߽���ǥ�� Ŭ���� �������� �����մϴ�
	    if (!drawingFlag) {    
	        
	        // ���¸� �׸����ִ� ���·� �����մϴ�
	        drawingFlag = true; 
	        
	        // ���� �׷��� �߽���ǥ�� Ŭ���� ��ġ�� �����մϴ� 
	        centerPosition = mouseEvent.latLng; 

	        // �׷����� �ִ� ���� �ݰ��� ǥ���� �� ��ü�� �����մϴ�
	        if (!drawingLine) {
	            drawingLine = new kakao.maps.Polyline({
	                strokeWeight: 3, // ���� �β��Դϴ�
	                strokeColor: '#00a0e9', // ���� �����Դϴ�
	                strokeOpacity: 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
	                strokeStyle: 'solid' // ���� ��Ÿ���Դϴ�
	            });    
	        }
	        
	        // �׷����� �ִ� ���� ǥ���� �� ��ü�� �����մϴ�
	        if (!drawingCircle) {                    
	            drawingCircle = new kakao.maps.Circle({ 
	                strokeWeight: 1, // ���� �β��Դϴ�
	                strokeColor: '#00a0e9', // ���� �����Դϴ�
	                strokeOpacity: 0.1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
	                strokeStyle: 'solid', // ���� ��Ÿ���Դϴ�
	                fillColor: '#00a0e9', // ä��� �����Դϴ�
	                fillOpacity: 0.2 // ä��� �������Դϴ� 
	            });     
	        }
	        
	        // �׷����� �ִ� ���� �ݰ� ������ ǥ���� Ŀ���ҿ������̸� �����մϴ�
	        if (!drawingOverlay) {
	            drawingOverlay = new kakao.maps.CustomOverlay({
	                xAnchor: 0,
	                yAnchor: 0,
	                zIndex: 1
	            });              
	        }
	    }
	    });

	// ������ ���콺���� �̺�Ʈ�� ����մϴ�
	// ���� �׸����ִ� ���¿��� ���콺���� �̺�Ʈ�� �߻��ϸ� �׷��� ���� ��ġ�� �ݰ������� �������� �����ֵ��� �մϴ�
	kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {
	        
	    // ���콺���� �̺�Ʈ�� �߻����� �� ���� �׸����ִ� �����̸�
	    if (drawingFlag) {

	        // ���콺 Ŀ���� ���� ��ġ�� ���ɴϴ� 
	        var mousePosition = mouseEvent.latLng; 
	        
	        // �׷����� �ִ� ���� ǥ���� ��ǥ �迭�Դϴ�. Ŭ���� �߽���ǥ�� ���콺Ŀ���� ��ġ�� �����մϴ�
	        var linePath = [centerPosition, mousePosition];     
	        
	        // �׷����� �ִ� ���� ǥ���� �� ��ü�� ��ǥ �迭�� �����մϴ�
	        drawingLine.setPath(linePath);
	        
	        // ���� �������� �� ��ü�� �̿��ؼ� ���ɴϴ� 
	        var length = drawingLine.getLength();
	        
	        if(length > 0) {
	            
	            // �׷����� �ִ� ���� �߽���ǥ�� �������Դϴ�
	            var circleOptions = { 
	                center : centerPosition, 
	            radius: length,                 
	            };
	            
	            // �׷����� �ִ� ���� �ɼ��� �����մϴ�
	            drawingCircle.setOptions(circleOptions); 
	                
	            // �ݰ� ������ ǥ���� Ŀ���ҿ��������� �����Դϴ�
	            var radius = Math.round(drawingCircle.getRadius()),   
	            content = '<div class="info">�ݰ� <span class="number">' + radius + '</span>m</div>';
	            
	            // �ݰ� ������ ǥ���� Ŀ���� ���������� ��ǥ�� ���콺Ŀ�� ��ġ�� �����մϴ�
	            drawingOverlay.setPosition(mousePosition);
	            
	            // �ݰ� ������ ǥ���� Ŀ���� ���������� ǥ���� ������ �����մϴ�
	            drawingOverlay.setContent(content);
	            
	            // �׷����� �ִ� ���� ������ ǥ���մϴ�
	            drawingCircle.setMap(map); 
	            
	            // �׷����� �ִ� ���� ������ ǥ���մϴ�
	            drawingLine.setMap(map);  
	            
	            // �׷����� �ִ� ���� �ݰ����� Ŀ���� �������̸� ������ ǥ���մϴ�
	            drawingOverlay.setMap(map);
	            
	        } else { 
	            
	            drawingCircle.setMap(null);
	            drawingLine.setMap(null);    
	            drawingOverlay.setMap(null);
	            
	        }
	    }     
	});     

	// ������ ���콺 ������ Ŭ���̺�Ʈ�� ����մϴ�
	// ���� �׸����ִ� ���¿��� ���콺 ������ Ŭ�� �̺�Ʈ�� �߻��ϸ�
	// ���콺 ������ Ŭ���� ��ġ�� �������� ���� ���� �ݰ������� ǥ���ϴ� ���� Ŀ���� �������̸� ǥ���ϰ� �׸��⸦ �����մϴ�
	kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {

	    if (drawingFlag) {

	        // ���콺�� ������ Ŭ���� ��ġ�Դϴ� 
	        var rClickPosition = mouseEvent.latLng; 

	        // ���� �ݰ��� ǥ���� �� ��ü�� �����մϴ�
	        var polyline = new kakao.maps.Polyline({
	            path: [centerPosition, rClickPosition], // ���� �����ϴ� ��ǥ �迭�Դϴ�. ���� �߽���ǥ�� Ŭ���� ��ġ�� �����մϴ�
	            strokeWeight: 3, // ���� �β� �Դϴ�
	            strokeColor: '#00a0e9', // ���� �����Դϴ�
	            strokeOpacity: 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
	            strokeStyle: 'solid' // ���� ��Ÿ���Դϴ�
	        });
	        
	        // �� ��ü�� �����մϴ�
	        var circle = new kakao.maps.Circle({ 
	            center : centerPosition, // ���� �߽���ǥ�Դϴ�
	            radius: polyline.getLength(), // ���� �������Դϴ� m ���� �̸� �� ��ü�� �̿��ؼ� ���ɴϴ�
	            strokeWeight: 1, // ���� �β��Դϴ�
	            strokeColor: '#00a0e9', // ���� �����Դϴ�
	            strokeOpacity: 0.1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
	            strokeStyle: 'solid', // ���� ��Ÿ���Դϴ�
	            fillColor: '#00a0e9', // ä��� �����Դϴ�
	            fillOpacity: 0.2  // ä��� �������Դϴ� 
	        });
	        
	        var radius = Math.round(circle.getRadius()), // ���� �ݰ� ������ ���ɴϴ�
	            content = getTimeHTML(radius); // Ŀ���� �������̿� ǥ���� �ݰ� �����Դϴ�

	        
	        // �ݰ������� ǥ���� Ŀ���� �������̸� �����մϴ�
	        var radiusOverlay = new kakao.maps.CustomOverlay({
	            content: content, // ǥ���� �����Դϴ�
	            position: rClickPosition, // ǥ���� ��ġ�Դϴ�. Ŭ���� ��ġ�� �����մϴ�
	            xAnchor: 0,
	            yAnchor: 0,
	            zIndex: 1 
	        });  

	        // ���� ������ ǥ���մϴ�
	        circle.setMap(map); 
	        
	        // ���� ������ ǥ���մϴ�
	        polyline.setMap(map);
	        
	        // �ݰ� ���� Ŀ���� �������̸� ������ ǥ���մϴ�
	        radiusOverlay.setMap(map);
	        
	        // �迭�� ���� ��ü�Դϴ�. ��, ��, Ŀ���ҿ������� ��ü�� ������ �ֽ��ϴ�
	        var radiusObj = {
	            'polyline' : polyline,
	            'circle' : circle,
	            'overlay' : radiusOverlay
	        };
	        
	        // �迭�� �߰��մϴ�
	        // �� �迭�� �̿��ؼ� "��� �����" ��ư�� Ŭ������ �� ������ �׷��� ��, ��, Ŀ���ҿ������̵��� ����ϴ�
	        circles.push(radiusObj);   
	    
	        // �׸��� ���¸� �׸��� ���� �ʴ� ���·� �ٲߴϴ�
	        drawingFlag = false;
	        
	        // �߽� ��ǥ�� �ʱ�ȭ �մϴ�  
	        centerPosition = null;
	        
	        // �׷����� �ִ� ��, ��, Ŀ���ҿ������̸� �������� �����մϴ�
	        drawingCircle.setMap(null);
	        drawingLine.setMap(null);   
	        drawingOverlay.setMap(null);
	    }
	});    
	    
	// ������ ǥ�õǾ� �ִ� ��� ���� �ݰ������� ǥ���ϴ� ��, Ŀ���� �������̸� �������� �����մϴ�
	function removeCircles() {         
	    for (var i = 0; i < circles.length; i++) {
	        circles[i].circle.setMap(null);    
	        circles[i].polyline.setMap(null);
	        circles[i].overlay.setMap(null);
	    }         
	    circles = [];
	}

	// ���콺 ��Ŭ�� �Ͽ� �� �׸��Ⱑ ������� �� ȣ���Ͽ� 
	// �׷��� ���� �ݰ� ������ �ݰ濡 ���� ����, ������ �ð��� ����Ͽ�
	// HTML Content�� ����� �����ϴ� �Լ��Դϴ�
	function getTimeHTML(distance) {

	    // ������ �ü��� ��� 4km/h �̰� ������ �м��� 67m/min�Դϴ�
	    var walkkTime = distance / 67 | 0;
	    var walkHour = '', walkMin = '';

	    // ����� ���� �ð��� 60�� ���� ũ�� �ð����� ǥ���մϴ�
	    if (walkkTime > 60) {
	        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>�ð� '
	    }
	    walkMin = '<span class="number">' + walkkTime % 60 + '</span>��'

	    // �������� ��� �ü��� 16km/h �̰� �̰��� �������� �������� �м��� 267m/min�Դϴ�
	    var bycicleTime = distance / 227 | 0;
	    var bycicleHour = '', bycicleMin = '';

	    // ����� ������ �ð��� 60�� ���� ũ�� �ð����� ǥ���մϴ�
	    if (bycicleTime > 60) {
	        bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>�ð� '
	    }
	    bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>��'

	    // �Ÿ��� ���� �ð�, ������ �ð��� ������ HTML Content�� ����� �����մϴ�
	    var content = '<ul class="info">';
	    content += '    <li>';
	    content += '        <span class="label">�ѰŸ�</span><span class="number">' + distance + '</span>m';
	    content += '    </li>';
	    content += '    <li>';
	    content += '        <span class="label">����</span>' + walkHour + walkMin;
	    content += '    </li>';
	    content += '    <li>';
	    content += '        <span class="label">������</span>' + bycicleHour + bycicleMin;
	    content += '    </li>';
	    content += '</ul>'

	    return content;
	}
</script>
			<!-- ����	 card-3	���ֺ��˻� ���� : end -->



			<!-- ����	 card-4	���ã��(�౹, ����, ��) : start -->

			<div class="card grow-on-hover card4" style="margin-top: 10px;">
				<div class="container box contrast">
				  <div class="card" style="width:500px">
					  <div class="card-img-overlay">
					    <h4 class="card-title">pharmarcy</h4>
					    <p class="card-text">���̵�</p>
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
					    <p class="card-text">���̵�</p>
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
					    <p class="card-text">���̵�</p>
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
		<!-- ����	 card-4	���ã��(�౹, ����, ��) : end -->
		<footer> </footer>



	</div>
</body>
</html>