<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.jsp.Ex07" %>
<%!
	//선언부
	public int sum(int a, int b) {
	
		return a + b;
	}
%>
<%

	int a = 10;
	int b = 20;
	
	Ex07 ex07 = new Ex07();
	
	

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
	<!-- ex07_declaration.jsp -->
	<div class="container">
		<h1>선언문</h1>
		
		<p><%= a %> + <%= b %> = <%= sum(a, b) %></p>
		<p><%= a %> + <%= b %> = <%= ex07.sum(a, b) %></p>
		
	</div>
</body>
</html>











