<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	//1. 인증 티켓 제거
	session.removeAttribute("auth"); //로그아웃
	
	//session.invalidate();
	
	response.sendRedirect("index.jsp");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="../inc/asset.jsp" %>
<style>

</style>
<script>

	$(function() {
		
	});
	
</script>
</head>
<body>
	<!-- logout.jsp -->
	<div class="container">
		<h1></h1>
		
	</div>
</body>
</html>











