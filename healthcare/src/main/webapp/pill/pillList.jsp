<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<script>
	function a(num) {
		let modal = document.getElementsByClassName("modal-body")[0];
		
		let html = '<iframe src="${pageContext.request.contextPath }/pill/pillDetail/load.do?itemSeq='
				+num
				+'" title="iframe" width = "100%" height="600px" style="border:none; width=100%; height=400px;"> </iframe>';
  		modal.innerHTML = html;
	}
</script>
<style>
.modal {
	position:fixed;
	top : 0;
	left : 0;
	width:100%;
	height: 100vh;
	background-color:rgba(0,0,0,0.3);
}
</style>
</head>
<body>
	<div class = "container">
		<h2>약 리스트</h2>
		<div class ="table-responsive">
			<table class = "table table-hover">
				<thead>
					<tr>
						<th>업체명</th>
						<th>제품명</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list }">
						<tr>
							<td><button type="button" onclick="a('${vo.itemSeq}')" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#detail" style="background-color: rgb(248, 249, 250);color: RGB(58, 162, 201);font-weight: bold;border: 0px;">${vo.entpName }</button></td>
							<td>${vo.itemName }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

		<div class="modal" id="detail" style="background-color: rgba(245,245,220,0.9);" >
			<div class="modal-dialog modal-dialog-centered">
               <div class="modal-content">
				<!-- Modal Header -->
			      <div class="modal-header">
			        <h4 class="modal-title">약 세부 정보</h4>
			      </div>

                  <!-- Modal body -->
                  <div class="modal-body">
                     
                  </div>
                  
                  <!-- Modal footer -->
                  <div class="modal-footer">
			        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
			      </div>
               </div>
            </div>
         </div>
	

	
</body>
</html>