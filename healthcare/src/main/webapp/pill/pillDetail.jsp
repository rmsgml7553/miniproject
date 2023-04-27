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
<script>
function change(){
	let star = document.getElementsByClassName("material-symbols-outlined")[0];
	const xhttp = new XMLHttpRequest();
	console.log("change");
	xhttp.onload = function() {
		let txt = xhttp.responseText;
		console.log(txt);
		let obj = JSON.parse(txt);
		if(obj.tf == "Y"){
			star.style.color = "#ffcc00";
		}else if(obj.tf == "N"){
			star.style.color = "gray";
		}else if(obj.tf =="NotLogin"){
			alert("login 후 이용해주세요");
		}
	}
	xhttp.open("POST","${pageContext.request.contextPath}/pill/pillLike/load.do");
	xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=UTF-8")
	xhttp.send("itemSeq=${PillXMLVo.itemSeq}");
}

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
	xhttp.open("GET","${pageContext.request.contextPath}/pill/pillLike/load.do?itemSeq=${PillXMLVo.itemSeq}");
	xhttp.send();
}
</script>
</head>
<body>
	<table border="1">
		<tr>
			<th>회사명</th>
			<td>${PillXMLVo.entpName }
				<span class="material-symbols-outlined" style="color:gray" onclick="change()"> stars </span>
			</td>
		</tr>
		<tr>
			<th>제품명</th>
			<td>${PillXMLVo.itemName }</td>
		</tr>
		<tr>
			<th>효과</th>
			<td>${PillXMLVo.efcyQesitm }</td>
		</tr>
		<tr>
			<th>복용법</th>
			<td>${PillXMLVo.useMethodQesitm }</td>
		</tr>
		<tr>
			<th>주의사항 경고</th>
			<td>${PillXMLVo.atpnWarnQesitm }</td>
		</tr>
		<tr>
			<th>주의사항</th>
			<td>${PillXMLVo.atpnQesitm }</td>
		</tr>
		<tr>
			<th>상호 작용</th>
			<td>${PillXMLVo.intrcQesitm }</td>
		</tr>
		<tr>
			<th>부작용</th>
			<td>${PillXMLVo.seQesitm }</td>
		</tr>
		<tr>
			<th>보관법</th>
			<td>${PillXMLVo.depositMethodQesitm }</td>
		</tr>
		<tr>
			<th>이미지</th>
			<td><img src="${PillXMLVo.itemImage }" alt="약 사진"></td>
		</tr>
	</table>
</body>
</html>