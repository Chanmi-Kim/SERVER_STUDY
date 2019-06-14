<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="../inc/asset.jsp" %>
<style>

</style>
<script>

	$(function() {
		
	});
	
</script>
</head>
<body>
	<!-- hello.jsp -->
	<div class="container">
		<h1>안녕하세요.</h1>
		
		<div>주소록 항목 갯수 : <%= request.getAttribute("cnt") %></div>
		<div>주소록 항목 갯수 : ${cnt}</div>
		
	</div>
</body>
</html>











