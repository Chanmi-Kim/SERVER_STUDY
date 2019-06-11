<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//request.setCharacterEncoding("UTF-8"); //POST 방식으로 넘긴 한글 안깨짐
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
	<!-- ex19_two.jsp -->
	<div class="container">
		<h1>두번째 페이지</h1>
		
		<%= request.getAttribute("name") %>
		<br>
		<%= request.getAttribute("tel") %>
		<br>
		<%= request.getAttribute("address") %>
		<br>
		<%= request.getParameter("address") %>
		
	</div>
</body>
</html>











