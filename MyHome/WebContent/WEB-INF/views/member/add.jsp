<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Home</title>
<%@ include file="/inc/asset.jsp" %>
<style>
	
	#tblAdd th {
		width: 150px;
	}
	
	#tblAdd td {
		width: 650px;
	}
	
</style>
<script>

	$(function() {
		
	});
	
</script>
</head>
<body>
	<!-- views > member > add.jsp -->
	<div id="main">
		<jsp:include page="/inc/header.jsp"></jsp:include>
		<section id="detail">
			
			<h2>Member</h2>
			
			<form method="POST" action="/myhome/member/addok.do" enctype="multipart/form-data">
				<table id="tblAdd" class="table table-bordered long">
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" id="name" class="form-control short" required></td>
					</tr>
					<tr>
						<th>별명</th>
						<td><input type="text" name="nick" id="nick" class="form-control short" required></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="id" id="id" class="form-control short" required></td>
					</tr>
					<tr>
						<th>암호</th>
						<td><input type="password" name="pw" id="pw" class="form-control short" required></td>
					</tr>
					<tr>
						<th>사진</th>
						<td><input type="file" name="pic" id="pic" class="form-control"></td>
					</tr>
				</table>
				<div class="btns long">
					<input type="submit" value="가입하기" class="btn btn-default">
					<input type="button" value="돌아가기" class="btn btn-default"
						onclick="location.href='/myhome/member/index.do';">
				</div>
			</form>
			
		</section>
	</div>
	
</body>
</html>











