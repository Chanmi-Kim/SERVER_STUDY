<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- ex03.jsp -->
	
<h1>사이트 제목</h1>
<nav>
	<a href="../ex01.jsp" target="_top">메뉴A</a>
	<a href="ex02.jsp">메뉴B</a>
	<a href="ex03.jsp">메뉴C</a>
</nav>

	<!-- <iframe src="inc/header.jsp"></iframe> -->
	
	<p>컨텐츠</p>
	
	<%@ include file="inc/copyright.jsp" %>
	
</body>
</html>
