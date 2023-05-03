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
<meta charset="utf-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>


<style>
.material-symbols-outlined {
  font-variation-settings:
  'FILL' 1,
  'wght' 400,
  'GRAD' 0,
  'opsz' 48
}
ul {
	padding: 10px;
}

li {
	display: flex;
	padding: 10px;
}

</style>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script type="text/javascript">

// $(document).ready(function(){
// 	if("${sessionScope.loginId == vo.id}"){
// 		$("#content").attr("readonly",true);
// 	}
// }

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

<div class="container">
	<h1 style = "display:inline">${vo.title }</h1>
	
	<span class="material-symbols-outlined" style = "color:gray;padding-left:20px">person</span>${vo.id }
	<span class="material-symbols-outlined" id="like" style = "color:gray;padding-left:20px" onclick = "change()">favorite</span>
	<span id = "like_cnt">${count}</span>
	<span class="material-symbols-outlined" style = "color:gray;padding-left:20px">visibility</span>${vo.cnt }
	
	<div class="row">
		<div class="col">
			
					<div class = "table-responsive">
					<form action="${pageContext.request.contextPath }/board/edit.do" method = "post">	
<!-- 						<table class="table table-hover"> -->
							<input type="hidden" name="num" value="${vo.num }">
							<c:if test = "${sessionScope.loginId == vo.id}">
							
							<input type="button" class ="btn btn-danger btn-sm" value="삭제" onclick = "javascript:location.href= '${pageContext.request.contextPath }/board/delete.do?num=${vo.num}'" style="float: right;">
							<input type="submit" class = "btn btn-light btn-sm" value="수정" style="float: right; margin-right:10px">
							<table class="table ">
							
								<input type="hidden" name="id" value="${vo.id }" readonly ></td></tr>
								<input type="hidden" name="title" value="${vo.title }" readonly>
								<tr><td><textarea rows="20" cols="145" name="content" >${vo.content }</textarea></td></tr>
								
							</table>
						
							</c:if>
							<c:if test = "${sessionScope.loginId != vo.id}">
						
							<table class="table ">
								<input type="hidden" name="id" value="${vo.id }" readonly ></td></tr>
								<input type="hidden" name="title" value="${vo.title }" readonly>
								<tr><td style = "padding-bottom:300px">${vo.content }</td></tr>
						</table>
					
								
							</c:if>
							
<!-- 					</table> -->
					</form>
					</div>
				</div>
			</div>
					







<%-- <form action="${pageContext.request.contextPath }/board/edit.do" method = "post"> --%>
<!-- <table border="1"> -->
<%-- <input type="hidden" name="num" value="${vo.num }">  --%>
<%-- <c:if test = "${sessionScope.loginId == vo.id}"> --%>
<%-- 	<tr><th>작성자</th><td><input type="text" name="id" value="${vo.id }" readonly ></td></tr> --%>
<%-- 	<tr><th>제목</th><td><input type="text" name="title" value="${vo.title }" readonly></td></tr> --%>
<%-- 	<tr><th>글내용</th><td><textarea rows="20" cols="30" name="content" >${vo.content }</textarea></td></tr> --%>
<%-- </c:if> --%>
<%-- <c:if test = "${sessionScope.loginId != vo.id}"> --%>
<%-- 	<tr><th>작성자</th><td><input type="text" name="id" value="${vo.id }" readonly ></td></tr> --%>
<%-- 	<tr><th>제목</th><td><input type="text" name="title" value="${vo.title }" readonly></td></tr> --%>
<%-- 	<tr><th>글내용</th><td><textarea rows="20" cols="30" name="content" readonly>${vo.content }</textarea></td></tr> --%>
<%-- </c:if> --%>
<%-- <c:if test = "${sessionScope.loginId == vo.id}"> --%>
<!-- <tr><th>수정/삭제</th><td><input type="submit" value="수정"> -->
<%-- <input type="submit" value="삭제" onclick = "javascript:location.href= '${pageContext.request.contextPath }/board/delete.do?num=${vo.num}'"> --%>
<!-- </td></tr> -->
<%-- </c:if> --%>
<!-- </table> -->
<!-- </form> -->

<%-- <a href="${pageContext.request.contextPath }/board/list.do">글목록으로 이동</a><br/> --%>

<button type="button" class="btn btn-primary btn-sm" onclick = "javascrip:location.href='${pageContext.request.contextPath }/board/list.do'" style="float:right;background-color:#3AA2D2;border: 0px">목록</button><br/><br/>
	
	<div class = "container mt -3">
		
		<c:if test = "${ empty sessionScope.loginId }">
			<input type="text" class="form-control" placeholder="로그인 후 댓글을 달 수 있습니다." style="width: 90%;margin-bottom:20px" readonly>
		</c:if>
		<c:if test = "${not empty sessionScope.loginId }">
			<div class="form-group mb-3" >
				<form action = "${pageContext.request.contextPath }/board_rep/add.do?num=${vo.num}" method ="post">
		
				 <div class="input-group-append">
					<input type = "text" name = "content" class="form-control" style="width:90%;display:inline;margin-bottom:20px" >
					
						<input type = "submit" class="btn btn-light" style="float:right" value = "댓글 작성">
					</div>
		
				</form>
			</div>
		</c:if>
		
		<h5 style = "font-weight:bold"><span class="material-symbols-outlined" style = "margin-right:10px">chat</span>Comment</h5>
		<ul class = "list-group">
			<c:forEach var = "vo" items ="${list }">
				<li class="list-group-item d-flex justify-content-between">
					<div>	내용 : ${vo.content }</div>
						<div class = "d-flex">
							 작성자 : ${vo.id }, 날짜 : ${vo.date }
							<c:if test="${not empty sessionScope.loginId && sessionScope.loginId eq vo.id }">
								<input type = "button" value = "삭제" style = "margin-left:10px" onclick = "javascript:location.href = '${pageContext.request.contextPath}/board_rep/delete.do?num_d=${vo.num }&num=${vo.b_num }'">
							</c:if>
						</div>
				</li>
		
			</c:forEach>
		</ul>
	</div>
</div>
</body>
</html>






