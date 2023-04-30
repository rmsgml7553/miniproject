<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif;}
.w3-sidebar {
  z-index: 3;
  width: 250px;
  top: 43px;
  bottom: 0;
  height: inherit;
}
</style>
</head>
<body>


<!-- Sidebar -->
<nav class="w3-sidebar w3-bar-block w3-collapse w3-large w3-theme-l5 w3-animate-left" id="mySidebar">
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-right w3-xlarge w3-padding-large w3-hover-black w3-hide-large" title="Close Menu">
    <i class="fa fa-remove"></i>
  </a>
  <h4 class="w3-bar-item"><b>my page</b></h4>
  <button class="w3-bar-item w3-button tablink w3-button w3-hover-black"onclick="openCity(event, 'a')">myinfo</button>
  <button class="w3-bar-item w3-button tablink w3-button w3-hover-black" onclick="openCity(event, 'b')">Paris</button>
  <button class="w3-bar-item w3-button tablink w3-button w3-hover-black" onclick="openCity(event, 'c')">Tokyo</button>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- Main content: shift it to the right by 250 pixels when the sidebar is visible -->
<div class="w3-main" style="margin-left:250px;margin-top:50px;">

      <div id="a" class="w3-container city" style="display:none">
      
			<h3>${m.id }의정보</h3>
			<div>${m.name }</div>
			<br />
			<div>${m.mCode }</div>
			<br />
			<div>${m.code }</div>
			<br />
			<div>${m.phone }</div>
			<br />
			<div>${m.gender }</div>
			<br />
			<div>${m.birth }</div>
			<br />
			<div>${m.address }</div>
			<br /> 
			<a href='${pageContext.request.contextPath}/member/getpwd.do?chk=수정'>수정</a>
			<a href='${pageContext.request.contextPath}/member/getpwd.do?chk=삭제'>탈퇴</a>
			<a href="${pageContext.request.contextPath }/index.jsp">home</a>

      </div>

      <div id="b" class="w3-container city" style="display:none">
      <h1 class="w3-text-teal">Paris</h1>
      </div>
   
      <div id="c" class="w3-container city" style="display:none">
      <h1 class="w3-text-teal">Tokyo</h1>
      </div>

  </div>



<script>
// Get the Sidebar
var mySidebar = document.getElementById("mySidebar");

// Get the DIV with overlay effect
var overlayBg = document.getElementById("myOverlay");

// Toggle between showing and hiding the sidebar, and add overlay effect
function w3_open() {
  if (mySidebar.style.display === 'block') {
    mySidebar.style.display = 'none';
    overlayBg.style.display = "none";
  } else {
    mySidebar.style.display = 'block';
    overlayBg.style.display = "block";
  }
}

// Close the sidebar with the close button
function w3_close() {
  mySidebar.style.display = "none";
  overlayBg.style.display = "none";
}
</script>

<script>
function openCity(evt, cityName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("city");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" w3-white", ""); 
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " w3-white";
}
</script>

	
</body>
</html>