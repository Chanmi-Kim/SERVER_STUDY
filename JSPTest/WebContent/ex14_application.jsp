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
	<!-- ex14_application.jsp -->
	<div class="container">
		<h1>Application</h1>
		
		<!-- 서블릿과 JSP는 톰캣에 따라 버전이 다르다. -->
		<h2>서블릿 버전 - 톰캣 v8.X</h2>
		<%= application.getMajorVersion() %>.<%= application.getMinorVersion() %>
		
		<h2>컨테이너 정보</h2>
		<%= application.getServerInfo() %>
		<br>
		<%= application.getContextPath() %><!-- 컨텍스트 루트 패스 -->
		<br>
		<%= application.getRealPath(".") %><!-- 상대 경로 표현을 파일 절대 경로 표현으로 변환한다. 서버 컴퓨터의 실제 경로를 반환 -->
		<br>
		<%= application.getServletContextName() %><!-- 프로젝트명 -->
		
		<h2>JSP 버전</h2>
		<%= JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion() %>
		
	</div>
</body>
</html>











