<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="inc/asset.jsp" %>
<style>

	th { width: 100px; }
	#flist input { margin-bottom: 10px; }
	#flist input[type=file] { width: 90%; float: left; }
	#flist span { float: left; margin-top: 6px; margin-left: 7px; cursor: pointer; }
	
</style>
<script>

	var no = 4;

	$(function() {
		
		$("#btnAdd").click(function() {
			
			$("#flist").append('<input type="file" name="attach' + no + '" class="form-control"><span>&times;</span>');
			no++;
			
			$("#flist span").last().click(function() {
				$(this).prev().remove();
				$(this).remove();
			});
			
		});
		
		
		$("#flist span").click(function() {
			$(this).prev().remove();
			$(this).remove();
		});
		
	});
	
</script>
</head>
<body>
	<!-- ex32_file_form.jsp -->
	<div class="container">
		<h1>파일 업로드</h1>
		
		<form method="POST" action="ex32_file_ok.jsp" enctype="multipart/form-data">
		<table class="table table-bordered" style="width: 400px;">
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" class="form-control" value="테스트입니다."></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" class="form-control" value="홍길동"></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<div id="flist">
						<input type="file" name="attach1" class="form-control"><span>&times;</span>
						<input type="file" name="attach2" class="form-control"><span>&times;</span>
						<input type="file" name="attach3" class="form-control"><span>&times;</span>
					</div>
					<input type="button" value="첨부파일 추가하기" id="btnAdd" class="btn btn-primary">
				</td>
			</tr>
		</table>
		<hr>
		<input type="submit" value="보내기" class="btn btn-success">
		</form>
		
	</div>
</body>
</html>











