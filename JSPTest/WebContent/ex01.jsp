<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="8kb" autoFlush="true" errorPage="error.jsp" %>

<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Random" %>
<%-- 
<%@ page import="java.util.*" %>
<%@ page import="java.util.Calendar, java.util.Random" %>
 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
<script>

</script>
</head>
<body>
	<!-- <h1>현재 시각</h1> -->
	
	<%@ include file="inc/header.jsp" %>
	
	<%
		
		//JSP 작업 중 사용하는 주석
		//1. HTML 주석, CSS 주석, JavaScript 주석
		//2. 자바 주석
		//3. JSP 주석
	
	
		//http://localhost:8090/JSPTest/ex01.jsp
		
		//자바 영역
		Calendar c = Calendar.getInstance();
	
		Random rnd = null; // = new Random();
		
		//System.out.println(rnd.nextInt());
		
		//for (int i=0; i<1000000; i++) {
	
	%>
			<%-- <div><%= i %></div> --%>
	<%
			
		//}
		
		
	%>
	
	<%-- <%= c %> --%>
	
	<%@ include file="inc/copyright.jsp" %>
	
</body>
</html>
