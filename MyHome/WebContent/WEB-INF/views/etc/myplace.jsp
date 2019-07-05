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
		
		
		//지도 객체 클릭 > 마커 객체 생성 > 지도에 추가
		kakao.maps.event.addListener(map, "click", function(evt) {
			
			//클릭 좌표
			var lat = evt.latLng.getLat();		//위도
			var lng = evt.latLng.getLng();		//경도
			
			//마커 객체 생성
			var m = new kakao.maps.Marker({
				position: new kakao.maps.LatLng(lat, lng)
				//position: evt.latLng
			});
			
			//지도 연결
			m.setMap(map);
			
			
			
			//마커 위치 > 데이터베이스 추가
			$.ajax({
				type: "GET",
				url: "/myhome/etc/myplacedata.do",
				//data: "lat=" + lat + "&lng=" + lng, //lat=37.1234&lng=134.321
				data: {
					"lat": lat,
					"lng": lng
				},
				dataType: "json",
				success: function(result) {
					if (result.result == 0) {
						alert("마커 등록 실패;;");
						m.setMap(null);
					}
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
				
				
			});
			
			
		});//map.click
		
		
		//등록했던 좌표 불러오기 > 마커 표시
		var m;
		
		<c:forEach items="${list}" var="dto">
		m = new kakao.maps.Marker({ 
			position: new kakao.maps.LatLng(${dto.lat}, ${dto.lng})
		});
		m.setMap(map);
		</c:forEach>
		
		
	});//ready
	
</script>
</head>
<body>
	<!-- views > etc > myplace.jsp -->
	<div class="container">
		<h1>Map <small>좌표 입출력</small></h1>
		
		<div id="container" style="width: 1000px; height: 500px;"></div>
		
	</div>
</body>
</html>










