<%@page import="com.test.jsp.Student"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<!-- ex34_el.jsp -->
	<div class="container">
		<h1>EL</h1>
		
		<%
		
		//자바 데이터
		int a = 10;
		pageContext.setAttribute("a", a);//이 단계를 거치면 EL을 사용할 수 있다.
		
		//내장 객체 데이터
		pageContext.setAttribute("b", 20);
		
		%>
		
		<h2>자바 표현식</h2>
		<div>a : <%= a %></div>
		<div>b : <%= pageContext.getAttribute("b") %></div>
		
		<h2>EL</h2>
		<div>a : ${a}</div><!-- 일반 자바 데이터는 EL로 출력이 불가능 -->
		<div>b : ${pageContext.getAttribute("b")}</div>
		<div>b : ${b}</div>
		
		
		<%
		int c = 30;
		pageContext.setAttribute("d", 40);
		%>
		
		<h2>EL + 연산</h2>
		
		<div>c + 10 = <%= c + 10 %></div>
		<div>d + 10 = <%= (int)pageContext.getAttribute("d") + 10 %></div>
		
		<div>c + 10 = ${c + 10}</div>
		<div>d + 10 = ${d + 10}</div>
		<div>d - 10 = ${d - 10}</div>
		<div>d * 10 = ${d * 10}</div>
		<div>d / 10 = ${d / 10}</div>
		<div>d &gt; 10 = ${d > 10}</div>
		<div>d &lt; 10 = ${d < 10}</div> <!-- 헷갈릴 수 있어서 엔티티로 바꿔줘야 함. 직접적으로 '>'와 '<' 사용 금지 -->
		
		
		<h2>HashMap 지원</h2>
		<%
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("name", "홍길동");
		map.put("gen-der", "남자");
		map.put("job", "학생");
		
		pageContext.setAttribute("map", map);
		%>
		<div>이름 : <%= map.get("name") %></div>
		<div>성별 : <%= map.get("gender") %></div>
		<div>직업 : <%= map.get("job") %></div>
		
		<div>이름 : ${map.get("name")}</div> <!--  pageContext.getAttribute("map.get("name")"); -->
		<div>성별 : ${map["gender"]}</div> <!-- 부적합 문자열 있을 때 사용 -->
		<div>직업 : ${map.job}</div> <!-- 평범할 때 사용 -->
		
		
		
		<h2>객체 지원(자바빈 or DTO(VO)) - 데이터 집합으로서의 객체</h2>
		<%
		Student s1 = new Student();
		s1.setName("홍길동");
		s1.setAge(15);
		s1.setKor(100);
		s1.setEng(90);
		s1.setMath(80);
		
		pageContext.setAttribute("s1", s1);
		%>
		<!-- 순수 자바 데이터 : s1 -->
		<div>이름(나이) : </div>
		<div>평균 점수 : </div>
		
		<!-- pageContext 데이터 : 자바 표현식 -->
		<div>이름(나이) : </div>
		<div>평균 점수 : </div>
		
		<!-- pageContext 데이터 : EL -->
		<div>이름(나이) : </div>
		<div>평균 점수 : </div>
		
		
	</div>
	
	
	
	
	
	
	<br><br><br><br><br><br><br><br><br><br>
</body>
</html>
