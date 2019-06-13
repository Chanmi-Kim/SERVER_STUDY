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

</style>
<script>

	$(function() {
		
	});
	
</script>
</head>
<body>
	<!-- ex35_el.jsp -->
	<div class="container">
		<h1>EL 연산자</h1>
		
		<%
		pageContext.setAttribute("a", 100);
		pageContext.setAttribute("b", 3);
		%>
		
		<div>a : ${a}</div>
		<div>b : ${b}</div>
		<hr>
		
		<div>a + b = ${a} + ${b}</div>
		
		<h2>산술 연산</h2>
		<div>a + b = ${a + b}</div>
		<div>a - b = ${a - b}</div>
		<div>a * b = ${a * b}</div>
		<div>a / b = ${a / b}</div>
		<div>a % b = ${a % b}</div>
		<div>a mod b = ${a mod b}</div>
		
		<h2>비교 연산</h2>
		<!-- '>'는 '&gt;'로, '<'는 '&lt;'로 바꿔야 함 -->
		<div>a &gt; b = ${a > b}</div>
		<div>a &lt; b = ${a < b}</div>
		<div>a &gt;= b = ${a >= b}</div>
		<div>a &lt;= b = ${a <= b}</div>
		<div>a == b = ${a == b}</div>
		<div>a != b = ${a != b}</div>
		
		<h2>논리 연산</h2>
		<div>a = ${ a > 0 && a < 100 }</div>
		<div>b = ${ b < 0 || b > 100 }</div>
		<div>${!true}</div>
		
		<h2>3항 연산</h2>
		<div>a = ${ a > 0 ? "양수" : "음수" }</div>
		
		<!-- 표현식 : getAttribute() 대리 호출 -->
		<%-- <div>++a = ${++a}</div> --%>
		
		<h2>Empty 연산</h2>
		<div>a = ${empty a}</div>
		<div>a = ${a == null}</div>
		
		<%
			String str1 = "";
			String str2 = null;
			System.out.println(str1 == str2);

			pageContext.setAttribute("str1", str1);
			pageContext.setAttribute("str2", str2);
		%>
		
		<div>str1 비었는지? ${str1 == "" || str1 == null}</div>
		<div>str2 비었는지? ${str2 == "" || str2 == null}</div>
		
		<div>str1 비었는지? ${empty str1}</div>
		<div>str2 비었는지? ${empty str2}</div>
		<div>str3 비었는지? ${empty str3}</div>
				
		
	</div>
</body>
</html>
