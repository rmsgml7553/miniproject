<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
th{
font-style: bold;

}

}
</style>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>

</head>
<body>
<form action="${pageContext.request.contextPath }/selfcheck/stress.do" method="post" name="f">
<div class="container">
  <h2>스트레스 테스트</h2>
  <p>해당하는 문항에 체크</p>                                                                                      
  <div class="table-responsive">          
  <table class="table table-hover">
    <thead>
      <tr>
        <th>번호</th>
        <th>문항</th>
        <th>전혀 없었다</th>
        <th>가끔 느겼다</th>
        <th>자주 느겼다</th>
        <th>항상 느꼈다</th>
      </tr>
    </thead>
    <tbody>
  <c:forEach var="vo" items="${list }">
<tr><td>${vo.arg1 }</td><td>${vo.arg2 }</td>
<td><input type="radio" name="${vo.arg1 }" value="0" checked></td>
<td><input type="radio" name="${vo.arg1 }" value="1"></td>
<td><input type="radio" name="${vo.arg1 }" value="2"></td>
<td><input type="radio" name="${vo.arg1 }" value="3"></td>
</tr>
</c:forEach>
    </tbody>
  </table>
<input type="hidden" name="linecnt" value="${ cnt}">

 <p style="text-align: right;"><button type="submit" class="btn btn-default" >결과보기</button></p>

  </div>
</div>

</body>
</html>