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

	$(function() {
		
	});
	
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
				<input type="button" value="돌아가기" class="control">
				<input type="submit" value="추가하기" class="control">
			</div>
			</form>
		</div>
	</div>
</body>
</html>












































