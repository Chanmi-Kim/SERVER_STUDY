<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>Board</title>
<link rel="stylesheet" href="/myhome/asset/css/jquery.mobile-1.4.5.css">
<script src="/myhome/asset/js/jquery-1.12.4.js"></script>
<script src="/myhome/asset/js/jquery.mobile-1.4.5.js"></script>
<style>

</style>
<script>

	$(function() {
		
	});
	
	function view(seq) {
		//alert(seq);
		$.ajax({
			type: "GET",
			url: "/myhome/board/m",
			data: "mode=view&seq=" + seq,
			dataType: "json",
			success: function(result) {
				$("#view h3").text(result.subject);
				$("#view p").text(result.subject);
			},
			error: function(a,b,c) {
				console.log(a,b,c);
			}
		});
		
		location.href="m#view";
	}
	
	
</script>
</head>
<body>

	<div data-role="page" id="list">
		<div data-role="header">
			<h1>MyHome</h1>
		</div>
		<div role="main" class="ui-content">
			<h2>Board</h2>
			<ul data-role="listview" data-inset="true">
				<c:forEach items="${list}" var="dto">
			    <li><a href="#" onclick="view(${dto.seq});">${dto.subject}</a></li>
			    </c:forEach>
			</ul>
			
		</div>
		<div data-role="footer" data-position="fixed">
			<h4>&copy; Copyright 2019 test.com</h4>
		</div>
	</div>
	
	
	<div data-role="page" id="view">
		<div data-role="header">
			<h1>MyHome</h1>
		</div>
		<div role="main" class="ui-content">
			<h2>Board</h2>
			
			<div class="ui-body ui-body-a ui-corner-all">
				<h3></h3>
				<p></p>
			</div>
			
		</div>
		<div data-role="footer" data-position="fixed">
			<h4>&copy; Copyright 2019 test.com</h4>
		</div>
	</div>
	
</body>
</html>














