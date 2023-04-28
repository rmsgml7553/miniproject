<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.panel-heading{
font-weight: bold;
}
</style>
</head>
<body>
<div class="container">
  <h2>테스트 결과</h2>
  <p style="text-align: right;"><b>${sessionScope.now }</b></p>
  <div class="panel-group">
    <div class="panel panel-default">
      <div class="panel-heading">기초대사량</div>
      <div class="panel-body"><b>${sessionScope.bmr1 }</b> /Kcal</div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">활동대사량</div>
      <div class="panel-body"><b>${sessionScope.amr1}</b> /Kcal</div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">체질량지수</div>
      <div class="panel-body"><b>${sessionScope.bmi1}</b> kg/㎡<br> ${sessionScope.bmiRs }</div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">스트레스 측정결과</div>
      <div class="panel-body"><b>${stress }</b> / 100점<br>${stressRs }</div>
    </div>
  </div>
  <p style="text-align: center;"><button type="button" class="btn btn-default"  onclick="javascript:location.href='${pageContext.request.contextPath }/selfcheck/bmi.do'">다시검사</button></p>
</div>


</body>
</html>