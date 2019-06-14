<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//1. 인증 받은 사용자인지 확인?
	//		1.1 O : 통과
	//		1.2 X : index.jsp 보내기
	
	if (session.getAttribute("auth") == null) {
		//response.sendRedirect("index.jsp");
		
		out.write("<html><head><meta charset='UTF-8'></head><body><script> alert('로그인 필수!!'); location.href='index.jsp';</script></body></html>");
		out.close(); //이 후의 내용은 임시 페이지에 작성하지 않는다.
		
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="../inc/asset.jsp" %>
<style>

</style>
<script>

	$(function() {
		
	});
	
</script>
</head>
<body>
	<!-- member.jsp -->
	<div class="container">
		<h1>회원 전용 페이지</h1>
		
		회원들만 보는 내용..
		
	</div>
</body>
</html>











