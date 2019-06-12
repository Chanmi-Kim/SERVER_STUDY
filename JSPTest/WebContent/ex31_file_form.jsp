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
	<!-- ex31_file_form.jsp -->
	<div class="container">
		<h1>파일 업로드</h1>
		
		<!--  
		1. 파일 업로드는 반드시 method="POST" 사용한다.
		2. enctype 속성 명시한다.
			- application/x-www-form-urlencoded : 문자열만 전송
			- multipart/form-data : 비문자열까지도 같이 전송
		-->
		
		<form method="POST" action="ex31_file_ok.jsp" enctype="multipart/form-data">
			<div class="well">제목 : <input type="text" name="subject"></div>
			<div class="well">이름 : <input type="text" name="name"></div>
			
			<div class="well">파일 : <input type="file" name="attach"></div>
			
			<div class="well"><input type="submit" value="등록하기"></div>
		</form>
		
	</div>
</body>
</html>











