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

</style>
<script>

	$(function() {
		
	});
	
</script>
</head>
<body>
	<!-- views > board > addcomment.jsp -->
	<div id="main">
		<jsp:include page="/inc/header.jsp"></jsp:include>
		<section id="detail">
			
			<script>
			<c:if test="${result == 1}">
				location.href = "/myhome/board/view.do?seq=${pseq}";
			</c:if>
			
			<c:if test="${result == 0}">
				alert("댓글삭제 실패;;");
				history.back();
			</c:if>
			</script>
			
		</section>
	</div>
	
</body>
</html>











