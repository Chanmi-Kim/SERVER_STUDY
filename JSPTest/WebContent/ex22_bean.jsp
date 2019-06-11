<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.jsp.Student" %>

<!-- Student s1 = new Student(); -->
<jsp:useBean id="s1" class="com.test.jsp.Student"></jsp:useBean>
<jsp:useBean id="s2" class="com.test.jsp.Student"></jsp:useBean>

<jsp:setProperty property="name" name="s1" value="홍길동" />
<jsp:setProperty property="age" name="s1" value="16" />
<jsp:setProperty property="kor" name="s1" value="99" />
<jsp:setProperty property="eng" name="s1" value="88" />
<jsp:setProperty property="math" name="s1" value="77" />

<jsp:setProperty property="name" name="s2" value="아무개" />
<jsp:setProperty property="age" name="s2" value="16" />
<jsp:setProperty property="kor" name="s2" value="54" />
<jsp:setProperty property="eng" name="s2" value="75" />
<jsp:setProperty property="math" name="s2" value="59" />

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
	<!-- ex22_bean.jsp -->
	<div class="container">
		<h1>사용자 정의 클래스 & 객체 - 액션 태그 사용</h1>
		
		<%
			//System.out.println(s1.getName());
		%>
		
		<h2><jsp:getProperty property="name" name="s1"/></h2>
		<div><jsp:getProperty property="age" name="s1"/></div>
		<div><jsp:getProperty property="kor" name="s1"/></div>
		<div><jsp:getProperty property="eng" name="s1"/></div>
		<div><jsp:getProperty property="math" name="s1"/></div>
		--
		<h2><jsp:getProperty property="name" name="s2"/></h2>
		<div><jsp:getProperty property="age" name="s2"/></div>
		<div><jsp:getProperty property="kor" name="s2"/></div>
		<div><jsp:getProperty property="eng" name="s2"/></div>
		<div><jsp:getProperty property="math" name="s2"/></div>
		
	</div>
</body>
</html>
