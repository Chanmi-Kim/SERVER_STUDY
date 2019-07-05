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
		
		
		//맵 옵션 컨트롤
		var mapTypeControl = new kakao.maps.MapTypeControl();
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPLEFT);
		
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.LEFT);
		
		
		//지도 드래그 금지
		//map.setDraggable(false);
		
		//지도 확대/축소 금지
		//map.setZoomable(false);
		
		
		
		//버튼 클릭
		$("#btn1").click(function() {
			var seoulStation = new kakao.maps.LatLng(37.555174, 126.970512);
			map.setCenter(seoulStation);
			//map.panTo(seoulStation);
		});
		
		$("#btn2").click(function() {
			var yeoksamStation = new kakao.maps.LatLng(37.500089, 127.035660);
			map.setCenter(yeoksamStation);
			//map.panTo(yeoksamStation);
		});
		
		
		for (var i=0; i<list.length; i++) {
			$("#selPlace").append("<option value='" + i + "'>" + list[i].name + "</option>");
		}
		
		
		//장소 선택 > 그 위치로 지도 이동
		$("#selPlace").change(function() {
			var index = $(this).val();
			//alert(index);
			
			var lat = list[index].position.lat;
			var lng = list[index].position.lng;
			
			//카카오 맵에 적용하기
			var temp = new kakao.maps.LatLng(lat, lng);
			map.panTo(temp);
			
		});
		
		
		
		//레벨 : 1 ~ 14
		$("#btn3").click(function() {
			//확대: Zoom In
			//map.setLevel(1);
			map.setLevel(map.getLevel() - 1);
		});
		
		$("#btn4").click(function() {
			//축소: Zoom Out
			//map.setLevel(14);
			map.setLevel(map.getLevel() + 1);
		});
		
		
		
		
		$("#btn5").click(function() {
			
			//map.setDraggable(true/false);
			//alert(map.getDraggable());
			
			if (map.getDraggable()) {
				map.setDraggable(false);
			} else {
				map.setDraggable(true);
			}
			
		});
		
		
		
		$("#btn6").click(function() {
			document.title = map.getZoomable();
			
			if (map.getZoomable()) {
				map.setZoomable(false);
			} else {
				map.setZoomable(true);
			}
			
		});
		
		
	});//ready
	
</script>
</head>
<body>
	<!-- map02.jsp -->
	<div class="container">
		<h1>Map <small>자도 좌표 이동하기 + 레벨 바꾸기</small></h1>
		
		<div class="well">
		
			<input type="button" value="서울역으로 이동하기" id="btn1" class="btn btn-default">
			<input type="button" value="역삼역으로 이동하기" id="btn2" class="btn btn-default">
			<select id="selPlace" style="display:inline-block;width:200px;" class="form-control">
				<!-- <option value="0">역삼역</option> -->
			</select>
			
			<hr>
			
			<div class="btn-group" role="group">
			<input type="button" value="확대하기" id="btn3" class="btn btn-default">
			<input type="button" value="축소하기" id="btn4" class="btn btn-default">
			</div>
			
			
			<div class="btn-group" role="group">
			<input type="button" value="지도 드래그 제어하기" id="btn5" class="btn btn-default">
			<input type="button" value="지도 확대/축소 제어하기" id="btn6" class="btn btn-default">
			</div>
			
			
		</div>
		
		<div id="container" style="width: 1000px; height: 600px;"></div>
		
		
		
	</div>
</body>
</html>










