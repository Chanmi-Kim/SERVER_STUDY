<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	//one.jsp
	//자바로 쿠키값 쓰기
	
	//쿠키 객체 생성(서버에 저장) -> 값 저장 -> 브라우저에게 반환(클라이언트에 저장)
	
	//Cookie cookie = new Cookie("name", "value"); //값 1개
	Cookie cname = new Cookie("name", "홍길동");
	Cookie cage = new Cookie("age", "20");
	Cookie caddress = new Cookie("address", "서울시");
	
	cname.setMaxAge(365*24*60*60);//만료 시각 : 1년 뒤
	
	//쿠키 반환(쓰기) : 서버 -> 클라이언트 > response
	response.addCookie(cname);
	response.addCookie(cage);
	response.addCookie(caddress);

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
	<!-- ex28_cookie_one.jsp -->
	<div class="container">
		<h1>쿠키 쓰기</h1>
		
		<!-- 본인이 만들어서 바로 확인하는 경우는 별로 없다. -->
		<div><%= cname.getName() %></div>
		<div><%= cname.getValue() %></div>
		<div><%= cname.getMaxAge() %></div>
		
		<a href="ex28_cookie_two.jsp">두번째 페이지</a>
		
	</div>
</body>
</html>











