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
	
	
	function idcheck1() {
		window.open("/AjaxTest/idcheck.do", "idcheck", "width=350 height=300");
	}
	
	function check() {
		//alert("아이디 중복검사를 하세요.");
		$("#btn1").attr("disabled", true);
	}
	
</script>
</head>
<body>
	<!-- ex04.jsp -->
	<div class="container">
		<h1>회원 가입</h1>
		
		<form method="POST" action="/AjaxTest/ex04ok.do">
		<table class="table table-bordered">
			<tr>
				<th>이름</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" id="id1" onblur="check();" readonly>
					<input type="button" value="아이디 중복검사"
						onclick="idcheck1();">
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" id="id2"></td>
			</tr>
			<tr>
				<th>암호</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th></th>
				<td></td>
			</tr>
		</table>
		<hr>
		<input type="submit" value="가입하기" id="btn1" disabled>
		</form>
	</div>
</body>
</html>










