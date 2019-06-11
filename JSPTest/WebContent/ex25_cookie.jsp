<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="inc/asset.jsp" %>

<style>

</style>
<script>

	/*
	
	쿠키, Cookie
	- 브라우저가 관리하는 데이터 저장소 중의 하나
	- 개인 데이터를 저장/관리하는 장소
	- 단순한 문자열을 저장하는 장소(텍스트 파일 - 자료형X)
	- 기본 4KB까지 저장
	- 주로, 식별자 & 숫자 등 저장 용도
	
	쿠키 특징
	- 사이트 전역 변수 역할(특정 페이지에 종속되지 않으며, 전달 과정 없이 모든 페이지에서 액세스 가능)
	- 세션과 유사
	
	쿠키의 종류(만료 시간)
	1. 메모리 쿠키
		- 현재 세션이 만료되면 같이 소멸
		- 브라우저가 켜있을 동안만 살아있는 고객카드
	2. 하드 쿠키
		- 물리적으로 클라이언트 보조 기억 장치에 저장
		- 만료 시간 지정
	
	*/

	$(function() {

		$("#btn1").click(function() {
			
			//쿠키에 데이터 쓰기
			//console.log("---");
			//console.log("cookie", document.cookie);
			//console.log("cookie", typeof document.cookie);
			//console.log("---");
			
			//document.cookie = "hong";
			//document.cookie = "홍길동,20,서울시 강남구 역삼동";
			//document.cookie = "name=홍길동&age=20&address=서울시";
			
			setCookie("name", "홍길동", 1);
			setCookie("age", 20);
			setCookie("address", "서울시 강남구");
			
		});
		
		$("#btn2").click(function() {
			
			//쿠키의 데이터 읽기
			//console.log(document.cookie);
			alert(getCookie("name"));
			alert(getCookie("age"));
			alert(getCookie("address"));
			
		});
		
	});
	
</script>
</head>
<body>
	<!-- ex25_cookie.jsp -->
	<div class="container">
		<h1>쿠키, Cookie</h1>
		
		<input type="button" value="쿠키에 데이터 저장하기" id="btn1">
		<input type="button" value="쿠키로부터 데이터 읽어오기" id="btn2">
		
	</div>
</body>
</html>











