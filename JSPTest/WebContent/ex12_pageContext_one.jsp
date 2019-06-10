<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
/* 
response.sendRedirect() vs pageContext.forward()
- 페이지 이동 메소드
- 둘 다 서버측 이동

response.sendRedirect()
1. URL이 두번째로 바뀐다
2. 페이지가 완전히 교체가 된다 > 이전 페이지의 모든 자원이 소멸한 후 이동!
	즉, 자원 전달이 불가능

pageContext.forward()
1. URL이 첫번째로 고정된다.
2. 문맥이 유지된다 > 이전 페이지의 자원을 다음 페이지로 전달 가능 (페이지의 내용만 교체되는거인듯?)

A페이지 자원 -> (전달) -> B페이지
- 기본적으로 불가능
- HTML <form> 태그: 입력 태그를 사용 + 전송 버튼(프로그래밍으로 하면 매우 불편해짐 버튼때문에)
- request, session, applicatio, pageContext 내장 객체

*/
int num = 10;

request.setAttribute("name","홍길동"); //쓰기
request.setAttribute("num", num); //쓰기
/* ㄴ 정상적인방법으로는 num을 못넘기니까 내장객체를 사용해서 맵으로 옮긴다. */
//System.out.println(request.getAttribute("name")); //읽기

//response.sendRedirect("ex12_pageContext_two.jsp");
//결과 URL주소: http://localhost:8090/jsp/ex12_pageContext_two.jsp

pageContext.forward("ex12_pageContext_two.jsp");
//결과 URL주소: http://localhost:8090/jsp/ex12_pageContext_one.jsp


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="css/bootstrap.css" /> 상대경로 -->
<%@ include file="inc/asset.jsp" %>

<style>
</style>
<script>
	$(function(){
		
	});
</script>
</head>
<body>
	
	
	<div class="container">
	
		<h1>첫번째 페이지</h1>
	</div>
	
</body>
</html>