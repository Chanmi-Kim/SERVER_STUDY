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
	<!-- views/mobile/ex05.jsp -->
	<div data-role="page" id="page1">
		<div data-role="header">
			<h1>jQuery Mobile Page</h1>
		</div>
		<div role="main" class="ui-content">
			<h2>첫번째 페이지</h2>
			
			<h3>기본 링크(fade)</h3>
			<a href="#page2" data-role="button">두번째 페이지로 이동하기</a>
			
			<h3>기본 링크(pop)</h3>
			<a href="#page2" data-transition="pop">두번째 페이지로 이동하기</a>
			
			<h3>기본 링크(flip)</h3>
			<a href="#page2" data-transition="flip">두번째 페이지로 이동하기</a>
			
			<h3>기본 링크(turn)</h3>
			<a href="#page2" data-transition="turn">두번째 페이지로 이동하기</a>
			
			<h3>기본 링크(flow)</h3>
			<a href="#page2" data-transition="flow">두번째 페이지로 이동하기</a>
			
			<h3>기본 링크(slide)</h3>
			<a href="#page2" data-transition="slide">두번째 페이지로 이동하기</a>
			
			<h3>기본 링크(slidefade)</h3>
			<a href="#page2" data-transition="slidefade">두번째 페이지로 이동하기</a>
			
			<h3>기본 링크(slideup)</h3>
			<a href="#page2" data-transition="slideup">두번째 페이지로 이동하기</a>
			
			<h3>기본 링크(slidedown)</h3>
			<a href="#page2" data-transition="slidedown">두번째 페이지로 이동하기</a>
			
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
			
			<a href="#page1">돌아가기</a>
			
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur tenetur vero eligendi repellendus ratione enim asperiores dolorem qui repudiandae dicta molestiae ea neque et consectetur nobis error ullam eveniet sunt!</p>
			<p>Nemo labore consequatur nisi voluptatum atque suscipit quisquam dolorum blanditiis mollitia dolore rem hic assumenda dignissimos quidem minima recusandae libero laboriosam eligendi corrupti quia dolor fuga maxime doloremque! Deserunt odio.</p>
			
		</div>
		<div data-role="footer">
			<h4>http://test.com</h4>
		</div>
	</div>
	
</body>
</html>














