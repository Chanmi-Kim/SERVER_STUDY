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
	
	#tblList th:nth-child(1) { width: 50px; }
	#tblList th:nth-child(2) { width: 440px; }
	#tblList th:nth-child(3) { width: 140px; }
	#tblList th:nth-child(4) { width: 120px; }
	#tblList th:nth-child(5) { width: 50px; }
	
	#tblList td { text-align: center; }
	#tblList td:nth-child(2) { text-align: left; padding-left: 15px; }
	
	#search {
		width: 800px;
		margin: 15px auto;
		text-align: center;
	}
	
	#search select, #search input { display: inline-block; }
	#search #word { width: 300px; }
	
	#pagebar { text-align: center; }

	
</style>
<script>

	$(function() {
		
		$("#selPage").change(function() {
			
			location.href = "/myhome/board/list.do?page=" + $(this).val();
			
		});
		
	});
	
</script>
</head>
<body>
	<!-- views > board > list.jsp -->
	<div id="main">
		<jsp:include page="/inc/header.jsp"></jsp:include>
		<section id="detail">
			
			<h2>Board</h2>
			
			<c:if test="${isSearch}">
			<div style="color: tomato; text-align: center; margin-bottom: 15px;">
				검색한 결과가 총 ${totalCount}개 있습니다.
			</div>
			</c:if>
			
			
			
			<!-- 페이지 이동 도구 -->
			<%-- <div style="width: 850px; text-align: right; margin-bottom: 10px;">
				<select id="selPage">
					<c:forEach var="i" begin="1" end="${totalPage}" step="1">
					<option value="${i}">${i}페이지</option>
					</c:forEach>
				</select>
			</div>
			<script>
				$("#selPage").val(${nowPage});
			</script>
			
			<input type="range" style="width: 800px; margin: 10px auto;"
				min="1" max="${totalPage}" value="${nowPage}" onchange="location.href='/myhome/board/list.do?page=' + this.value;"> --%>
			
			<table id="tblList" class="table table-bordered long">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>이름</th>
					<th>날짜</th>
					<th>읽음</th>
				</tr>
				
				<c:if test="${list.size() == 0}">
				<tr>
					<td colspan="5">등록된 게시물이 없습니다.</td>
				</tr>
				</c:if>
				
				<c:forEach items="${list}" var="dto">
				<tr <c:if test="${dto.notice == 1}">style='background-color:#C8EBFA;'</c:if>>
					<td>
						<c:if test="${dto.notice == 0}">
						${dto.seq}
						</c:if>
						<c:if test="${dto.notice == 1}">
						공지
						</c:if>
					</td>
					<td>
					
						<!--  
						view.do?seq=10
						view.do?seq=10&isSearch=true&column=content&word=집배원
						
						view.do?seq=10&isSearch=false&column=&word=
						view.do?seq=10&isSearch=true&column=content&word=집배원
						
						http://211.63.89.31:8088/myhome/board/view.do?seq=1&isSearch=true&column=content&word=%EA%B2%8C%EC%8B%9C%ED%8C%90
						-->
						
						<!-- 답변글 들여쓰기 -->
						<c:if test="${dto.depth > 0}">
						<span class="glyphicon glyphicon-share-alt" style="margin-left: ${dto.depth * 30}px; color: cornflowerblue;"></span>
						</c:if>
						
						<!-- 제목 -->
						<a href="/myhome/board/view.do?seq=${dto.seq}&isSearch=${isSearch}&column=${column}&word=${word}">${dto.subject}</a>
						
						<!-- 첨부파일 표시 -->
						<c:if test="${not empty dto.filename}">
						<span class="glyphicon glyphicon-floppy-disk" style="color: cornflowerblue;"></span>
						</c:if>
						
						<!-- 댓글수 -->
						<c:if test="${dto.commentcount > 0}">
							<span class="badge" style="font-size: 10px;">${dto.commentcount}</span>
						</c:if>
						
						<!-- 최신글 -->
						<c:if test="${dto.gap < 60}">
							<span class="label label-danger" style="font-size: 10px;">new</span>
						</c:if>
						
						
						
					</td>
					<td>${dto.name}(${dto.id})</td>
					<td>${dto.regdate}</td>
					<td>${dto.readcount}</td>
				</tr>
				</c:forEach>
			</table>
			
			<!-- 검색 창 -->
			<div id="search">
				<form method="GET" action="/myhome/board/list.do">
					<select name="column" id="column" class="form-control short">
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="name">이름</option>
						<option value="id">아이디</option>
					</select>
					<input type="text" name="word" id="word" class="form-control" required>
					<input type="submit" value="검색하기" class="btn btn-default">
				</form>
			</div><!-- search -->
			<c:if test="${isSearch}">
			<script>
				$("#column").val("${column}");
				$("#word").val("${word}");
			</script>
			</c:if>
			
			<div id="pagebar">
				${pagebar}
			</div>
			
			<div class="btns long">
				<c:if test="${not empty id}">
				<input type="button" value="글쓰기" class="btn btn-default"
					onclick="location.href='/myhome/board/add.do';">
				</c:if>
			</div>
			
		</section>
	</div>
	
</body>
</html>











