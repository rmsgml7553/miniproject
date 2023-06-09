<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
	
</script>
<style type="text/css">
p{
margin-top: 20px;
}
</style>
</head>
<body>
	<div class="container">
<!-- 		<h2>자가 건강 검진</h2> -->
		<p>다음 항목을 입력해 주세요.</p>
		<form action="${pageContext.request.contextPath }/selfcheck/bmi.do"
			method="post">
			<div class="form-group">
				<label for="usr">키</label> <input type="number" class="form-control"
					id="usr" name="height" required>
			</div>
			<div class="form-group">
				<label for="usr">몸무게</label> <input type="number"
					class="form-control" id="usr" name="weight" required>
			</div>
			<div class="form-group">
				<label for="usr">나이</label> <input type="number"
					class="form-control" id="usr" name="age" value="${age }" readonly>
			</div>
			<div class="form-group">
				<c:if test="${gender eq 'm' }">
				
					<label for="usr">성별</label> <br><label class="radio-inline"> <input
						type="radio" name="gender" id="gender" checked value="m" onclick = "return(false);">남성
					</label> <label class="radio-inline"> <input type="radio"
						name="gender" id="gender" value="f"  onclick = "return(false);">여성
					</label>
					</c:if>
				<c:if test="${gender eq 'f' }">
					<label for="usr">성별</label> <br><label class="radio-inline"> <input
						type="radio" name="gender" id="gender" value="m" onclick = "return(false);">남성
					</label> <label class="radio-inline"> <input type="radio"
						name="gender" id="gender" checked value="f" onclick = "return(false);">여성
					</label>
				</c:if>
			</div>
			<div class="form-group">
			<label for="usr">운동강도</label><br>
				<label class="radio-inline"><input type="radio" name="exer" id="exer" value=1 >거의
						운동하지 않음</label>
				<label class="radio-inline"><input type="radio" name="exer" id="exer" value=2 >가벼운
						운동(주 1~3일)</label>
				<label class="radio-inline"><input type="radio" name="exer" id="exer" value=3 checked>보통 수준</label>
				<label class="radio-inline"><input type="radio" name="exer" id="exer" value=4 >적극적으로 운동(주 6~7일)</label>
				<label class="radio-inline"><input type="radio" name="exer" id="exer" value=5 >매우 적극적으로 운동(주
						6~7일)</label>
			</div>
			<div class="form-group">
			<button type="reset" class="btn btn-default">초기화</button>
			<button type="submit" class="btn btn-default">다음</button>
			</div>
		</form>
		</div>
</body>
</html>