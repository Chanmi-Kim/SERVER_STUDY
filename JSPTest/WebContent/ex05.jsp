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
	.item {
		border: 1px solid #ddd;
		border-radius: 3px;
		background-color: #eee;
		padding: 3px;
		width: 150px;
		margin: 5px;
		padding-left: 10px;
	}
</style>
<script>

	$(function() {
		
	});
	
</script>
</head>
<body>
	<!-- ex05.jsp -->
	<div class="container">
		<h1>구구단</h1>
		
		<% 
			for (int i=1; i<=9; i++) {
		%>
				<div class="item">5 x <%= i %> = <%= 5 * i %></div>
		<%
			}
		%>
		
		
		
	</div>
</body>
</html>











