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
		
		/*  
		1. width : 위드, 위드쓰, 위듣쓰
		2. height : 하이트, 헤이트
		*/
		
		#tbl1 th:nth-child(1) { width: 120px; }
		#tbl1 th:nth-child(2) { width: 120px; }
		#tbl1 th:nth-child(3) { width: 500px; }
		
		#tbl1 td:nth-child(1) { text-align: center; }
		#tbl1 td:nth-child(2) { text-align: center; }
		
	</style>
	<script>
	
	</script>
</head>
<body>
	
	<div id="main">
	
		<jsp:include page="/inc/codeheader.jsp"></jsp:include>
		<div id="content">
			
			<%-- 
			<c:forEach items="${list}" var="dto">
				${dto.subject}<br>
			</c:forEach> 
			--%>
			
			<table id="tbl1" class="table table-bordered">
				<tr>
					<th>과목</th>
					<th>날짜</th>
					<th>제목</th>
				</tr>
				<c:forEach items="${list}" var="dto">
				<tr>
					<td><div style="border-left: 5px solid ${dto.categoryColor};">${dto.categoryName}</div></td>
					<td>${dto.regdate.substring(0, 10) }</td>
					<td><a href="/JSPTest/code/view.do?seq=${dto.seq}">${dto.subject}</a></td>
				</tr>
				</c:forEach> 
			</table>
			<div id="btns">
				<button type="button" class="btn btn-success" onclick="location.href='/JSPTest/code/add.do';">
					<span class="glyphicon glyphicon-saved"></span>
					등록하기
				</button>
			</div>
			
		</div>
		<jsp:include page="/inc/codefooter.jsp"></jsp:include>
		
	
	</div>
	
</body>
</html>










