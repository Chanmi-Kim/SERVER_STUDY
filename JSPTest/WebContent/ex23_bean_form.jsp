<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="inc/asset.jsp" %>
<style>

</style>
<script>

	$(function() {
		
	});
	
</script>
</head>
<body>
	<!-- ex23_bean_form.jsp -->
	<div class="container">
		<h1>데이터 추가하기</h1>
		
		<form method="POST" action="ex23_bean_ok.jsp">
			<table class="table table-bordered">
				<tr>
					<th>이름</th>
					<td><input type="text" name="name2" class="form-control"></td>
				</tr>
				<tr>
					<th>나이</th>
					<td><input type="text" name="age" class="form-control"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="gender" value="m" checked> 남자
						<input type="radio" name="gender" value="f"> 여자
					</td>
				</tr>
				<tr>
					<th>전화</th>
					<td><input type="text" name="tel" class="form-control"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address" class="form-control"></td>
				</tr>
			</table>
			
			<hr>
			
			<input type="submit" value="추가하기"  class="btn btn-primary">
		</form>
		
	</div>
</body>
</html>
