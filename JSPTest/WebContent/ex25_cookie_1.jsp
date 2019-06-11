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

		$("#result").append("<div>" + getCookie("name") + "</div>");
		$("#result").append("<div>" + getCookie("age") + "</div>");
		$("#result").append("<div>" + getCookie("address") + "</div>");
		
	});
	
</script>
</head>
<body>
	<!-- ex25_cookie_1.jsp -->
	<div class="container">
		<h1>다른 페이지에서 만든 데이터를 확인하기</h1>
		<div id="result"></div>
		
	</div>
</body>
</html>











