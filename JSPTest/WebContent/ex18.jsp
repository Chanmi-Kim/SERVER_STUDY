<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	//String gender = "남자";

%>
<%
	String name = "홍길동";
	int age = 20;
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
	<!-- ex18.jsp -->
	<div class="container">
		<h1>JSP 페이지</h1>
		
		<%
			age = age + 1;
		%>
		
		<div>이름 : <%= name %></div>
		<div>나이 : <%= age %></div>
		
		
	</div>
</body>
</html>











