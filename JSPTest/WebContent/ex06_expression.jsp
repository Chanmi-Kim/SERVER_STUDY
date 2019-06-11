<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//지역 변수
	String name = "홍길동";
	int age = 20;
	String color = "tomato";
	String txt = "<input type='text'>";

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
		alert("<%= name %>");
	});
	
</script>
</head>
<body>
	<!-- ex06_expression.jsp -->
	<div class="container">
		<h1 style="color:<%= color %>;">표현식</h1>
		
		<p>이름 : <%= name %></p>
		<p>나이 : <%= age %></p>
		<p><%= txt %></p>
		
	</div>
</body>
</html>











