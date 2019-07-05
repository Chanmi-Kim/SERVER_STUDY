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
		
		
		
		//지도의 한부분을 클릭
		//map.onclick = function(evt) {
		kakao.maps.event.addListener(map, "click", function(evt) { //DOM Style
		
			//이벤트 관련 정보
			//alert(evt.latLng); //좌표 객체
			//alert(evt.latLng.constructor);
			
			var msg = "클릭한 위치는 위도(" + evt.latLng.getLat()
							+ "), 경도(" + evt.latLng.getLng() + ") 입니다.";
			
			$("#result").text(msg);
			
			
			//동적으로 마커 등록하기
			var marker3 = new kakao.maps.Marker({
				position: new kakao.maps.LatLng(evt.latLng.getLat(), evt.latLng.getLng())
			});
			
			marker3.setMap(map);			
			
		});//클릭 이벤트
		
		
		
		//마커를 초기화하면서 등록하기
		var marker = new kakao.maps.Marker({
			//마커 위치	
			//position: map.getCenter()
			//position: new kakao.maps.LatLng(list[5].position.lat, list[5].position.lng)
		});
		
		//지도에 마커를 추가하기
		//marker.setMap(map);
		
		
		for (var i=0; i<list.length; i++) {
			var marker2 = new kakao.maps.Marker({
				position: new kakao.maps.LatLng(list[i].position.lat, list[i].position.lng)
			});
			marker2.setMap(map);
		}
		
		
		
		
		
	});//ready
	
</script>
</head>
<body>
	<!-- map03.jsp -->
	<div class="container">
		<h1>Map <small>클릭 이벤트 + 마커 표시</small></h1>
		
		<div id="result"></div>
		<hr>
		
		<div id="container" style="width: 1000px; height: 600px;"></div>
		
		
		
		
	</div>
</body>
</html>










