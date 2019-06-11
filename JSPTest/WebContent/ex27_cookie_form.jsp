<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="inc/asset.jsp"%>
<style>
</style>
<script>
	$(function() {
		
		//$("#id").focus();
		
		if (getCookie("id") != "") {
			//아이디 기억O
			$("#id").val(getCookie("id"));
			$("#pw").focus();
			$("#remember").attr("checked", true);
		} else {
			//아이디 기억X
			$("#id").focus();
		}

	});
</script>
</head>
<body>
	<!-- ex27_cookie_form.jsp -->
	<div class="container">
		<h1>로그인</h1>

		<form method="POST" action="ex27_cookie_ok.jsp">
			<table class="table table-bordered" style="width: 200px;">
				<tr>
					<td><input type="text" name="id" id="id" required placeholder="아이디" autocomplete="off" class="form-control" tabindex="1"></td>
					<td rowspan="2"><input type="submit" value="로그인" class="btn btn-info" style="height: 85px;" tabindex="3"></td>
				</tr>
				<tr>
					<td><input type="password" name="pw" id="pw" required placeholder="암호" class="form-control" tabindex="2"></td>
				</tr>
			</table>
			<input type="checkbox" name="remember" id="remember" value="y"> 아이디 기억하기
		</form>

	</div>
</body>
</html>











