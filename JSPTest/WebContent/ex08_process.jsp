<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//한글 처리
	// - POST 방식으로 넘길때만 해당한다. //브라우저 + 인터넷 + 톰캣
	// - GET 방식으로 넘길 때는 안해도 된다. // 추가 설명
	//request.setCharacterEncoding("UTF-8");

	//내장 객체
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");

	//Oracle..

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
	<!-- ex08_process.jsp -->
	<div class="container">
		<h1>가입 결과</h1>
		
		<table class="table" style="width: 500px;">
			<tr>
				<td rowspan="2"><img src="images/gender_<%= gender %>.png"></td>
				<th>이름</th>
				<td><%= name %></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><%= age %></td>
			</tr>
		</table>
		
	</div>
</body>
</html>











