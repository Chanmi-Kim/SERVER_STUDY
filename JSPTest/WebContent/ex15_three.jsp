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
	<!-- ex15_three.jsp -->
	<div class="container">
		<h1>세번째 페이지 - 결과</h1>
		
		<%-- <p>지역변수 a : <%= a %></p> --%>
		<%-- <p>멤버변수 b : <%= b %></p> --%>
		<p>pageContext c : <%= pageContext.getAttribute("c") %></p>
		<p>request d : <%= request.getAttribute("d") %></p>
		<p>session e : <%= session.getAttribute("e") %></p>
		<p>application f : <%= application.getAttribute("f") %></p>
		
	</div>
</body>
</html>











