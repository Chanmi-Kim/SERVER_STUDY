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
	<!-- index.jsp -->
	<div class="container">
		<h1>시작 페이지</h1>
		
		<% if (session.getAttribute("auth") == null) { %>
		<input type="button" value="로그인" class="btn btn-default"
			onclick="location.href='login.jsp';">
		<% } else { %>
		<input type="button" value="로그아웃" class="btn btn-default"
			onclick="location.href='logout.jsp';">
		
		<div class="well well-sm">
			<div>아이디 : <%= session.getAttribute("auth") %>(<%= session.getAttribute("name") %>)</div>
			<div>등급 : <%= (session.getAttribute("lv") != null && ((String)session.getAttribute("lv")).equals("1")) ? "일반회원" : "관리자" %></div>
		</div>	
		
		<% } %>
		
		<hr>
		
		
		<% if (session.getAttribute("auth") != null) { %>
		<input type="button" value="회원 전용 페이지" class="btn btn-primary"
			onclick="location.href='member.jsp';">
		<% } %>
		
		<hr>
		
		<% if (session.getAttribute("auth") != null) { %>
		<input type="button" value="회원 전용 페이지" class="btn btn-primary"
			onclick="location.href='member.jsp';">
		<% } else { %>
		<input type="button" value="회원 전용 페이지" class="btn btn-primary"
			onclick="alert('로그인 해야 볼 수 있습니다.');">
		<% } %>	
		
		<hr>
		
		<% if (session.getAttribute("auth") != null && session.getAttribute("lv").toString().equals("2")) { %>
		<input type="button" value="관리자 전용 페이지" class="btn btn-primary"
			onclick="location.href='admin.jsp';">
		<% } %>
		
	</div>
</body>
</html>











