<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//데이터 받아오기
	String width = request.getParameter("width");
	String height = request.getParameter("height");
	
	String backcolor = request.getParameter("backcolor");
	String forecolor = request.getParameter("forecolor");
	
	String fontsize = request.getParameter("fontsize");
	
	String isborder = request.getParameter("isborder"); // y | n
	String borderWidth = request.getParameter("borderWidth");
	String borderColor = request.getParameter("borderColor");
	String borderStyle = request.getParameter("borderStyle");
	String borderRadius = request.getParameter("borderRadius");
	
	String count = request.getParameter("count");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="inc/asset.jsp" %>
<style>
	
	.btn {
		width: <%= width %>px;
		height: <%= height %>px;
		background-color: <%= backcolor %>;
		color: <%= forecolor %>;
		font-size: <%= fontsize %>px;
		
		<% if (isborder.equals("y")) { %>
		/* border: 10px solid black; */
		border: <%= borderWidth %>px <%= borderStyle %> <%= borderColor %>;
		border-radius: <%= borderRadius %>%;
		<% } %>
		
	}
	
</style>
<script>

	$(function() {
		
	});
	
</script>
</head>
<body>
	<!-- ex09_process.jsp -->
	<div class="container">
		<h1>결과</h1>
		
		<% for (int i=1; i<= Integer.parseInt(count); i++) { %>
		<button class="btn">Button</button>
		<% } %>
		
	</div>
</body>
</html>











