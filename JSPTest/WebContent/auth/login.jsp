<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="../inc/asset.jsp" %>
<style>

</style>
<script>

	$(function() {
		
	});
	
</script>
</head>
<body>
	<!-- login.jsp -->
	<div class="container">
		<h1>로그인</h1>
		
		<form method="POST" action="login_ok.jsp">
			<table class="table table-bordered" style="width: 250px;">
				<tr>
					<th style="width: 100px;">아이디</th>
					<td><input type="text" name="id" class="form-control"></td>
				</tr>
				<tr>
					<th>암호</th>
					<td><input type="password" name="pw" class="form-control"></td>
				</tr>
			</table>
			<input type="submit" value="로그인" class="btn btn-default">
		</form>
		
	</div>
</body>
</html>











