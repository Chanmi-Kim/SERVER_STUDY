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
	<!-- ex33_thumbnail_form.jsp -->
	<div class="container">
		<h1>이미지 업로드</h1>
		
		<form method="POST" action="ex33_thumbnail_ok.jsp"
				enctype="multipart/form-data">
				
			이미지 : <input type="file" name="img">
			<br>
			<input type="submit" value="보내기">		
			
		</form>
		
	</div>
</body>
</html>











