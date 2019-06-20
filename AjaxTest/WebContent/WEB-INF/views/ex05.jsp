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
	body { margin-bottom: 300px; }
</style>
<script>

	$(function() {
		
		$("#btn1").click(function() {
			
			//Ajax 요청(XMLHttpRequest)
			var ajax = new XMLHttpRequest();
			
			ajax.onreadystatechange = function() {
				if (ajax.readyState == 4 && ajax.status == 200) {
					//서버로부터 올바른 데이터를 받아오는 순간
					$("#div1").text(ajax.responseText);
				}
			};
			
			//false : 동기 통신
			//true : 비동기 통신
			ajax.open("GET", "/AjaxTest/ex05data.do", true); //환경 설정. 액션(X)
			
			ajax.send();//위의 연결된 서버에게 데이터 요청 && 응답되는 순간 onreadystatechange 이벤트를 발생시킨다.
			
			
		});//btn1.click
		
		
		//1. 서버에게 데이터 가져오기
		$("#btn2").click(function() {
			
			var ajax = new XMLHttpRequest();
			
			ajax.onreadystatechange = function() {
				if (ajax.readyState == 4 && ajax.status == 200) {
					//받아온 데이터를 처리할 영역 - 마지막 작업
					$("#div2").text(ajax.responseText);
				}
			};
			
			ajax.open("GET", "/AjaxTest/ex05data.do");
			ajax.send();
			
		});	//btn2.click
		
		
		
		$("#btn3").click(function() {
			
			var ajax = new XMLHttpRequest();
			
			/* 
			ajax.onreadystatechange = function() {
				if (ajax.readyState == 4 && ajax.status = 200) {
					
				}
			}; 
			*/
			
			ajax.open("GET", "/AjaxTest/ex05data_3.do?data=" + $("#txt3").val());
			ajax.send();
			
		});//btn3.click
		
		
		
		
		$("#btn4").click(function() {
			
			//아라비안숫자 -> DB -> 한글 변환 반환
			var ajax = new XMLHttpRequest();
			
			ajax.onreadystatechange = function() {
				if (ajax.readyState == 4 && ajax.status == 200) {
					//데이터를 돌려받았을 때 호출되는 함수
					$("#div4").text(ajax.responseText);
				}
			};
			
			ajax.open("GET", "/AjaxTest/ex05data_4.do?num=" + $("#txt4").val());
			ajax.send();
			
		});
		
		
	});//ready
	
</script>
</head>
<body>
	<!-- ex05.jsp -->
	<div class="container">
		<h1>Ajax</h1>
		<ul>
			<li>비동기 자바스크립트 통신</li>
			<li>자바스크립트(소켓)을 사용해서 클라이언트(브라우저)와 서버간의 데이터를 주고 받는 기술 - 면접용</li>
			<li>웹 페이지를 주고 받는 행동과는 별도로 + 서버와 데이터를 주고 받을 수 있다.</li>
			<li>백그라운드에서 동작 - 눈에 안보임 > 페이지 깜빡임이 안 생김</li>
			<li>페이지 전체가 아닌 필요한 데이터만 교환하는 기술(*****) > 트래픽 감소 + 통신 속도 증가</li>
		</ul>
		
		<hr>
		
		<div id="div1"></div>
		<input type="button" value="서버로부터 데이터 가져오기(XMLHttpRequest)" id="btn1">
		<input type="text">
		
		<h2>Ajax 객체를 통해 서버와 통신할 때 발생하는 형태 3가지</h2>
		
		<input type="button" value="1. 서버로부터 데이터 가져오기(XMLHttpRequest)" id="btn2"> <div id="div2"></div>
		<hr>
		<input type="button" value="2. 서버에게 데이터 보내기(XMLHttpRequest)" id="btn3"> <input type="text" id="txt3">
		<hr>
		<input type="button" value="3. 서버에게 데이터 보내고, 데이터 가져오기(XMLHttpRequest)" id="btn4"> <div id="div4"></div> <input type="text" id="txt4">
		
	</div>
</body>
</html>










