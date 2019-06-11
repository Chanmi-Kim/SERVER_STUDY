<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.jsp.Student" %>
<%

	//어떤 경로 > 학생 정보 취득 > 객체 취급
	Student s1 = new Student();
	
	s1.setName("홍길동");
	s1.setAge(15);
	s1.setKor(100);
	s1.setEng(90);
	s1.setMath(80);
	
	Student s2 = new Student();
	
	s2.setName("아무개");
	s2.setAge(15);
	s2.setKor(90);
	s2.setEng(86);
	s2.setMath(77);
	

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
	<!-- ex21_bean.jsp -->
	<div class="container">
		<h1>사용자 정의 클래스 & 객체</h1>
		
		<h2>학생 정보</h2>
		
		<h3><%= s1.getName() %></h3>
		<ul>
			<li>나이 : <%= s1.getAge() %></li>
			<li>국어 : <%= s1.getKor() %></li>
			<li>영어 : <%= s1.getEng() %></li>
			<li>수학 : <%= s1.getMath() %></li>
		</ul>
		
		
		<h3><%= s2.getName() %></h3>
		<ul>
			<li>나이 : <%= s2.getAge() %></li>
			<li>국어 : <%= s2.getKor() %></li>
			<li>영어 : <%= s2.getEng() %></li>
			<li>수학 : <%= s2.getMath() %></li>
		</ul>
			
	</div>
</body>
</html>
