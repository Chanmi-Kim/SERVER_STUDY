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
	<!-- ex12_pageContext_two.jsp -->
	<div class="container">
		<h1>두번째 페이지</h1>
		
		<%= "두번째 페이지 : " + request.getAttribute("name") %>
		<br>
		<%-- <%= "num : " + num %> --%>
		<%= "num : " + request.getAttribute("num") %>
		
	</div>
</body>
</html>











