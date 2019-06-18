<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Code</title>
	<jsp:include page="/inc/codeasset.jsp"></jsp:include>
	
	<script type="text/javascript" src="/JSPTest/scripts/shCore.js"></script>
	<script type="text/javascript" src="/JSPTest/scripts/${js}"></script>
	
	<link type="text/css" rel="stylesheet" href="/JSPTest/styles/shCoreDefault.css"/>
	<link type="text/css" rel="stylesheet" href="/JSPTest/styles/shThemeMidnight.css"/>
	
	<style>
		#tbl1 th { width: 140px; }
		#tbl1 td { width: 600px; }
		#code, #description {
			resize: none;
			height: 200px;
		}
		#tbl1 td pre { width: 590px !important; /* white-space: pre-wrap; */ }
		#tbl1 tr td > div > div { width: 590px !important; }
		#tbl1 tr td > div > div > table { width: 590px !important; }
	</style>
	<script>
		SyntaxHighlighter.all();
	</script>
</head>
<body>
	
	<!-- add.jsp > view.jsp -->
	<div id="main">
	
		<jsp:include page="/inc/codeheader.jsp"></jsp:include>
		<div id="content">
			
			
			
			
			<table id="tbl1" class="table table-bordered">
				<tr>
					<th>과목</th>
					<td>${dto.categoryName}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${dto.subject}</td>
				</tr>
				<tr>
					<th>코드</th>
					<td>
						<%-- <pre>${dto.code}</pre> --%>
						<pre class="brush: ${brush};">${dto.code}</pre>
					</td>
				</tr>
				<tr>
					<th>설명</th>
					<td>${dto.description}</td>
				</tr>
				<tr>
					<th>날짜</th>
					<td>${dto.regdate}</td>
				</tr>
			</table>
			<div id="btns">
			
				<button type="button" class="btn btn-default" onclick="location.href='/JSPTest/code/list.do';"><span class="glyphicon glyphicon-hand-left"></span> 돌아가기</button>
				
				<button type="button" class="btn btn-success" onclick="location.href='/JSPTest/code/edit.do?seq=${dto.seq}';"><span class="glyphicon glyphicon-saved"></span> 수정하기</button>
				<button type="button" class="btn btn-success" onclick="location.href='/JSPTest/code/delok.do?seq=${dto.seq}';"><span class="glyphicon glyphicon-saved"></span> 삭제하기</button>
				
			</div>
			
		</div>
		<jsp:include page="/inc/codefooter.jsp"></jsp:include>
		
	
	</div>
	
</body>
</html>










