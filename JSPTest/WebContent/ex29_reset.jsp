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
	<!-- ex29_reset.jsp -->
	<div class="container">
		<h1>세션 초기화</h1>
		<%
		
		//초기화
		//data, name, age
		//m1
		//session.removeAttribute("data");
		//session.removeAttribute("name");
		//session.removeAttribute("age");
		
		//m2
		session.invalidate();//초기화 clear() > 세션 객체 교체
		
		%>
		
		<a href="ex29_session.jsp">시작 페이지</a>
	</div>
</body>
</html>











