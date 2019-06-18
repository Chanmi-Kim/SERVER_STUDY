<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Code</title>
	<jsp:include page="/inc/codeasset.jsp"></jsp:include>
	<style>
	
	</style>
	<script>
	
	</script>
</head>
<body>
	
	<div id="main">
	
		<jsp:include page="/inc/codeheader.jsp"></jsp:include>
		<div id="content">
			
			<script>
			<c:if test="${result == 1}">
				//성공
				location.href = "/JSPTest/code/list.do";
			</c:if>
			
			<c:if test="${result == 0}">
				//실패
				alert("삭제 실패;;");
				history.back();
			</c:if>
			</script>
			
		</div>
		<jsp:include page="/inc/codefooter.jsp"></jsp:include>
		
	
	</div>
	
</body>
</html>


















