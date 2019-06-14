<%@page import="com.test.jsp.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 데이터 가져오기(id, pw)
	//2. DB 작업(select)
	//3. 결과에 따라
	//		3.1 성공 : 인증 티켓 발급 + 성공 메시지 전달
	//		3.2 실패 : 실패 메시지 전달
	
	//1.
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//2.
	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;
	DBUtil util = new DBUtil();
	boolean result = false;
	
	try {
		
		conn = util.connect();
		
		//String sql = "select count(*) from tblUser where id = ?";
		//String sql = "select count(*) from tblUser where id = ? and pw = ?";
		
		//String sql = "select count(*) from tblUser where id = ? and pw = ?";
		
		String sql = "select * from tblUser where id = ? and pw = ?";
		
		stat = conn.prepareStatement(sql);
		
		stat.setString(1, id);
		stat.setString(2, pw);
		
		rs = stat.executeQuery();
		
		if (rs.next()) {
			//로그인 성공 + 인증 티켓 발급
			result = true;
			
			//쿠키 or 세션
			session.setAttribute("auth", id); //인증 티켓
			session.setAttribute("name", rs.getString("name"));
			session.setAttribute("lv", rs.getString("lv"));
			
			
		} else {
			//로그인 실패
			result = false;
		}
		
		
	} catch (Exception e) {
		System.out.println(e);
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
		
		<% if (result) { %>
			alert("로그인 성공!!");
			location.href = "index.jsp";
		<% } else { %>
			alert("로그인 실패;;");
			history.back();
		<% } %>
		
	});
	
</script>
</head>
<body>
	<!-- login_ok.jsp -->
	<div class="container">
		<h1></h1>
		
	</div>
</body>
</html>











