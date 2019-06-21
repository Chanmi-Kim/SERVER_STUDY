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

	//자바스크립트 Object
	var obj1 = {
			name: "홍길동",
			age: 20,
			address: "서울시",
			hello: function(){
				
			}
	};
	
	//JSON -> 자바스크립트 Object
	var obj2 = {
			"name": "홍길동",
			"age": "20",
			"address": "서울시"
	};



	$(function() {
		
		$("#btn1").click(function() {
			
			$.ajax({
				type: "GET",
				url: "/AjaxTest/ex10data.do",
				data: "m=1",
				dataType: "json",
				success: function(result) {
					//result : JSON 형태로 수신
					
					//result.question
					//result["question"]
				
					$("#result1").text(result.question);
					
				}
			});
			
		});
		
		
		
		
		$("#btn2").click(function() {
			
			$.ajax({
				type: "GET",
				url: "/AjaxTest/ex10data.do",
				data: "m=2",
				dataType: "json",
				success: function(result) {
					$("#result2").html(
						result.seq + "<br>" +
						result.type + "<br>" +
						result.data + "<br>"
					);
				}
			});
			
		});
		
		
		
		$("#btn3").click(function() {
			
			$.ajax({
				type: "GET",
				url: "/AjaxTest/ex10data.do",
				data: "m=3",
				dataType: "json",
				success: function(result) {
					
					//result = JSON Object Array
					//alert(result.length);
					
					var temp = "";
					
					$(result).each(function(index, item) {
						//item -> <data> -> AnimalDTO -> record
						temp += "<p>";	
							temp += item.seq + "<br>";
							temp += item.type + "<br>";
							temp += item.data + "<br>";
							temp += item.regdate + "<br>";
						temp += "</p>";
						
					});
					
					$("#result3").html(temp);
					
				}
			});
			
		});
		
		
	});
	
</script>
</head>
<body>
	<!-- ex10.jsp -->
	<div class="container">
		<h1>Ajax JSON</h1>
		
		<h2>단일값(원자값)</h2>
		<input type="button" value="요청하기" id="btn1">
		<div id="result1"></div>
		
		<h2>단일값(레코드 1개 - DTO)</h2>
		<input type="button" value="요청하기" id="btn2">
		<div id="result2"></div>
		
		<h2>다중값(레코드 여래개)</h2>
		<input type="button" value="요청하기" id="btn3">
		<div id="result3"></div>
		
	</div>
</body>
</html>










