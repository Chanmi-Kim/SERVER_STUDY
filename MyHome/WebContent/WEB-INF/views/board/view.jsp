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
	
	#tblView th { width: 150px; }
	#tblView td { width: 650px; }
	#tblView #content { height: 300px; }
	
</style>
<script>

	$(function() {
		
	});
	
</script>
</head>
<body>
	<!-- views > board > add.jsp -> view.jsp -->
	<div id="main">
		<jsp:include page="/inc/header.jsp"></jsp:include>
		<section id="detail">
			
			<h2>Board</h2>
			
			
			<table id="tblView" class="table table-bordered long">
				<tr>
					<th>번호</th>
					<td>${dto.seq}</td>
				</tr>
				<tr>
					<th>이름(아이디)</th>
					<td>${dto.name}(${dto.id})</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${dto.subject}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td id="content">${dto.content}</td>
				</tr>
				<tr>
					<th>날짜</th>
					<td>${dto.regdate}</td>
				</tr>
				<tr>
					<th>접속IP</th>
					<td>${dto.userip}</td>
				</tr>
				<tr>
					<th>읽음</th>
					<td>${dto.readcount}회</td>
				</tr>
			</table>
			
			<div class="btns long">
				<input type="button" value="수정하기" class="btn btn-default"
					onclick="location.href='/myhome/board/edit.do?seq=${dto.seq}';">
				<input type="button" value="삭제하기" class="btn btn-default"
					onclick="location.href='/myhome/board/del.do?seq=${dto.seq}';">
				<input type="button" value="돌아가기" class="btn btn-default"
					onclick="location.href='/myhome/board/list.do';">
			</div>
			
			
			
		</section>
	</div>
	
</body>
</html>











