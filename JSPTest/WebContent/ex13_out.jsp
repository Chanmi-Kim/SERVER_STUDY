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
	<!-- ex13_out.jsp -->
	<div class="container">
		
		<% int dan = 2; %>
		
		<h1>구구단(2단) - 표현식 사용</h1>
		
		<% for (int i=1; i<=9; i++) { %>
		<div><%= dan %> x <%= i %> = <%= dan * i %></div>
		<% } %>
		
		<h1>구구단(2단) - out 객체 사용</h1>
		
		<%
		for (int i=1; i<=9; i++) {
			out.print(String.format("<div>%d x %d = %d</div>", dan, i, dan * i));
		}
		%>
		
		<% //out.clear(); //여태껏 작성했던 출력 페이지의 내용을 모두 지워라. 출력 버퍼를 비워라 %>
		<% //out.close(); //여태껏 작성했던 출력 페이지를 돌려주고 작업 중단해라. 이후의 출력 버퍼를 사용하지 않겠다. %>
		
		
		나머지 출력 내용
		
		<%
			int m = 10;
			System.out.println(m);
		%>
		
	</div>
</body>
</html>











