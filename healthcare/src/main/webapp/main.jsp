<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	
	${sessionScope.loginId }

	<div class = "logIn">
		<a href="${pageContext.request.contextPath }/member/login.jsp">logIn</a>
		<a href="${pageContext.request.contextPath }/member/join.jsp">join</a>
		<a href="${pageContext.request.contextPath }/member/getpwd.jsp">pwdget</a>
		<a href="${pageContext.request.contextPath }/member/logout.do">logout</a>
		<a href="${pageContext.request.contextPath }/member/out.do">del</a>
		<a href="${pageContext.request.contextPath }/member/ex.jsp">ex</a>
		<a href="${pageContext.request.contextPath }/member/likeboard.jsp">좋아요</a>
	</div>
	<div class = "pill&pharmarcy">
		<a href="${pageContext.request.contextPath }/pharmarcy/pharmarcyList/load.do">pharmarcyList</a>
		<a href="${pageContext.request.contextPath }/pill/pillList/load.do">pillList</a>
	</div>
	<div class = "clicnic">
		<a href="${pageContext.request.contextPath }/clinic/cliniclist.jsp">clicnicList</a>
	</div>
<!-- 	<div class = "logIn"> -->
<%-- 		<a href="${pageContext.request.contextPath }/member/login.do">logIn</a> --%>
<%-- 		<a href="${pageContext.request.contextPath }/member/join.do">join</a> --%>
<!-- 	</div> -->
<!-- 	<div class = "logIn"> -->
<%-- 		<a href="${pageContext.request.contextPath }/member/login.do">logIn</a> --%>
<%-- 		<a href="${pageContext.request.contextPath }/member/join.do">join</a> --%>
<!-- 	</div> -->
</body>
</html>