<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<!-- ex36_jstl.jsp -->
	<div class="container">
		<h1>JSTL, JSP Standard Tag Library</h1>
		<%-- 
		<jsp:forward page=""></jsp:forward>
		<c:if test=""></c:if>
		 --%>
		 
		<h2>변수 선언</h2>
		
		<%
			int a = 10; //지역 변수
			pageContext.setAttribute("b", 20); //내장 객체 속성
		%>
		<c:set var="c" value="30"></c:set><!-- JSTL 변수(pageContext 속성으로 추가) > EL 사용이 가능해짐. -->
		
		<div>a : <%= a %></div>
		<div>b : ${b}</div>
		<div>c : ${c}</div>
		<div>c : <%= pageContext.getAttribute("c") %></div>
		
		<h2>변수 수정(덮어쓰기)</h2>
		<c:set var="c" value="300" />
		<div>c : ${c}</div>
		
		<h2>변수 삭제</h2>
		<c:remove var="c"/>
		<div>c : ${c}</div>
		<div>c : ${empty c}</div>
		
		<h2>조건문</h2>
		<c:set var="num1" value="-10" />
		<div>num1 : ${num1}</div>
		
		<% 
		int num2 = -10;
		
		if (num2 > 0) { 
		%>
		<i><%= num2 %>는 양수입니다.</i>
		<% } else if (num2 < 0) { %>
		<i><%= num2 %>는 음수입니다.</i>
		<% } %>
		
		<c:if test="${num1 > 0}">
			<b>${num1}는 양수입니다.</b>
		</c:if>
		
		<c:if test="${num1 < 0}">
			<!-- 하하 -->
			<b>${num1}는 음수입니다.</b>
		</c:if>
		
		<!-- 외관(switch문) > 동작(다중 if문) -->
		<!-- 모든 액션 태그 내부에 주석 금지 -->
		<!-- when은 또 하나의 if -->
		<c:choose>
			<c:when test="${num1 > 0}">양수입니다.</c:when>
			<c:when test="${num1 < 0}">음수입니다.</c:when>
			<c:otherwise>0입니다.</c:otherwise>
		</c:choose>
		<!-- default:, else절 -->
		
		<h2>반복문(일반 for문 + 향상된 for문)</h2>
		
		<% for (int i=10; i>0; i--) { %>
		<div>항목 <%= i %></div>
		<% } %>
		
		<c:forEach var="i" begin="0" end="9" step="1"><!-- PL/SQL -->
			<div>Item ${10 - i}</div> <!-- step이 0이거나 음수면 안됨, 대신 연산으로 처리 -->
		</c:forEach>
		
		<%
		String[] names = { "홍길동", "아무개", "하하하", "호호호", "후후후" };
		pageContext.setAttribute("names", names);
		%>
		
		<ul>
			<% for (String name : names) { %>
			<li><%= name %></li>
			<% } %>
		</ul>
		
		<ol>
			<c:forEach var="name" items="${names}">
				<li>${name}</li>
			</c:forEach>
		</ol>
				 
	</div>
	
	
	<br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>
