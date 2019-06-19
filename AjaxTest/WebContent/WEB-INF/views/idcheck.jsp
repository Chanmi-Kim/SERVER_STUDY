<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/inc/asset.jsp" %>
<style>

</style>
<script>

	$(function() {
		
		<c:if test="${!empty result}">
			<c:if test="${result == 0}">
				$("#btn1").attr("disabled", false);
			</c:if>
		</c:if>
		
	});
	
	function useid() {
		opener.$("#id1").val($("#id").val());
		opener.$("#btn1").attr("disabled", false); //**
		window.close();
	}
	
</script>
</head>
<body>
	<!-- idcheck.jsp -->
	<div class="container" style="text-align: center;">
		<h1>아이디 중복검사</h1>
		
		<hr>
		<form method="POST" action="/AjaxTest/idcheck.do">
			아이디 : <input type="text" name="id" id="id" required value="${id}">
			<input type="submit" value="중복검사">
		</form>
		<hr>
		
			<c:if test="${!empty result}">
				<c:if test="${result == 0}">
					<div id="message" style="color:cornflowerblue;">
					사용 가능한 아이디입니다.
					</div>
				</c:if>
				<c:if test="${result == 1}">
					<div id="message" style="color:tomato;">
					이미 사용중인 아이디입니다.
					</div>
				</c:if>
			</c:if>
		
		<hr>
		
		<input type="button" value="아이디 사용하기" id="btn1" disabled onclick="useid();">
		<input type="button" value="창닫기" onclick="window.close();">
		
	</div>
</body>
</html>










