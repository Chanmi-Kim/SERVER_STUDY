<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta http-equiv="refresh" content="10;url=ex01.do"> -->
<title></title>
<%@ include file="/inc/asset.jsp" %>
<style>
	
	.item {
		margin: 10px;
		padding: 5px;
		text-align: right;
		padding-right: 10px;
		border-top-right-radius: 10px;
		border-bottom-right-radius: 10px;
		border-left: 7px solid #aaa;
	}
	
</style>
<script>

	$(function() {

		$("#item1").css("width", "${dto.cnt1 * 25}px");
		$("#item2").css("width", "${dto.cnt2 * 25}px");
		$("#item3").css("width", "${dto.cnt3 * 25}px");
		$("#item4").css("width", "${dto.cnt4 * 25}px");
		
		
		setTimeout(function() {
			//location.href = "ex01.do";
			location.reload();//F5
		}, 5000);
		
	});
	
</script>
</head>
<body>
	<!-- ex01.jsp -->
	<div class="container" style="width: 800px;">
		<h1>설문 조사</h1>
	
		<table id="tbl1" class="table table-bordered">
			<tr>
				<th style="width: 300px;">질문</th>
				<th>결과</th>
			</tr>
			<tr>
				<td>${dto.question}</td>
				<td>
					<div>1. ${dto.item1} (${dto.cnt1}표)</div>
					<div>2. ${dto.item2} (${dto.cnt2}표)</div>
					<div>3. ${dto.item3} (${dto.cnt3}표)</div>
					<div>4. ${dto.item4} (${dto.cnt4}표)</div>
				</td>
			</tr>
		</table>
		
		<hr>
		
		<h3>만족도 조사</h3>
		하고 싶은 말 : <input type="text" class="form-control">
		
		<hr>
		
		<h3>${dto.question}</h3>
		
		<div class="item bg-info" id="item1">${dto.item1} <span class="badge">${dto.cnt1}</span></div>
		<div class="item bg-success" id="item2">${dto.item2} <span class="badge">${dto.cnt2}</span></div>
		<div class="item bg-warning" id="item3">${dto.item3} <span class="badge">${dto.cnt3}</span></div>
		<div class="item bg-danger" id="item4">${dto.item4} <span class="badge">${dto.cnt4}</span></div>
		
	</div>
</body>
</html>











