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
	<!-- views/mobile/ex06.jsp -->
	<div data-role="page" data-theme="a">
		<div data-role="header">
			<h1>jQuery Mobile Page</h1>
		</div>
		<div role="main" class="ui-content">
			
			<h2>버튼 그룹</h2>
			
			<h3>프로젝트에 참여하시겠습니까?</h3>
			
			<div data-role="controlgroup">
				<input type="button" data-icon="check" value="Yes">
				<input type="button" data-icon="delete" value="No">
				<input type="button" data-icon="back" value="Maybe">
			</div>
			<br><br><br>
			
			<h3>프로젝트에 참여하시겠습니까?</h3>
			
			<div data-role="controlgroup" data-type="horizontal">
				<input type="button" data-icon="check" value="Yes">
				<input type="button" data-icon="delete" value="No">
				<input type="button" data-icon="back" value="Maybe">
			</div>
			<br><br><br>
			
			
			
			<h3>프로젝트에 참여하시겠습니까?</h3>
			
			<div data-role="controlgroup" data-type="horizontal">
				<input type="button" data-icon="check" value="Yes" data-iconpos="top">
				<input type="button" data-icon="delete" value="No" data-iconpos="top">
				<input type="button" data-icon="back" value="Maybe" data-iconpos="top">
			</div>
			<br><br><br>
			
			
			
			
			<h3>프로젝트에 참여하시겠습니까?</h3>
			
			<div data-role="controlgroup" data-type="horizontal">
				<input type="button" data-icon="check" value="Yes" data-iconpos="notext">
				<input type="button" data-icon="delete" value="No" data-iconpos="notext">
				<input type="button" data-icon="back" value="Maybe" data-iconpos="notext">
			</div>
			<br><br><br>
			
			
			
			
			
			
			<br><br><br><br><br><br>
			
			<h2>버튼</h2>
			
			<a href="#">링크</a>
			
			<a href="#" class="ui-btn">링크 버튼</a><!-- 1. 페이지 이동용 -->
			<a href="#" data-role="button">링크 버튼</a><!-- 1. 페이지 이동용 -->
			
			<input type="button" value="진짜 버튼"><!-- 2. 이벤트 발생용 or 전송용 -->
			<button type="button">진짜 버튼</button><!-- 2. 이벤트 발생용 or 전송용 -->
			
			
			<h2>버튼 배치</h2>
			
			<a href="#" data-role="button">버튼</a>
			<input type="button" value="버튼">
			<a href="#" data-role="button" data-inline="true">버튼</a>
			<input type="button" value="버튼" data-inline="true">
			
			<h2>버튼 크기</h2>
			
			<a href="#" data-role="button">버튼</a>
			<input type="button" value="버튼">
			<a href="#" data-role="button" data-mini="true">버튼</a>
			<input type="button" value="버튼" data-mini="true">
			
			<h2>버튼 아이콘22</h2>
			<a href="#" data-role="button">버튼</a>
			<a href="#" data-role="button" data-icon="check" data-iconpos="right"  data-inline="true">버튼</a>
			<a href="#" data-role="button" data-icon="delete" data-iconpos="top"  data-inline="true">버튼</a>
			<a href="#" data-role="button" data-icon="back" data-iconpos="notext">버튼</a>
			
			
		</div>
		<div data-role="footer">
			<h4>http://test.com</h4>
		</div>
	</div>
	
</body>
</html>














