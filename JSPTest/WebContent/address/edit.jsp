<%@page import="com.test.jsp.DBUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	
	//1. 데이터 가져오기(seq)
	//2. DB 작업(select where seq = 10)
	//3. 가져온 정보를 컨트롤 대입
	
	//1.
	String seq = request.getParameter("seq");

	//2.
	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;
	DBUtil util = new DBUtil();
	
	try {
		
		conn = util.connect();
		String sql = "select * from tblAddress where seq = ?";
		stat = conn.prepareStatement(sql);
		stat.setString(1, seq);
		
		rs = stat.executeQuery();
		
		rs.next();
		
	} catch (Exception e) {
		System.out.println(e);
	}
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록</title>
<link rel="stylesheet" href="/JSPTest/address/css/main.css">
<style>
	#tbl1 { width: 400px; }
	#tbl1 th { width: 100px; }
	#tbl1 td { width: 300px; }
</style>
<script>

	window.onload = function() {
		
		//add();
		
	}
	
	function add() {
		var name = document.getElementsByName("name")[0];
		var age = document.getElementsByName("age")[0];
		var gender = document.getElementsByName("gender")[0];
		var tel = document.getElementsByName("tel")[0];
		var address = document.getElementsByName("address")[0];
		
		name.value = "<%= rs.getString("name") %>";
		age.value = "<%= rs.getString("age")%>";
		gender.value = "<%= rs.getString("gender")%>";
		tel.value = "<%= rs.getString("tel")%>";
		address.value = "<%= rs.getString("address")%>";
		
	}
	
</script>
</head>
<body>
	<!-- edit.jsp -->
	<div class="main">
		<h1>주소록 <small>주소록 수정하기</small></h1>
		<div class="content">
		
			<form method="POST" action="editok.jsp">
			<table class="table" id="tbl1">
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" required class="control short" value="<%= rs.getString("name") %>"></td>
				</tr>
				<tr>
					<th>나이</th>
					<td><input type="text" name="age" required class="control short" value="<%= rs.getString("age") %>"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<select name="gender" class="control">
							<option value="m" <%= rs.getString("gender").equals("m") ? "selected": "" %>>남자</option>
							<option value="f" <%= rs.getString("gender").equals("f") ? "selected": "" %>>여자</option>
							<%-- <option value="f" <% if (rs.getString("gender").equals("f")) { out.write("selected"); } %>>여자</option> --%>
						</select>
					</td>
				</tr>
				<tr>
					<th>전화</th>
					<td><input type="text" name="tel" required class="control medium" value="<%= rs.getString("tel") %>"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address" required class="control long" value="<%= rs.getString("address") %>"></td>
				</tr>
			</table>
			<div class="btns">
				<input type="button" value="돌아가기" class="control">
				<input type="submit" value="수정하기" class="control">
			</div>
			
			<input type="hidden" name="seq" value="<%= rs.getString("seq") %>">			
			</form>
		</div>
	</div>
</body>
</html>












































