<%@page import="com.test.jsp.Student"%>
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
	<!-- ex34_el_two.jsp -->
	<div class="container">
		<h1>B 페이지</h1>
		
		<h2>A페이지로부터 전달받은 s1 객체 출력</h2>
		
		<div>이름(나이) : <%= ((Student)request.getAttribute("s1")).getName() %></div>
		
		<hr>
		
		<div>이름(나이) : ${s1.name}(${s1.age})</div>
		<div>평균 점수 : ${(s1.kor + s1.eng + s1.math) / 3.0}</div>
		
	</div>
</body>
</html>











