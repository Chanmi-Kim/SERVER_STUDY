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
	<!-- views > member > del.jsp -->
	<div id="main">
		<jsp:include page="/inc/header.jsp"></jsp:include>
		<section id="detail">
			
			<div class="message short well">
				회원 탈퇴를 진행합니다. 
				<br>
				작성하신 게시물과 포인트가 소멸됩니다. 
				<br>
				계속 진행하시겠습니까?
				<br>
			</div>
			<div class="btns short">
				<input type="button" value="탈퇴하기" class="btn btn-default"
					onclick="location.href='/myhome/member/delok.do';">
				<input type="button" value="돌아가기" class="btn btn-default"
					onclick="location.href='/myhome/member/index.do';">
			</div>
			
			
		</section>
	</div>
	
</body>
</html>











