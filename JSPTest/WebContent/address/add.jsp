<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록</title>
<link rel="stylesheet" href="/JSPTest/address/css/main.css">
<style>
	#tbl1 { width: 400px; }
	#tbl1 th { width: 100px; }
	#tbl1 td { width: 300px; }
</style>
<script>

	window.onload = function() {
		
		//입력 폼 데이터 넣기
		add();
		
	}
	
	function add() {
		//임의의 주소록 데이터 생성 > 컨트롤 대입
		var name = document.getElementsByName("name")[0];
		var age = document.getElementsByName("age")[0];
		var gender = document.getElementsByName("gender")[0];
		var tel = document.getElementsByName("tel")[0];
		var address = document.getElementsByName("address")[0];
		
		var nameData = [ "홍길동", "아무개", "하하하", "호호호", "후후후" ];
		var genderData = [ "m", "f" ];
		var telData = [ "010-1234-5678", "010-4321-7654", "010-9845-0684" ];
		var addressData = [ "서울시 강남구 대치동", "서울시 강동구 둔촌동", "서울시 강서구 목동" ];
		
		name.value = nameData[parseInt(Math.random() * nameData.length)];
		age.value = parseInt(Math.random() * 40) + 20;
		gender.value = genderData[parseInt(Math.random() * genderData.length)];
		tel.value = telData[parseInt(Math.random() * telData.length)];
		address.value = addressData[parseInt(Math.random() * addressData.length)];
		
	}
	
</script>
</head>
<body>
	<!-- add.jsp -->
	<div class="main">
		<h1>주소록 <small>주소록 추가하기</small></h1>
		<div class="content">
		
			<form method="POST" action="addok.jsp">
			<table class="table" id="tbl1">
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" required class="control short"></td>
				</tr>
				<tr>
					<th>나이</th>
					<td><input type="text" name="age" required class="control short"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<select name="gender" class="control">
							<option value="m">남자</option>
							<option value="f">여자</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>전화</th>
					<td><input type="text" name="tel" required class="control medium"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address" required class="control long"></td>
				</tr>
			</table>
			<div class="btns">
				<input type="button" value="돌아가기" class="control"
					onclick="location.href='list.jsp';">
				<input type="submit" value="추가하기" class="control">
			</div>
			</form>
		</div>
	</div>
</body>
</html>












































