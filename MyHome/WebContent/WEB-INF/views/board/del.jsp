<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Home</title>
<%@ include file="/inc/asset.jsp" %>
<style>
	
	.message.short {
		margin-top: 150px;
	}
	
</style>
<script>

	$(function() {
		
	});
	
</script>
</head>
<body>
	<!-- views > board > del.jsp -->
	<div id="main">
		<jsp:include page="/inc/header.jsp"></jsp:include>
		<section id="detail">
			
			<div class="message short well">
				삭제하면 복구가 불가능합니다.
				<br>
				정말 삭제하겠습니까?
			</div>
			
			<div class="btns short">
				<input type="button" value="삭제하기" class="btn btn-default"
					onclick="location.href='/myhome/board/delok.do?seq=${seq}';">
				<input type="button" value="돌아가기" class="btn btn-default"
					onclick="location.href='/myhome/board/view.do?seq=${seq}';">
			</div>
			
		</section>
	</div>
	
</body>
</html>











