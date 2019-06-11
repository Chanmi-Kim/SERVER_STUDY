<%@page import="com.test.jsp.Address"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//1. 데이터 가져오기
//2. 객체화
//3. 업무 사용

//인코딩 처리
request.setCharacterEncoding("UTF-8");

/* 
String name = request.getParameter("name");
String age = request.getParameter("age");
String gender = request.getParameter("gender");
String tel = request.getParameter("tel");
String address = request.getParameter("address");


Address addr = new Address();

addr.setName(name);
addr.setAge(age);
addr.setGender(gender);
addr.setTel(tel);
addr.setAddress(address); 
*/

%>

<%-- 
<jsp:useBean id="addr" class="com.test.jsp.Address" scope="page"></jsp:useBean>
<jsp:setProperty property="name" name="addr" 
		value='<%= request.getParameter("name") %>'/>
<jsp:setProperty property="age" name="addr" 
		value='<%= request.getParameter("age") %>' />
<jsp:setProperty property="gender" name="addr" 
		value='<%= request.getParameter("gender") %>' />
<jsp:setProperty property="tel" name="addr" 
		value='<%= request.getParameter("tel") %>'/>
<jsp:setProperty property="address" name="addr" 
		value='<%= request.getParameter("address") %>' /> 
--%>

<!--  

폼태그의 name == setter == 자바빈 멤버 변수명 == DB의 컬럼명

-->
<jsp:useBean id="addr" class="com.test.jsp.Address" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="addr" />

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
	<!-- ex23_bean_ok.jsp -->
	<div class="container">
		<h1>결과</h1>
		
		<div>이름 : <%= addr.getName2() %></div>
		<div>나이 : <%= addr.getAge() %></div>
		<div>성별 : <%= addr.getGender() %></div>
		<div>전화 : <%= addr.getTel() %></div>
		<div>주소 : <%= addr.getAddress() %></div>
		
	</div>
</body>
</html>
