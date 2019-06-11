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
	<!-- ex17_scope.jsp -->
	<div class="container">
		<h1>메인 페이지</h1>
		<%
		
		//1. 지역 변수
		int a = 10;
		
		//3. pageContext
		pageContext.setAttribute("c", 30);
		
		//4. request
		request.setAttribute("d", 40);
		
		%>
		<%!
		//2. 멤버 변수
		int b = 20;
		%>
		
		<h1>조각 페이지</h1>
		<%@ include file="inc/ex17_sub.jsp" %>
		
	</div>
</body>
</html>











