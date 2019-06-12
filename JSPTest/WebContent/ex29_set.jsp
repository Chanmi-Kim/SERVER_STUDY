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
	<!-- ex29_set.jsp -->
	<div class="container">
		<h1>세션값 저장하기</h1>
		<%
			session.setAttribute("data", 100);
			session.setAttribute("name", "홍길동");
			session.setAttribute("age", 20);
		%>
		
		<a href="ex29_session.jsp">시작 페이지</a>
		
	</div>
</body>
</html>











