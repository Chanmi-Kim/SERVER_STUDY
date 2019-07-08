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
	var ctemp; //수정/삭제를 위해 클릭한 마커 객체를 담을 임시 변수
	
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
		
		
		//초기화 - 등록된 좌표들을 불러서 마커 객체로 출력
		<c:forEach items="${list}" var="dto" varStatus="status">
		
		var c${status.index}; //c0, c1, c2
		var iwContent${status.index};
		var infowindow${status.index};
		
		//마커 등록
		c${status.index} = new kakao.maps.Marker({
			position: new kakao.maps.LatLng(${dto.lat}, ${dto.lng})
		});
		c${status.index}.setMap(map);
		//c${status.index}.setDraggable(true);
		
		c${status.index}.name = "${dto.name}";
		c${status.index}.seq = "${dto.seq}";
		
		//자바스크립트의 아주 유용한 특징
		// - 객체에 사용자가 원하는만큼 마음대로 프로퍼티를 추가/삭제할 있다.
		//for (var prop in c${status.index}) {
		//	console.log(prop);
		//}
		//console.log("------------------");
		
		
		
		//마커 + 인포윈도우 등록
		iwContent${status.index} = "<div style='padding: 5px;'>${dto.name}</div>";
		infowindow${status.index} = new kakao.maps.InfoWindow({
			content: iwContent${status.index}
		});
		
		//짝짓기 - 정적
		//infowindow.open(map, c);
		kakao.maps.event.addListener(c${status.index}, "mouseover", function() {
			infowindow${status.index}.open(map, c${status.index});
		});
		
		kakao.maps.event.addListener(c${status.index}, "mouseout", function() {
			infowindow${status.index}.close();
		});
		
		kakao.maps.event.addListener(c${status.index}, "click", function() {
			if (m != null) {
				m.setMap(null);
			}
			
			ctemp = this;
			
			//alert("click");
			//alert(this.name);
			$("#name").val(this.name);
			$("#addForm input[type='button']").val("수정하기");
			$("#addForm input[type='button']").attr("onclick", "edit();");
			$("#lat").val(this.getPosition().getLat());
			$("#lng").val(this.getPosition().getLng());
			$("#seq").val(this.seq);
			
			//삭제버튼 추가하기
			$("#addForm").append("<input type='button' value='삭제하기' class='btn btn-default' onclick='del();'>");
			
		});
		
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
	
	
	
	
	
	function edit() {
		//alert('edit');
		//return;
		
		//ajax 데이터 전송
		//1. lat=21&lng=34
		//2. { "lat": "21", "lng": "34" }
		//3. form 사용
		//alert($("#addForm").serialize()); //데이터 직렬화
		
		$.ajax({
			type: "GET",
			url: "/myhome/etc/mycoffeedata.do?mode=edit",
			data: $("#addForm").serialize(),
			dataType: "json",
			success: function(result) {
				if (result.result == 0) {
					alert("수정 실패;;");
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
	
	
	
	
	function del() {
		//alert('del');
		//return;
		
		
		$.ajax({
			type: "GET",
			url: "/myhome/etc/mycoffeedata.do?mode=del",
			data: $("#addForm").serialize(),
			dataType: "json",
			success: function(result) {
				if (result.result == 0) {
					alert("삭제 실패;;");
				} else {
					
					//삭제된 마커를 지도상에서 없애기
					if (ctemp != null) {
						ctemp.setMap(null);
					}
					
					//#addForm 내부를 다시 초기화하는 코드 작성
					
				}
			},
			error: function(a,b,c) {
				console.log(a,b,c);
			}
		});
		
		
		
	}
	
	
	
	function sel(lat, lng) {
		map.setLevel(1);
		map.panTo(new kakao.maps.LatLng(lat, lng));
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
			<input type="hidden" name="seq" id="seq">
		</form>
		
		
		<hr>
		
		<h3>Coffee Shop List</h3>
		
		<c:forEach items="${list}" var="dto">
			<div class="item label label-danger" style="padding: 5px 10px; cursor: pointer;" onclick="sel(${dto.lat}, ${dto.lng});">${dto.name}</div>
		</c:forEach>
		
	</div>
</body>
</html>










