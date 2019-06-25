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
	
	#tblList th:nth-child(1) { width: 50px; }
	#tblList th:nth-child(2) { width: 440px; }
	#tblList th:nth-child(3) { width: 140px; }
	#tblList th:nth-child(4) { width: 120px; }
	#tblList th:nth-child(5) { width: 50px; }
	
	#tblList td { text-align: center; }
	#tblList td:nth-child(2) { text-align: left; padding-left: 15px; }
	
</style>
<script>

	$(function() {
		
	});
	
</script>
</head>
<body>
	<!-- views > board > list.jsp -->
	<div id="main">
		<jsp:include page="/inc/header.jsp"></jsp:include>
		<section id="detail">
			
			<h2>Board</h2>
			
			<table id="tblList" class="table table-bordered long">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>이름</th>
					<th>날짜</th>
					<th>읽음</th>
				</tr>
				<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.seq}</td>
					<td>
					
						<a href="/myhome/board/view.do?seq=${dto.seq}">${dto.subject}</a>
						
						<c:if test="${dto.gap < 60}">
						<span class="label label-danger" style="font-size: 10px;">new</span>
						</c:if>
					</td>
					<td>${dto.name}(${dto.id})</td>
					<td>${dto.regdate}</td>
					<td>${dto.readcount}</td>
				</tr>
				</c:forEach>
			</table>
			
			<div class="btns long">
				<input type="button" value="글쓰기" class="btn btn-default"
					onclick="location.href='/myhome/board/add.do';">
			</div>
			
		</section>
	</div>
	
</body>
</html>











