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

	$(function() {
		
	});
	
	var ajax;
	
	function test() {
		//총 참여 인원을 얻기 위해서 서버에게 요청하는 함수
		
		//Ajax 통신을 지원하는 자바스크립트 객체 > ajax 객체
		ajax = new XMLHttpRequest();
		
		//alert(ajax == null);
		if (ajax != null) {
			
			ajax.onreadystatechange = run;
			ajax.open("GET", "/AjaxTest/ex03data.do");
			ajax.send(); //35 - 비동기(***)
			
			//네트워크 통신
			//1. 동기 통신 - 대부분 웹, Ajax(X)
			//2. 비동기 통신 - Ajax
			
		} else {
			alert("접속한 브라우저가 XMLHttpRequest를 지원하지 않습니다.");
		}
			
	}
	
	function run() {
		//readyState : 1 -> 2 -> 3 -> 4
		//status : 200
		//alert("readyState : " + ajax.readyState + ", status : " + ajax.status);
		
		if (ajax.readyState == 4 && ajax.status == 200) {
			//alert(ajax.responseText);
			$("#cnt2").text(ajax.responseText);
		}
	}
	
</script>
</head>
<body>
	<!-- ex03.jsp -->
	<div class="container">
		<h1>전통적인 방식</h1>
		
		<input type="text">
		<hr>
		총 참여 인원 수 : <span id="cnt">${cnt}</span>명
		<br>
		<input type="button" value="확인하기" class="btn btn-default"
			onclick="location.href='/AjaxTest/ex03.do?data=1';"> 
		
		<hr>
		
		
		
		<h1>Ajax</h1>
		
		<input type="text">
		<hr>
		총 참여 인원 수 : <span id="cnt2"></span>명
		<br>
		<input type="button" value="확인하기" class="btn btn-default"
			onclick="test();"> 
		
		<hr>
		
	</div>
</body>
</html>



















