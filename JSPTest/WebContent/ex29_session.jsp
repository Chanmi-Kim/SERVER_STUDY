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
	<!-- ex29_session.jsp -->
	<div class="container">
		<h1>세션, Session</h1>
		
		<a href="ex29_set.jsp">세션값 저장하기</a><br><br>
		<a href="ex29_del.jsp">세션값 삭제하기</a><br><br>
		<a href="ex29_reset.jsp">세션 초기화하기</a><br><br>
		<a href="ex29_interval.jsp">세션 만료 시간 지정하기</a><br><br>
		
		<hr>
		
		<h2>세션 정보 확인</h2>
		
		<div>Session ID : <%= session.getId() %></div>
		<div>Session Creation Time : <%= session.getCreationTime() %></div>
		<div>Session Max Inactive Interval : <%= session.getMaxInactiveInterval() %></div>
		<div>Session isNew : <%= session.isNew() %></div>
		
		<% if (session.getAttribute("data") != null) { %>
		<div>session.data : <%= session.getAttribute("data") %></div>
		<% } else { %>
		<div>session.data : 비었음.</div>
		<% } %>
		
		<div>session.name : <%= session.getAttribute("name") %></div>
		<div>session.age : <%= session.getAttribute("age") %></div>
		
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>











