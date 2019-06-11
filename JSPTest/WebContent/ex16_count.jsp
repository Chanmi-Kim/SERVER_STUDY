<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//현재 사용자가 이 페이지를 접속한 횟수 누적
//1. 일반적 : DB 사용
//2. 임시 : session, application 사용

if (session.getAttribute("count") == null) { //첫 접속
	session.setAttribute("count", 0);
}

//count = count + 1;
session.setAttribute("count", (int)session.getAttribute("count") + 1);//누적




if (application.getAttribute("count") == null) { //첫 접속
	application.setAttribute("count", 0);
}

//count = count + 1;
application.setAttribute("count", (int)application.getAttribute("count") + 1);//누적

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="inc/asset.jsp" %>
<style>

</style>
<script>

	$(function() {
		
	});
	
</script>
</head>
<body>
	<!-- ex16_count.jsp -->
	<div class="container">
		<h1>방문 횟수</h1>
		
		사용자 방문 횟수 : <%= session.getAttribute("count") %>
		<br>
		사용자 방문 횟수 : <%= application.getAttribute("count") %>
		
	</div>
</body>
</html>











