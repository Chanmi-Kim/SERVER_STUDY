<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="s1" class="com.test.jsp.Student" scope="session"></jsp:useBean>
<jsp:setProperty property="name" name="s1" value="홍길동" />

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
	<!-- ex24_scope_one.jsp -->
	<div class="container">
		<h1>첫번째 페이지</h1>
		
		이름 : <jsp:getProperty property="name" name="s1"/>
		
		<jsp:forward page="ex24_scope_two.jsp"></jsp:forward>
		
	</div>
</body>
</html>
