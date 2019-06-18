<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Code</title>
	<jsp:include page="/inc/codeasset.jsp"></jsp:include>
	<style>
		#tbl1 th { width: 140px; }
		#tbl1 td { width: 600px; }
		#code, #description {
			resize: none;
			height: 200px;
		}
	</style>
	<script>
	
	</script>
</head>
<body>
	
	<div id="main">
	
		<jsp:include page="/inc/codeheader.jsp"></jsp:include>
		<div id="content">
			
			<form method="POST" action="/JSPTest/code/editok.do">
			<table id="tbl1" class="table table-bordered">
				<tr>
					<th>과목</th>
					<td>
								
						<div class="btn-group" data-toggle="buttons">
							<c:forEach items="${clist}" var="cdto" varStatus="status">
							<label class="btn btn-default <c:if test="${dto.category == cdto.seq}">active</c:if>" style="color:${cdto.color};font-weight:bold;">
								<input type="radio" name="category" value="${cdto.seq}" id="c${cdto.seq}" <c:if test="${dto.category == cdto.seq}">checked</c:if>> ${cdto.name}
							</label>
							</c:forEach> 
						</div>
						
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject" id="subject" class="form-control" required value="${dto.subject}"></td>
				</tr>
				<tr>
					<th>코드</th>
					<td><textarea name="code" id="code" class="form-control" required>${dto.code}</textarea></td>
				</tr>
				<tr>
					<th>설명</th>
					<td><textarea name="description" id="description" class="form-control" required>${dto.description}</textarea></td>
				</tr>
			</table>
			<div id="btns">
				<button type="button" class="btn btn-default"><span class="glyphicon glyphicon-hand-left"></span> 돌아가기</button>
				<button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-saved"></span> 수정하기</button>
			</div>
			
			<!-- 수정할 글번호 같이 넘기기 -->
			<input type="hidden" name="seq" value="${dto.seq}">
			</form>
		</div>
		<jsp:include page="/inc/codefooter.jsp"></jsp:include>
		
	
	</div>
	
</body>
</html>










