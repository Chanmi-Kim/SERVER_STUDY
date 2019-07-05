<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/inc/asset.jsp" %>
<style>

</style>
<script>

	var map;
	
	$(function() {
		
		//지도를 출력할 컨테이너
		var container = $("#container")[0];
		
		//지도를 표기 설정
		var options = {
				center: new kakao.maps.LatLng(37.499345, 127.033280), //중심점
				level: 3 //확대 레벨
		};
		
		//지도 객체 생성
		map = new kakao.maps.Map(container, options);
		
	});
	
</script>
</head>
<body>
	<!-- map01.jsp -->
	<div class="container">
		<h1>Map <small>기본 지도</small></h1>
		
		<div id="container" style="width: 1000px; height: 600px;"></div>
		
	</div>
</body>
</html>










