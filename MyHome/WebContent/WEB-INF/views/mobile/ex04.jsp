<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>jQuery Mobile</title>
<link rel="stylesheet" href="/myhome/asset/css/jquery.mobile-1.4.5.css">
<script src="/myhome/asset/js/jquery-1.12.4.js"></script>
<script src="/myhome/asset/js/jquery.mobile-1.4.5.js"></script>
<style>

</style>
<script>

	$(function() {
		
	});
	
</script>
</head>
<body>
	<!-- views/mobile/ex04.jsp -->
	<div data-role="page" id="page1">
		<div data-role="header">
			<h1>jQuery Mobile Page</h1>
		</div>
		<div role="main" class="ui-content">
			<h2>첫번째 페이지</h2>
			
			<a href="#page2">두번째 페이지로 이동하기</a>
			
		</div>
		<div data-role="footer">
			<h4>http://test.com</h4>
		</div>
	</div>
	
	
	<div data-role="page" id="page2">
		<div data-role="header">
			<h1>jQuery Mobile Page</h1>
		</div>
		<div role="main" class="ui-content">
			<h2>두번째 페이지</h2>
			
			<a href="#page1">첫번째 페이지로 이동하기</a>
			
		</div>
		<div data-role="footer">
			<h4>http://test.com</h4>
		</div>
	</div>
	
</body>
</html>














