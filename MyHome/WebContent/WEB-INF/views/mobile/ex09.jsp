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
	<!-- views/mobile/ex09.jsp -->
	<!--  
	Toolbar
	- header/footer 부분
	- 로고, 주메뉴, 보조메뉴, 검색창, 옵션 버튼 등..
	- 상주형, 스크롤반응형, 터치반응형 등..
	-->
	<div data-role="page">
	
		<!-- <div data-role="header">
			<h1>jQuery Mobile Page</h1>
		</div> -->
		
		<!-- <div data-role="header" data-position="fixed">
			<h1>jQuery Mobile Page</h1>
		</div> -->
		
		<!-- 상단 툴바에 버튼 넣기 -->
		<!-- <div data-role="header" data-position="fixed">
			<a href="#" data-icon="delete" data-iconpos="notext" class="ui-btn-right">Cancel</a>
			<h1>jQuery Mobile Page</h1>
			<a href="#" data-icon="check" data-iconpos="notext">Save</a>
		</div> -->
		
		<div data-role="header">
			<a href="#panel4" data-role="button" data-icon="gear" data-iconpos="notext"></a>
			<h1>jQuery Mobile Page</h1>
			<div data-role="navbar">
				<ul>
					<li><a href="#" data-icon="home">Home</a></li>
					<li><a href="#" data-icon="info">Info</a></li>
					<li><a href="#" data-icon="navigation">Map</a></li>
					<li><a href="#" data-icon="user">Reservation</a></li>
				</ul>
			</div>
		</div>
		
		<div role="main" class="ui-content">
			<h2>Content</h2>
			
			<a href="#panel1" data-role="button">패널(기본)</a>
			<a href="#panel2" data-role="button">패널(방향)</a>
			
			<div data-role="controlgroup">
				<a href="#panel3" data-role="button">패널(동작 - reveal)</a>
				<a href="#panel4" data-role="button">패널(동작 - overlay)</a>
				<a href="#panel5" data-role="button">패널(동작 - push)</a>
				<a href="#panel6" data-role="button">패널(동작 - 없음)</a>
			</div>
			
		</div>
		<div data-role="footer" data-position="fixed">
			<div data-role="navbar">
				<ul>
					<li><a href="#" data-icon="home">Home</a></li>
					<li><a href="#" data-icon="info">Info</a></li>
					<li><a href="#" data-icon="navigation">Map</a></li>
					<li><a href="#" data-icon="user">Reservation</a></li>
				</ul>
			</div>
		</div><!-- footer -->
		
		<!-- page의 자식 -->
		<div data-role="panel" id="panel6" data-animate="false">
			<h1>패널(기본)</h1>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis laboriosam officiis veritatis debitis pariatur autem hic omnis maxime optio assumenda rerum sed fuga aperiam mollitia quas nesciunt ex ullam atque.</p>
			<a href="#" data-role="button" data-icon="delete" data-rel="close">Close</a>
		</div>
		
		<div data-role="panel" id="panel3" data-display="reveal">
			<h1>패널(기본)</h1>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis laboriosam officiis veritatis debitis pariatur autem hic omnis maxime optio assumenda rerum sed fuga aperiam mollitia quas nesciunt ex ullam atque.</p>
			<a href="#" data-role="button" data-icon="delete" data-rel="close">Close</a>
		</div>
		
		<div data-role="panel" id="panel4" data-display="overlay">
			<h1>패널(기본)</h1>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis laboriosam officiis veritatis debitis pariatur autem hic omnis maxime optio assumenda rerum sed fuga aperiam mollitia quas nesciunt ex ullam atque.</p>
			<a href="#" data-role="button" data-icon="delete" data-rel="close">Close</a>
		</div>
		
		<div data-role="panel" id="panel5" data-display="push">
			<h1>패널(기본)</h1>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis laboriosam officiis veritatis debitis pariatur autem hic omnis maxime optio assumenda rerum sed fuga aperiam mollitia quas nesciunt ex ullam atque.</p>
			<a href="#" data-role="button" data-icon="delete" data-rel="close">Close</a>
		</div>
		<div data-role="panel" id="panel2" data-position="right">
			<h1>패널(기본)</h1>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis laboriosam officiis veritatis debitis pariatur autem hic omnis maxime optio assumenda rerum sed fuga aperiam mollitia quas nesciunt ex ullam atque.</p>
			<a href="#" data-role="button" data-icon="delete" data-rel="close">Close</a>
		</div>
		
		<div data-role="panel" id="panel1">
			<h1>패널(기본)</h1>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis laboriosam officiis veritatis debitis pariatur autem hic omnis maxime optio assumenda rerum sed fuga aperiam mollitia quas nesciunt ex ullam atque.</p>
			<a href="#" data-role="button" data-icon="delete" data-rel="close">Close</a>
		</div>
		
	</div><!-- page -->
	
</body>
</html>














