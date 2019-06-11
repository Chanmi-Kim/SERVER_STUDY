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
		$("#link2").click(function() {
			
			var name = $("#name").val();
			var age = $("#age").val();
			
			//$("#link2").attr("href", "ex08_process.jsp?name=" + name + "&age=" + age);
			
			location.href = "ex08_process.jsp?name=" + name + "&age=" + age;
			
		});
	});
	
</script>
</head>
<body>
	<!-- ex08_form.jsp -->
	<div class="container">
		<h1>회원 가입</h1>
		
		<form method="GET" action="ex08_process.jsp">
			<table class="table" style="width: 500px;">
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" id="name" class="form-control" required pattern="[가-힣]{2,5}"></td>
				</tr>
				<tr>
					<th>나이</th>
					<td><input type="number" name="age" id="age" class="form-control" min="10" max="80" required value="5"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<select name="gender" class="form-control">
							<option value="m">남자</option>
							<option value="f">여자</option>
						</select>
					</td>
				</tr>
				<tr>
					<th></th>
					<td></td>
				</tr>
			</table>
			
			<input type="submit" value="등록하기" class="btn btn-primary">
		</form>
		
		<hr>
		
		<a href="ex08_process.jsp?name=아무개&age=25">페이지 이동하기</a>
		<hr>
		<a href="#" id="link2">페이지 이동하기</a>
		
	</div>
</body>
</html>











