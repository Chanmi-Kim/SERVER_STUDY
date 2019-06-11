<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
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
	<!-- ex16_count_1.jsp -->
	<div class="container">
		<h1>방문 횟수</h1>
		
		사용자 방문 횟수 : <%= session.getAttribute("count") %>
		<br>
		사용자 방문 횟수 : <%= application.getAttribute("count") %>
		
		
		
	</div>
</body>
</html>











