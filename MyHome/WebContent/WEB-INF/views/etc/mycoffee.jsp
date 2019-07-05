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

	.container {
		position: relative;
		left: 0;
		top: 0;
	}
	
	#addForm {
		width: 160px;
		position: absolute;
		right: 0px;
		top: 80px;
	}
	
	#addForm label {
		margin-top: 10px;
	}
	
	#addForm #lat, #addForm #lng {
		background-color: white;
	}
	
</style>
<script>

	var map; //지도 객체
	var m; //현재 등록 중인 마커 객체
	
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
		
		
		//마커 등록 + 클릭 이벤트
		kakao.maps.event.addListener(map, "click", function(evt) {
			
			if (m != null) {
				m.setMap(null);
			}
			
			m = new kakao.maps.Marker({
				position: evt.latLng
			});
			
			m.setMap(map);
			
			
			//입력 폼 작성
			$("#lat").val(evt.latLng.getLat());
			$("#lng").val(evt.latLng.getLng());
			$("#name").focus();
			
			
		});//map.click
		
		
		//초기화
		var c;
		
		<c:forEach items="${list}" var="dto">
		c = new kakao.maps.Marker({
			position: new kakao.maps.LatLng(${dto.lat}, ${dto.lng})
		});
		c.setMap(map);
		</c:forEach>
		
	});//ready
	
	
	function add() {
		
		//ajax 데이터 전송
		//1. lat=21&lng=34
		//2. { "lat": "21", "lng": "34" }
		//3. form 사용
		//alert($("#addForm").serialize()); //데이터 직렬화
		
		$.ajax({
			type: "GET",
			url: "/myhome/etc/mycoffeedata.do",
			data: $("#addForm").serialize(),
			dataType: "json",
			success: function(result) {
				if (result.result == 0) {
					alert("등록 실패;;");
				} else {
					
					//등록하는데 사용한 마커를 없애지 말기
					m = null;
					
					//입력 폼 초기화
					$("#name, #lat, #lng").val("");
					
				}
			},
			error: function(a,b,c) {
				console.log(a,b,c);
			}
		});
		
		
		
	}
	
</script>
</head>
<body>
	<!-- mycoffee.jsp -->
	<div class="container" style="width: 1200px;">
		<h1>Coffee</h1>
		
		<div id="container" style="width: 1000px; height: 600px;"></div>
		
		<form id="addForm">
			<label>장소명 : </label>
			<input type="text" name="name" id="name" class="form-control" required autocomplete="off">
			<label>위도 : </label>
			<input type="text" name="lat" id="lat" class="form-control" required readonly>
			<label>경도 : </label>
			<input type="text" name="lng" id="lng" class="form-control" required readonly>
			<hr>
			<input type="button" value="등록하기" class="btn btn-default" onclick="add();">
		</form>
		
	</div>
</body>
</html>










