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

		/* $("#item1").css("width", "0px");
		$("#item2").css("width", "0px");
		$("#item3").css("width", "0px");
		$("#item4").css("width", "0px");
		 */
		
		/* 
		setTimeout(function() {
			//location.href = "ex01.do";
			location.reload();//F5
		}, 5000); 
		*/
		
	});
	
</script>
</head>
<body>
	<!-- ex02.jsp -->
	<div class="container" style="width: 800px;">
		<h1>설문 조사</h1>
	
		<table id="tbl1" class="table table-bordered">
			<tr>
				<th style="width: 300px;">질문</th>
				<th>결과</th>
			</tr>
			<tr>
				<td id="question1"></td>
				<td>
					<div>1. <span class="item1"></span> (<span class="cnt1"></span>표)</div>
					<div>2. <span class="item2"></span> (<span class="cnt2"></span>표)</div>
					<div>3. <span class="item3"></span> (<span class="cnt3"></span>표)</div>
					<div>4. <span class="item4"></span> (<span class="cnt4"></span>표)</div>
				</td>
			</tr>
		</table>
		
		<hr>
		
		<h3>만족도 조사</h3>
		하고 싶은 말 : <input type="text" class="form-control">
		
		<hr>
		
		<h3 id="question2"></h3>
		
		<div class="item bg-info" id="item1"><span class="item1"></span> <span class="badge cnt1"></span></div>
		<div class="item bg-success" id="item2"><span class="item2"></span> <span class="badge cnt2"></span></div>
		<div class="item bg-warning" id="item3"><span class="item3"></span> <span class="badge cnt3"></span></div>
		<div class="item bg-danger" id="item4"><span class="item4"></span> <span class="badge cnt4"></span></div>
		
		
		<!-- 주 업무 페이지에는 영향을 미치지 않으면서 계속 서버로부터 새로운 데이터를 가져온다.(줄 수 도 있다.) -->
		<iframe src="/AjaxTest/ex02data.do?data=100
		.0" style="display: none;"></iframe>
		
		
	</div>
</body>
</html>











