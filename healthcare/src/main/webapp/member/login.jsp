<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
</style>

<script type="text/javascript">
	function a() {

		const xhttp = new XMLHttpRequest();
		xhttp.onload = function() {
			let tags = document.getElementsByTagName("input");
			let res = document.getElementById("res");
			let obj = xhttp.responseText;
			console.log(obj);
			let arr = JSON.parse(obj);
			if (arr.flag == "로그인 완료") {
				window.location.href = "${pageContext.request.contextPath}/index.jsp";
			} else {
				alert(arr.flag);
			}

		}
		let param = "?id=" + f.id.value + "&pwd=" + f.pwd.value;
		xhttp.open("get", "${pageContext.request.contextPath}/member/login.do" + param);
		xhttp.send();

	}
</script>
</head>
<body>


			<button type="button" class="btn btn-primary" data-bs-toggle="modal"
				data-bs-target="#myModal">로그인</button>

			<!-- The Modal -->
			<div class="modal" id="myModal">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">


						<!-- Modal body -->
						<div class="modal-body">
							<form
								action="${pageContext.request.contextPath }/member/login.do"
								name="f" method="post" class="was-validated">
								<div class="mb-3 mt-3">
									<label for="id" class="form-label"><b>아이디</b></label> <input
										type="text" class="form-control" id="id" placeholder="ID"
										name="id" required>
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">Please fill out this field.</div>
								</div>
								<div class="mb-3">
									<label for="pwd" class="form-label"><b>비밀번호</b></label> <input
										type="password" class="form-control" id="pwd"
										placeholder="Password" name="pwd" required>
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">Please fill out this field.</div>
								</div>
								<div style="text-align: center;">
									<input type="button" class="btn btn-primary" id="button"
										onclick="a()"
										style="background-color: RGB(58, 162, 201); border: 0px;"
										value="로그인">
								</div>
							</form>
						</div>


					</div>
				</div>
			</div>

	
</body>
</html>