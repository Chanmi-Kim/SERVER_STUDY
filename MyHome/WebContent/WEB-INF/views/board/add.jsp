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
	
	#tblAdd th { width: 150px; }
	#tblAdd td { width: 650px; }
	#tblAdd #content { height: 300px; }
	
</style>
<script>

	$(function() {
		
	});
	
</script>
</head>
<body>
	<!-- views > board > add.jsp -->
	<div id="main">
		<jsp:include page="/inc/header.jsp"></jsp:include>
		<section id="detail">
			
			<h2>Board</h2>
			
			<form method="POST" action="/myhome/board/addok.do"
				enctype="multipart/form-data">
			<table id="tblAdd" class="table table-bordered long">
				<c:if test="${lv == 2}">
				<tr>
					<th>공지글</th>
					<td>
						<select name="notice" id="notice" class="form-control short">
							<option value="0">일반글</option>
							<option value="1">공지글</option>
						</select>
					</td>
				</tr>
				</c:if>
				<tr>
					<th>이름(아이디)</th>
					<td>${name}(${id})</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject" id="subject" class="form-control" required></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="content" id="content" class="form-control" required></textarea></td>
				</tr>
				<tr>
					<th>태그</th>
					<td>
						<select name="tag" id="tag" class="form-control short">
							<option value="n">사용 안함</option>
							<option value="y">사용함</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>파일</th>
					<td><input type="file" name="attach" id="attach" class="form-control"></td>
				</tr>
				<tr>
					<th>해시 태그</th>
					<td><input type="text" name="hash" id="hash" class="form-control"></td>
				</tr>
			</table>
			
			<div class="btns long">
				<input type="submit" value="글쓰기" class="btn btn-default">
				<input type="button" value="돌아가기" class="btn btn-default"
					onclick="location.href='/myhome/board/list.do';">
			</div>
			
			
			<c:if test="${not empty reply}">
			<input type="hidden" name="thread" value="${thread}">
			<input type="hidden" name="depth" value="${depth}">
			<input type="hidden" name="reply" value="${reply}">
			</c:if> 
			
			</form>
			
		</section>
	</div>
	
</body>
</html>











