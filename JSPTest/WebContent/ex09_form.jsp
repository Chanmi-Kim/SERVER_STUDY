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
	table th { width: 150px; }
	table td { width: 250px; }
	#trBorder div { margin-bottom: 5px; }
</style>
<script>

	$(function() {
		
		$("#trBorder").hide();
		
		$("#isborder").change(function() {
			//alert($(this).val());
			if ($(this).val() == "y") {
				$("#trBorder").show();
			} else {
				$("#trBorder").hide();
			}
		});
		
	});
	
</script>
</head>
<body>
	<!-- ex09_form.jsp -->
	<div class="container">
		<h1>버튼 만들기</h1>
		
		<form method="POST" action="ex09_process.jsp">
			<table class="table table-bordered" style="width: 400px;">
				<tr>
					<th>버튼 너비</th>
					<td><input type="number" name="width" min="100" max="500" step="10" value="100" style="text-align: right;">px</td>
				</tr>
				<tr>
					<th>버튼 높이(px)</th>
					<td><input type="range" name="height" min="20" max="300" step="10" value="20"></td>
				</tr>
				<tr>
					<th>배경색</th>
					<td><input type="color" name="backcolor" value="#FFFFFF"></td>
				</tr>
				<tr>
					<th>글자색</th>
					<td><input type="color" name="forecolor" value="#000000"></td>
				</tr>
				<tr>
					<th>글자 크기</th>
					<td><input type="number" name="fontsize" min="10" max="100" value="16">px</td>
				</tr>
				<tr>
					<th>테두리 지정</th>
					<td>
						<select name="isborder" id="isborder">
							<option value="n">감추기</option>
							<option value="y">보이기</option>
						</select>
					</td>
				</tr>
				<tr id="trBorder">
					<th>테두리 세부 지정</th>
					<td>
						<div>
							두께 : <input type="number" name="borderWidth" min="1" max="30" value="1">
						</div>
						<div>
							색상 : <input type="color" name="borderColor" value="#000000">
						</div>
						<div>
							스타일 :
							<select name="borderStyle">
								<option value="solid">실선</option>
								<option value="dashed">쇄선</option>
								<option value="dotted">점선</option>
							</select>
						</div>
						<div>
							모서리 : <input type="number"  name="borderRadius" min="0" max="50" value="0">
						</div>
					</td>
				</tr>
				<tr>
					<th>버튼 갯수</th>
					<td><input type="number" name="count" min="1" max="100" value="1"></td>
				</tr>
			</table>
			
			<div style="margin: 20px 0px">
				<input type="submit" value="만들기" class="btn btn-primary">
			</div>
			
		</form>
		
	</div>
</body>
</html>











