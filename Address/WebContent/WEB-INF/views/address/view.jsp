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
	<!-- add.jsp > view.jsp -->
	<div class="container">
		
		<h1>주소록 <small>보기</small></h1>
		
		<table id="tbl1" class="table table-bordered table-striped">
			<tr>
				<td rowspan="3"><img src="/address/images/gender_m.png"></td>
				<th>번호</th>
				<td>5</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>홍길동</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>20세</td>
			</tr>
			<tr>
				<th>전화</th>
				<td colspan="2">010-1234-5678</td>
			</tr>
			<tr>
				<th>성별</th>
				<td colspan="2">남자</td>
			</tr>
			<tr>
				<th>주소</th>
				<td colspan="2">서울시 강남구 역삼동</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td colspan="2">2019-06-30 12:30:45</td>
			</tr>
		</table>
		
		<div id="btns">
			<input type="button" value="돌아가기" class="btn btn-default">
			<input type="button" value="수정하기" class="btn btn-default">
			<input type="button" value="삭제하기" class="btn btn-default">
		</div>
		
	</div>
</body>
</html>











