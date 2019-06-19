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
		
		//현재 문서 : <iframe src="현재문서">
		//제목을 출력할 문서 : 현재 문서의 바깥쪽 문서(부모 문서)
		//바깥쪽 문서의 window 객체 : top
		//top.document.getElementById("question1").innerText = "${dto.question}";
		//top.document.getElementById("question2").innerText = "${dto.question}";
		
		$(top.document).find("#question1").text("${dto.question}");
		$(top.document).find("#question2").text("${dto.question}");
		
		$(top.document).find(".item1").text("${dto.item1}");
		$(top.document).find(".item2").text("${dto.item2}");
		$(top.document).find(".item3").text("${dto.item3}");
		$(top.document).find(".item4").text("${dto.item4}");
		
		$(top.document).find(".cnt1").text("${dto.cnt1}");
		$(top.document).find(".cnt2").text("${dto.cnt2}");
		$(top.document).find(".cnt3").text("${dto.cnt3}");
		$(top.document).find(".cnt4").text("${dto.cnt4}");

		$(top.document).find("#item1").css("width", "${dto.cnt1 * 25}px");
		$(top.document).find("#item2").css("width", "${dto.cnt2 * 25}px");
		$(top.document).find("#item3").css("width", "${dto.cnt3 * 25}px");
		$(top.document).find("#item4").css("width", "${dto.cnt4 * 25}px");
		
		//top.$()
		
		/* 
		window.test()
		window.jQuery()
		window.$()
		
		top.test()
		top.jQuery()
		top.$() 
		*/
		
		
		
		setTimeout(function() {
			location.reload();
		}, 5000);
		
	});
	
</script>
</head>
<body>
	<!-- ex02data.jsp -->
	<div class="container">
		<h1></h1>
		
		<input type="text">
		
	</div>
</body>
</html>










