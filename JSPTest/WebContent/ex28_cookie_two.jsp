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
	<!-- ex28_cookie_two.jsp -->
	<div class="container">
		<h1>쿠키 읽기</h1>
		<%
		//쿠키 읽기
		
		out.print(request.getCookies().length);
		
		Cookie[] cookies = request.getCookies();
		
		for (Cookie cookie : cookies) {
			out.print(String.format("<div>쿠키명 : %s</div>", cookie.getName()));
			out.print(String.format("<div>쿠키값 : %s</div>", cookie.getValue()));
			out.print(String.format("<div>만료시각 : %s</div>", cookie.getMaxAge()));
			out.print("<hr>");
		}
		
		//어제 자바스크립트로 저장한 theme값??
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("theme")) {
				out.print("저장된 테마 : " + cookie.getValue());
				break;
			}
		}
		
		%>
	</div>
</body>
</html>











