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
	<!-- ex20_include.jsp -->
	<div class="container">
		<h1>조각 페이지 불러오기</h1>
		
		<%@ include file="inc/ex20_sub.jsp" %>
		
		<hr>
		
		<jsp:include page="inc/ex20_sub.jsp"></jsp:include>
		
		
	</div>
</body>
</html>











