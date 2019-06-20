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
		
		//부서 클릭
		$("#department > :button").click(function() {
			//alert($(this).val());
			
			$.ajax({
				type: "GET",
				url: "/AjaxTest/ex07data.do",
				dataType: "xml",
				data: "department=" + $(this).val(),
				success: function(result) {
					
					$("#tbl1 tbody").html("");//안내 메시지 지우기
					
					$(result).find("insa").each(function(index, insa) {
						//$(insa) //직원 1명
						//console.log($(insa).find("name").text());
						
						$("#tbl1 tbody").append(
									"<tr>" +
										"<td>" + $(insa).find("num").text() + "</td>" + 
										"<td>" + $(insa).find("name").text() + "</td>" + 
										"<td>" + $(insa).find("jikwi").text() + "</td>" + 
										"<td>" + $(insa).find("tel").text() + "</td>" + 
										"<td>" + $(insa).find("city").text() + "</td>" + 
									"</tr>"
						);				
						
						
					});
					
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
	<!-- ex07.jsp -->
	<div class="container">
		<h1 class="page-header">직원 목록</h1>
		
		<div class="well well-sm" id="department">
			<input type="button" value="기획부" class="btn btn-default">
			<input type="button" value="영업부" class="btn btn-default">
			<input type="button" value="총무부" class="btn btn-default">
			<input type="button" value="개발부" class="btn btn-default">
			<input type="button" value="인사부" class="btn btn-default">
			<input type="button" value="자재부" class="btn btn-default">
			<input type="button" value="홍보부" class="btn btn-default">
		</div>
		
		<table class="table table-bordered" id="tbl1">
			<thead>
				<tr>
					<th>번호</th>
					<th>직원명</th>
					<th>직위</th>
					<th>연락처</th>
					<th>거주지</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="5">부서를 먼저 선택하세요.</td>
				</tr>
			</tbody>
		</table>
		
	</div>
</body>
</html>










