<%@page import="com.test.jsp.DBUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//1. DB 작업(select)
	//2. 반환된 ResultSet 출력
	
	Connection conn = null;
	Statement stat = null;
	ResultSet rs = null;
	DBUtil util = new DBUtil();
	int cnt = 0;
	
	try {
		
		conn = util.connect();
		
		//추가 업무 > 목록 갯수 세기
		stat = conn.createStatement();
		rs = stat.executeQuery("select count(*) as cnt from tblAddress");
		
		if (rs.next()) {
			cnt = rs.getInt("cnt");
		}
		
		//기존 업무 > 목록 가져오기
		rs = stat.executeQuery("select * from tblAddress order by name");
		
		//rs.next();
		//System.out.println(rs.getString("name"));
		
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
	
	#tbl1 {
		width: 600px;
	}
	
	#tbl1 th:nth-child(1) { width: 70px; }
	#tbl1 th:nth-child(2) { width: 50px; }
	#tbl1 th:nth-child(3) { width: 50px; }
	#tbl1 th:nth-child(4) { width: 140px; }
	#tbl1 th:nth-child(5) { width: 240px; }
	#tbl1 th:nth-child(6) { width: 100px; }
	
	#tbl1 td { text-align: center; }
	#tbl1 td:nth-child(5) { text-align: left; }
 	
</style>
<script>

	window.onload = function() {
		
	}
	
	function del(seq) {
		if (confirm("정말 삭제하겠습니까?")) {
			location.href = "delok.jsp?seq=" + seq;
		}
	}
	
</script>
</head>
<body>
	<!-- list.jsp -->
	<div class="main">
		<h1>주소록 <small>주소록 목록보기</small></h1>
		<div class="content">
			<table class="table" id="tbl1">
				<tr>
					<th>이름</th>
					<th>나이</th>
					<th>성별</th>
					<th>전화</th>
					<th>주소</th>
					<th>편집</th>
				</tr>
				
				<% if (cnt == 0) { %>
				<tr>
					<td colspan="6">데이터가 없습니다.</td>
				</tr>
				<% } %>
				
				<% while (rs.next()) { %>
				<tr>
					<td><%= rs.getString("name") %></td>
					<td><%= rs.getString("age") %></td>
					<td><%= rs.getString("gender").equals("m") ? "남자" : "여자" %></td>
					<td><%= rs.getString("tel") %></td>
					<td><%= rs.getString("address") %></td>
					<%-- <td><%= rs.getString("regdate").substring(0, 10) %></td> --%>
					<td>
						<a href="edit.jsp?seq=<%= rs.getString("seq") %>">[edit]</a> <!-- 수정하기 페이지 이동 버튼 -->
						<%-- <a href="delok.jsp?seq=<%= rs.getString("seq") %>">[del]</a> --%> <!-- 삭제하기 페이지 이동 버튼 -->
						<a href="#" onclick="del(<%= rs.getString("seq") %>);">[del]</a>
					</td>
				</tr>
				<% } %>
			</table>
			<div class="btns">
				<input type="button" value="추가하기" class="control"
					onclick="location.href='add.jsp';">
			</div>
		</div>
	</div>
</body>
</html>

<% 
	//자원 해제 코드
	rs.close();
	stat.close();
	conn.close();	
%>














