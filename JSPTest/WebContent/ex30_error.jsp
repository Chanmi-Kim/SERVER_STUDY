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
	<!-- ex30_error.jsp -->
	<div class="container">
		<h1>일반 페이지</h1>
		<%
		
		//1.
		String name = null;
		%>
		<%-- <%= name.length() %> --%>
		
		<%
		//2.
		int[] nums = {10,20,30};
		%>
		<%= nums[5] %>
		
	</div>
</body>
</html>











