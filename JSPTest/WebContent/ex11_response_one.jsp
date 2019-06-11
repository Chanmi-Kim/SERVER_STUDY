<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//이 페이지에 접속하면 강제로 두번째 페이지로 이동하기
	//페이지 이동하는 수단
	//1. HTML
	// - <a>
	// - 사람이 직접 클릭
	//2. JavaScript
	// - location.href
	// - 프로그램 제어 가능
	//3. Servlet/JSP
	// - response.sendRedirect()
	// - 프로그램 제어 가능
	
	response.sendRedirect("ex11_response_two.jsp");
	
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
		
		//로그인 유무 검사?
		//location.href = "ex11_response_two.jsp";
		
	});
	
</script>
</head>
<body>
	<!-- ex11_response_one.jsp -->
	<div class="container">
		<h1>첫번째 페이지</h1>
		
	</div>
</body>
</html>

































