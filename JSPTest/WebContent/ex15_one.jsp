<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
//현재 상황
// - 요청 ~ 응답 사이에 지속적으로 특정 데이터를 유지해야 하는 상황
// - one.jsp -> two.jsp

//1. 지역 변수 사용
int a = 10;

//A -> B

//3. pageContext 사용
// - 안됨
pageContext.setAttribute("c", 30);

//4. request 사용
// - 됨(+ pageContext.forward() 사용할 때만)
request.setAttribute("d", 40);

//5. session 사용
session.setAttribute("e", 50);

//6. application 사용
application.setAttribute("f", 60);

%>
<%!

//2. 멤버 변수 사용
int b = 20;

public void test() {
	
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
		
	});
	
</script>
</head>
<body>
	<!-- ex15_one.jsp -->
	<div class="container">
		<h1>첫번째 페이지</h1>
		
	</div>
</body>
</html>

<%
//request 객체는 forward() 이동 시 페이지간의 데이터 전달 역할을 한다.
pageContext.forward("ex15_two.jsp");
//response.sendRedirect("ex15_two.jsp");
%>
<script>
	//location.href = "ex15_two.jsp";
</script>
<a href="ex15_two.jsp">두번째 페이지</a>


























