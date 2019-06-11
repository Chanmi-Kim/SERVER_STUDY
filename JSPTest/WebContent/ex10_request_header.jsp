<%@page import="java.util.Enumeration"%>
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
	<!-- ex10_request_header.jsp -->
	<div class="container">
		<h1>HTTP 요청 메시지 - 헤더 정보</h1>
		
		<table class="table table-borderd">
			<tr>
				<th>헤더명</th>
				<th>헤더값</th>
			</tr>
			<% 
				//request.getHeader("헤더명")
				Enumeration<String> e = request.getHeaderNames();
			
				while (e.hasMoreElements()) {
					String name = e.nextElement();
			%>
			<tr>
				<td><%= name %></td>
				<td><%= request.getHeader(name) %></td>
			</tr>
			<% } %>
		</table>
		
		<hr>
		
		<p>서버 도메인명 : <%= request.getServerName() %></p>
		<p>서버 포트번호 : <%= request.getServerPort() %></p>
		<p>요청 URL : <%= request.getRequestURL() %></p>
		<p>요청 쿼리 : <%= request.getQueryString() %></p>
		<p>클라이언트 호스트 : <%= request.getRemoteHost() %></p>
		<p>클라이언트 IP : <%= request.getRemoteAddr() %></p>
		<p>프로토콜 : <%= request.getProtocol() %></p>
		<p>요청 방식 : <%= request.getMethod() %></p>
		<p>컨텍스트 경로 : <%= request.getContextPath() %></p>
		
		
		http://localhost:8088/JSPTest/ex10_request_header.jsp?name=hong
		http://localhost:8088/jsp/ex10_request_header.jsp?name=hong
		WebContent > ex10.jsp
		WebContent > example > ex10.jsp
		<img src="images/catty01.png">
		<img src="/JSPTest/images/catty01.png">
		<img src="<%= request.getContextPath() %>/images/catty01.png">
		
		
		
	</div>
</body>
</html>











