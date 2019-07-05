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
		
		$("#btn").click(function() {
			
			$.ajax({
				type: "GET",
				url: "/myhome/etc/bookdata.do",
				data: "query=" + $("#query").val(),
				dataType: "xml",
				success: function(result) {
					//alert(result.constructor);
					
					$("#tbl1 tbody").html("");//이전 결과 초기화
					var temp = "";
					
					$(result).find("item").each(function (index, item) {
						
						temp += "<tr>";
						
						var image = $(item).find("image").text();
						var title = $(item).find("title").text();
						var author = $(item).find("author").text();
						var publisher = $(item).find("publisher").text();
						var price = $(item).find("price").text();
						var discount = $(item).find("discount").text();
						//alert(title);
						
						temp += "<td><img src='" + image + "'></td>";
						temp += "<td>" + title + "</td>";
						temp += "<td>" + author + "</td>";
						temp += "<td>" + publisher + "</td>";
						temp += "<td><s>" + price + "원</s>" + discount +"원</td>";
						
						temp += "</tr>";
						
					});
					
					$("#tbl1 tbody").html(temp);
					
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			});
			
		});
		
	});
	
</script>
</head>
<body>
	<!-- book.jsp -->
	<div class="container" style="width: 1000px;">
		<h1>네이버 Open API <small>책 검색</small></h1>
		
		<div id="search" class="well">
			<label>검색어 : </label>
			<input type="text" name="query" id="query" class="form-control" style="width: 200px; display: inline-block;">
			<input type="button" name="btn" id="btn" class="btn btn-default" value="검색하기">
		</div>
		
		<h3>검색 결과</h3>
		
		<table id="tbl1" class="table table-bordered">
			<thead>
				<tr>
					<th>표지</th>
					<th>제목</th>
					<th>저자</th>
					<th>출판사</th>
					<th>가격</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		
		
	</div>
</body>
</html>










