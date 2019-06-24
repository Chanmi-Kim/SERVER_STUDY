<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Home</title>
<%@ include file="/inc/asset.jsp" %>
<style>
	
	#tblLogin, #tblInfo {
		margin-top: 150px;
	}
	
	#tblLogin th {
		width: 100px;
	}
	
	#tblLogin td {
		width: 200px;
	}
	
	#pic {
		float: left;
		width: 80px;
		height: 80px;
		border: 1px solid #ddd;
		margin: 10px;
		margin-top: 4px;
		background-image: url(/myhome/pic/${pic});
		background-repeat: no-repeat;
		background-size: contain;
		background-position: center center;
	}
	
</style>
<script>

	$(function() {
		
	});
	
</script>
</head>
<body>
	<!-- views > member > index.jsp -->
	<div id="main">
		<jsp:include page="/inc/header.jsp"></jsp:include>
		<section id="detail">
			
			<!--  
			1. 로그인/로그아웃
			2. 회원 정보 출력
			-->
			
			<!--  
			EL
			: 내장 객체(pageContext, request, session, application) 내의 데이터를 가져와서 출력하는 역할
			: pageContext.getAttribute("id") > request.getAttribute("id") > session.getAttribute("id") > application.getAttribute("id")
			-->
			
			<%-- ${sessionScope.id} --%>
			
			
			<c:if test="${empty id}"><!-- 인증 티켓이 없으면 -->
			
			<!-- 로그인 상자 -->
			<form method="POST" action="/myhome/member/loginok.do">
			<table id="tblLogin" class="table table-bordered short">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" id="id" class="form-control short" required></td>
				</tr>
				<tr>
					<th>암호</th>
					<td><input type="password" name="pw" id="pw" class="form-control short" required></td>
				</tr>
			</table>
			<div class="btns short">
				<input type="submit" value="로그인" class="btn btn-default">
			</div>
			</form>
			
			<div class="sub short">
				<a href="/myhome/member/add.do">회원 가입하기</a>
			</div>
						
			<div class="btns short">
				<input type="button" value="홍길동" class="btn btn-default"
					onclick="location.href='/myhome/member/loginok.do?id=hong&pw=1111';">
				<input type="button" value="테스트" class="btn btn-default"
					onclick="location.href='/myhome/member/loginok.do?id=test&pw=1111';">
				<input type="button" value="이순신" class="btn btn-default"
					onclick="location.href='/myhome/member/loginok.do?id=admin&pw=1111';">
			</div>
			
			</c:if>
			
			<c:if test="${not empty id}"><!-- 인증 티켓을 가지고 있으면 -->
			
			<table id="tblInfo" class="table table-bordered short">
				<tr>
					<th>Member Info</th>
				</tr>
				<tr>
					<td>
						<div id="pic"></div>
						<%-- <img src="/myhome/pic/${pic}" id="pic"> --%>
						<div style="margin-top: 12px;"><label>별명(이름) : </label><span>${nick}(${name})</span></div>
						<div><label>등급 : </label><span>${lv == 1 ? "일반회원" : "관리자"}</span></div>
						<div><label>포인트 : </label><span>${point} point</span></div>
						<div style="clear:both;margin-left: 10px;"><label>가입일 : </label><span>${regdate}</span></div>
					</td>
				</tr>
			</table>
			<div class="btns short">
				<input type="button" value="로그 아웃" class="btn btn-default"
					onclick="location.href='/myhome/member/logout.do';">
				<input type="button" value="시작 페이지" class="btn btn-default"
					onclick="location.href='/myhome/index.do';">
			</div>
			
			<div class="sub short">
				<a href="/myhome/member/del.do">회원 탈퇴하기</a>
			</div>
			</c:if>
			
			
		</section>
	</div>
	
</body>
</html>











