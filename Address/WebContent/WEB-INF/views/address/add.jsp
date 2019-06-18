<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록</title>
<link rel="stylesheet" href="/address/css/bootstrap.css">
<script src="/address/js/jquery-1.12.4.js"></script>
<script src="/address/js/bootstrap.js"></script>
<style>

</style>
<script>

	$(function() {
		
	});
	
</script>
</head>
<body>
	<!-- add.jsp -->
	<div class="container">
		
		<h1>주소록 <small>쓰기</small></h1>
		
		<table id="tbl1" class="table table-bordered table-striped">
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" class="form-control" style="width: 150px;"></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="number" name="age" class="form-control" min="0" max="140" style="width: 150px;"></td>
			</tr>
			<tr>
				<th>전화</th>
				<td>
					<select name="tel1" class="form-control" style="width: 150px; display: inline-block;">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="012">012</option>
					</select>
					-
					<input type="text" name="tel2" class="form-control" style="width: 150px;display: inline-block;">
					-
					<input type="text" name="tel3" class="form-control" style="width: 150px;display: inline-block;">
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<select name="gender" class="form-control" style="width: 150px;">
						<option value="m">남자</option>
						<option value="f">여자</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address" class="form-control"></td>
			</tr>
		</table>
		
		<div id="btns">
			<input type="button" value="돌아가기" class="btn btn-default">
			<input type="button" value="추가하기" class="btn btn-default">
		</div>
		
	</div>
</body>
</html>











