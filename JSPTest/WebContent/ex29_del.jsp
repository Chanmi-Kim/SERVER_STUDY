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
	<!-- ex29_del.jsp -->
	<div class="container">
		<h1>세션값 삭제하기</h1>
		<%
		//session.setAttribute
		//session.getAttribute
		session.removeAttribute("data");
		%>
		
		<a href="ex29_session.jsp">시작 페이지</a>
		
	</div>
</body>
</html>











