<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String remember = request.getParameter("remember");
	
	HashMap<String,String> data = new HashMap<String,String>();

	data.put("hong", "1234");
	data.put("test", "1234");
	data.put("aaaa", "1234");
	
	boolean result = false;
	
	if (data.containsKey(id)) {
		//id 확인 > pw 확인
		if (data.get(id).equals(pw)) {
			//로그인 성공
			result = true;
		} else {
			//로그인 실패
		}
		
	} else {
		//로그인 실패
	}

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
		
		<% if (result && remember != null && remember.equals("y")) { %>
			//alert("O");	
			
			setCookie("id", "<%= id %>", 365);
			
			
		<% } else if (result && remember == null) { %>
			//alert("X");
			
			setCookie("id", "", -1); //쿠키 삭제
			
		<% } %>
		
	});
	
</script>
</head>
<body>
	<!-- ex27_cookie_ok.jsp -->
	<div class="container">
		<h1>결과</h1>
		
		<%= result ? "로그인 성공!!" : "로그인 실패;;" %>
		
	</div>
</body>
</html>











