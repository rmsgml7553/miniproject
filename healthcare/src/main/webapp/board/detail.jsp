<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<script type="text/javascript">
window.onload = function(){
	let like = document.getElementById("like");
	const xhttp = new XMLHttpRequest();
	xhttp.open("get","${pageContext.request.contextPath}/board/like.do?num=${vo.num}");
	xhttp.send();
	
	xhttp.onload = function (){
		let txt = xhttp.responseText;
		console.log(txt);
		let obj = JSON.parse(txt);
		console.log(obj.tf);		
		if(obj.tf == 'Y'){
			like.style.color = 'red';
		} else if(obj.tf == 'N'){
			like.style.color = 'gray';
		}
	}
}
function change(){
	let like = document.getElementById("like");
	const xhttp = new XMLHttpRequest();
	
	
	console.log("like");
	console.log("${vo.num}");
	let param = "num=${vo.num}";
	xhttp.open("post","${pageContext.request.contextPath}/board/like.do");
	xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=UTF-8")
	xhttp.send(param);
	
	xhttp.onload = function(){
		
		let txt = xhttp.responseText;
		let obj = JSON.parse(txt);
		console.log(obj);
		let count = obj.count;
		if(obj.tf == 'Y'){
			like.style.color = 'red';
		} else if(obj.tf == 'N'){
			like.style.color = 'gray';
		}else if (obj.tf == 'NotLogin'){
			alert('로그인 후 이용 가능합니다.');
		}
		
		let like_cnt = document.getElementById("like_cnt");
		let cnt = obj.cnt;
		like_cnt.innerHTML = cnt;
	}

}
</script>


</head>
<body>
${sessionScope.loginId }

<h3>글작성 페이지</h3>
<a href="${pageContext.request.contextPath }/board/list.do">글목록으로 이동</a><br/>

<span class="material-symbols-outlined" id="like" style = "coloer:gray" onclick = "change()">
favorite
</span>
<span id = "like_cnt">${count}</span>

<form action="${pageContext.request.contextPath }/board/edit.do" method = "post">
<table border="1">
<input type="hidden" name="num" value="${vo.num }"> 
<c:if test = "${sessionScope.loginId == vo.id}">
	<tr><th>작성자</th><td><input type="text" name="id" value="${vo.id }" readonly ></td></tr>
	<tr><th>제목</th><td><input type="text" name="title" value="${vo.title }" readonly></td></tr>
	<tr><th>글내용</th><td><textarea rows="20" cols="30" name="content" >${vo.content }</textarea></td></tr>
</c:if>
<c:if test = "${sessionScope.loginId != vo.id}">
	<tr><th>작성자</th><td><input type="text" name="id" value="${vo.id }" readonly ></td></tr>
	<tr><th>제목</th><td><input type="text" name="title" value="${vo.title }" readonly></td></tr>
	<tr><th>글내용</th><td><textarea rows="20" cols="30" name="content" readonly>${vo.content }</textarea></td></tr>
</c:if>
<c:if test = "${sessionScope.loginId == vo.id}">
<tr><th>수정/삭제</th><td><input type="submit" value="수정">
<input type="submit" value="삭제" onclick = "javascript:location.href= '${pageContext.request.contextPath }/board/delete.do?num=${vo.num}'">
</td></tr>
</c:if>
</table>
</form>

<c:if test = "${not empty sessionScope.loginId }">
<form action = "${pageContext.request.contextPath }/board_rep/add.do?num=${vo.num}" method ="post">
<input type = "text" name = "content"><input type = "submit" value = "댓글 작성">
</form>
</c:if>

<c:forEach var = "vo" items ="${list }">
작성자 : ${vo.id } 내용 : ${vo.content } ${vo.date }
<c:if test = "${sessionScope.loginId == vo.id}">
<input type = "button" value = "삭제" onclick = "javascript:location.href = '${pageContext.request.contextPath}/board_rep/delete.do?num_d=${vo.num }&num=${vo.b_num }'">
</c:if>
<br/>
</c:forEach>
</body>
</html>






