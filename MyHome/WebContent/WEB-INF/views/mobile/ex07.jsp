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
	<!-- views/mobile/ex07.jsp -->
	<div data-role="page">
		<div data-role="header">
			<h1>jQuery Mobile Page</h1>
		</div>
		<div role="main" class="ui-content">
			
			<!--  
			Grid
			: 화면을 정해진 규칙에 따라 분할하는 기술(가로 분할)
			-->
			<h2>5 Column Grid</h2>
			<ul>
				<li>영역 전체 너비를 5개의 컬럼으로 분할해서 레이아웃 구성</li>
				<li>각 컬럼의 너비는 20% : 20% : 20% : 20% : 20%</li>
				<li>ui-grid-d : 부모 역할(5단 컬럼)</li>
				<li>ui-block-a : 자식 역할(각각 컬럼)</li>
			</ul>
			
			<div class="ui-grid-d">
				<div class="ui-block-a">A 영역</div>
				<div class="ui-block-b">B 영역</div>
				<div class="ui-block-c">C 영역</div>
				<div class="ui-block-d">D 영역</div>
				<div class="ui-block-e">E 영역</div>
			</div>
			
			
			
			<br><br><br><br><br>
			
			<h2>4 Column Grid</h2>
			<ul>
				<li>영역 전체 너비를 4개의 컬럼으로 분할해서 레이아웃 구성</li>
				<li>각 컬럼의 너비는 25% : 25% : 25% : 25%</li>
				<li>ui-grid-c : 부모 역할(4단 컬럼)</li>
				<li>ui-block-a : 자식 역할(각각 컬럼)</li>
			</ul>
			
			<div class="ui-grid-c">
				<div class="ui-block-a">A 영역</div>
				<div class="ui-block-b">B 영역</div>
				<div class="ui-block-c">C 영역</div>
				<div class="ui-block-d">D 영역</div>
			</div>
			
			
			
			<br><br><br><br><br>
			
			
			
			
			
			
			<h2>3 Column Grid</h2>
			<ul>
				<li>영역 전체 너비를 3개의 컬럼으로 분할해서 레이아웃 구성</li>
				<li>각 컬럼의 너비는 33% : 33% : 33%</li>
				<li>ui-grid-b : 부모 역할(3단 컬럼)</li>
				<li>ui-block-a : 자식 역할(각각 컬럼)</li>
			</ul>
			
			<div class="ui-grid-b">
				<div class="ui-block-a">좌측 영역</div>
				<div class="ui-block-b">중앙 영역</div>
				<div class="ui-block-c">우측 영역</div>
			</div>
			
			
			<br><br><br><br><br>
			
			
			
			
			
			<h2>2 Column Grid</h2>
			<ul>
				<li>영역 전체 너비를 2개의 컬럼으로 분할해서 레이아웃 구성</li>
				<li>각 컬럼의 너비는 50% : 50%</li>
				<li>ui-grid-a : 부모 역할(2단 컬럼)</li>
				<li>ui-block-a : 자식 역할(각각 컬럼)</li>
			</ul>
			
			<div class="ui-grid-a">
				<div class="ui-block-a" style="background-color:tomato;">좌측 영역</div>
				<div class="ui-block-b" style="background-color:gold;">우측 영역</div>
			</div>
			
			<br><br><br>
			
			<h3>약관</h3>
			<h4>약관에 동의합니까?</h4>
			
			<div class="ui-grid-a">
				<div class="ui-block-a"><input type="button" value="동의함" data-icon="check"></div>
				<div class="ui-block-b"><input type="button" value="동의안함" data-icon="delete"></div>
			</div>
			
			
			
			<br><br><br><br><br>
			
			<h2>1 Column Grid</h2>
			
			<div class="ui-grid-solo"><!-- Grid 제어 영영 -->
				<div class="ui-block-a">내용물 영역</div>
			</div>
			
		</div>
		<div data-role="footer">
			<h4>http://test.com</h4>
		</div>
	</div>
	
</body>
</html>














