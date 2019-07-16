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
	<!-- views/mobile/ex08.jsp -->
	<div data-role="page">
		<div data-role="header">
			<h1>jQuery Mobile Page</h1>
		</div>
		<div role="main" class="ui-content">
		
			
			<div class="ui-corner-all custom-corners">
				<div class="ui-bar ui-bar-a">
					<h2>jQuery Mobile</h2>
				</div>
				<div class="ui-body ui-body-a">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos enim magnam et unde deserunt nulla reiciendis iure placeat perspiciatis accusamus adipisci quaerat vero voluptate mollitia commodi dolorem reprehenderit accusantium nemo.</p>
				</div>
			</div>
			
			
			<br><br><br><br><br>
			
			<h2>Form Control</h2>
			
			<form>
				<ul data-role="listview" data-inset="true">
					<li data-role="fieldcontain">
						<label for="txtid">ID : </label>
						<input type="text" id="txtid">
					</li>
					<li data-role="fieldcontain">
						<label for="txtpw">PW : </label>
						<input type="password" id="txtpw">
					</li>
					<li data-role="fieldcontain">
						<input type="submit" value="Submit">
					</li>
					<li data-role="fieldcontain">
						<a href="tel:010-1234-5678" data-role="button" data-icon="phone">전화 걸기</a>
					</li>
				</ul>
			</form>
		
			<br><br><br><br><br><br>
		
			<h2>Form Control</h2>
			
			<form>
				<div data-role="fieldcontain">
					<label for="txtid">ID : </label>
					<input type="text" id="txtid">
				</div>
				<div data-role="fieldcontain">
					<label for="txtpw">PW : </label>
					<input type="password" id="txtpw">
				</div>
				<div data-role="filedcontain">
					<input type="submit" value="Submit">
				</div>
			</form>
			<br><br><br><br><br>
			
			
			<h2>Form Control</h2>
			
			<form>
				<div>
					<label for="txtid">ID : </label>
					<input type="text" id="txtid">
				</div>
				<div>
					<label for="txtpw">PW : </label>
					<input type="password" id="txtpw">
				</div>
			</form>
			
		</div>
		
	</div>
	
</body>
</html>














