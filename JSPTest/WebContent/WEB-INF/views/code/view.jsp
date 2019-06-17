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
		#tbl1 th { width: 140px; }
		#tbl1 td { width: 600px; }
		#code, #description {
			resize: none;
			height: 200px;
		}
		#tbl1 td pre { width: 590px; /* white-space: pre-wrap; */ }
	</style>
	<script>
	
	</script>
</head>
<body>
	
	<!-- add.jsp > view.jsp -->
	<div id="main">
	
		<jsp:include page="/inc/codeheader.jsp"></jsp:include>
		<div id="content">
			
			
			<table id="tbl1" class="table table-bordered">
				<tr>
					<th>과목</th>
					<td>${dto.categoryName}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${dto.subject}</td>
				</tr>
				<tr>
					<th>코드</th>
					<td><pre>${dto.code}</pre></td>
				</tr>
				<tr>
					<th>설명</th>
					<td>${dto.description}</td>
				</tr>
				<tr>
					<th>날짜</th>
					<td>${dto.regdate}</td>
				</tr>
			</table>
			<div id="btns">
				<button type="button" class="btn btn-default"><span class="glyphicon glyphicon-hand-left"></span> 돌아가기</button>
				<button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-saved"></span> 등록하기</button>
			</div>
			
		</div>
		<jsp:include page="/inc/codefooter.jsp"></jsp:include>
		
	
	</div>
	
</body>
</html>










