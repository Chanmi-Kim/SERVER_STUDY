<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
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
	<!-- ex19_one.jsp -->
	<div class="container">
		<h1>첫번째 페이지</h1>
		
		<%
			//select name from tblMember w...
			String name = "홍길동";
		
			request.setAttribute("name", name);
			request.setAttribute("tel", "010-1234-5678");
			
			//pageContext.forward("ex19_two.jsp");
		%>
		
		<!-- 구글링 -->
		<!--  
		jsp : Namespace(= 패키지)
		
		com.test.jsp.Hello
		com.test.jdbc.Hello
		
		XML : 태그를 내맘대로 맘든다.
		-->
		<jsp:forward page="ex19_two.jsp">
			<!-- 설명 -->
			<jsp:param value="서울시 강남구 역삼동" name="address"/>
		</jsp:forward>
		
	</div>
</body>
</html>











