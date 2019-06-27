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
	
	#tblView th { width: 150px; }
	#tblView td { width: 650px; }
	#tblView #content { height: 300px; }
	
	#tblAddComment { width: 700px; margin-top: 30px; margin-bottom: 15px; }
	#tblAddComment textarea { width: 600px; height: 100px; }
	#tblAddComment input { height: 100px; }
	
	#tblListComment { width: 720px; margin-top: 15px; margin-bottom: 15px; }
	#tblListComment td:nth-child(1) { width: 570px; }
	#tblListComment td:nth-child(2) { 
		width: 150px;
		text-align: center; 
	}
	#tblListComment td:nth-child(2) div:nth-child(2) {
		font-size: 12px;
	}
	
	
	
	.pic {
		float: left;
		width: 100px;
		height: 100px;
		margin: 10px;
		margin-top: 4px;
		background-repeat: no-repeat;
		background-size: contain;
		background-position: center center;
	}
	
	#tblListComment td > div:nth-child(2) {
		font-size: 20px;
		color: #777;
	}
	
	#tblListComment td > div:nth-child(2):before {
		content: open-quote;
		font-size: 2em;
	}
	
	#tblListComment td > div:nth-child(2):after {
		content: close-quote;
		font-size: 2em;
		/* transform: translate(0px, 25px);
		display: inline-block;
		margin-top: -15px; */
	}
	
	#tblListComment td {
		position: relative;
	}
		
	#tblListComment td > div:nth-child(3) {
		position: absolute;
		bottom: 5px;
		right: 10px;
		color: #999;
	}
	
	#tblListComment td > div:nth-child(3) > span {
		display: none;
		cursor: pointer;
		color: tomato;
	}
	
	#tblListComment td:hover > div:nth-child(3) > span {
		display: inline;
	}
	
	
</style>
<script>

	$(function() {
		
	});
	
	
	//댓글 수정
	function edit(span, seq) {
		
		var content = $(span).parent().prev().text();
		//alert(content);
		$("#tblAddComment textarea").val(content);
		
		$("#tblAddComment input[type=submit]").val("댓글 수정");
		
		$("#tblAddComment textarea").focus();
		
		
		$("#cform").attr("action", "/myhome/board/editcomment.do");
		$("#cform input[name=seq]").val(seq);
		
	}
	
	
	function del(seq) {
		if (confirm("댓글을 삭제하겠습니까?")) {
			location.href = "/myhome/board/delcomment.do?pseq=${dto.seq}&seq=" + seq;
		}
	}
	
</script>
</head>
<body>
	<!-- views > board > add.jsp -> view.jsp -->
	<div id="main">
		<jsp:include page="/inc/header.jsp"></jsp:include>
		<section id="detail">
			
			<h2>Board</h2>
			
			
			<table id="tblView" class="table table-bordered long">
				<tr>
					<th>번호</th>
					<td>${dto.seq}</td>
				</tr>
				<tr>
					<th>이름(아이디)</th>
					<td>${dto.name}(${dto.id})</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${dto.subject}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td id="content">${dto.content}</td>
				</tr>
				<tr>
					<th>날짜</th>
					<td>${dto.regdate}</td>
				</tr>
				<tr>
					<th>접속IP</th>
					<td>${dto.userip}</td>
				</tr>
				<tr>
					<th>읽음</th>
					<td>${dto.readcount}회</td>
				</tr>
			</table>
			
			<div class="btns long">
			
				<c:if test="${(not empty id && id == dto.id) || lv == 2}">
				<input type="button" value="수정하기" class="btn btn-default"
					onclick="location.href='/myhome/board/edit.do?seq=${dto.seq}';">
				<input type="button" value="삭제하기" class="btn btn-default"
					onclick="location.href='/myhome/board/del.do?seq=${dto.seq}';">
				</c:if>
					
				<input type="button" value="돌아가기" class="btn btn-default"
					onclick="location.href='/myhome/board/list.do?column=${column}&word=${word}';">
			</div>
			
			
			<!-- 댓글 -->
			<form id="cform" method="POST" action="/myhome/board/addcomment.do">
				<table id="tblAddComment" class="table table-bordered long">
					<tr>
						<td>
							<textarea name="content" class="form-control" required></textarea>
						</td>
						<td>
							<input type="submit" value="댓글 쓰기" class="btn btn-default">
						</td>
					</tr>
				</table>
				<!-- 부모글번호 -->
				<input type="hidden" name="pseq" value="${dto.seq}">
				<!-- 수정 or 삭제 댓글번호 -->
				<input type="hidden" name="seq">
			</form>
			
			<%-- 
			<table id="tblListComment" class="table table-bordered long">
				<c:forEach items="${clist}" var="cdto">
				<tr>
					<td>${cdto.content} [e][d]</td>
					<td>
						<div>${cdto.name}(${cdto.id})</div>
						<div>${cdto.regdate}</div>
					</td>
				</tr>
				</c:forEach>
			</table> 
			--%>
			
			<table id="tblListComment" class="table table-bordered long">
				<c:forEach items="${clist}" var="cdto">
				<tr>
					<td>
						<div class="pic" style="background-image: url(/myhome/pic/${cdto.id}.png);"></div>
						<div>${cdto.content}</div>
						<div>
							
							<c:if test="${(not empty id && id == cdto.id) || lv == 2}">
								<!-- edit.do?seq=${dto.seq} -->
								<span onclick="edit(this, ${cdto.seq});">[edit]</span>
								<span onclick="del(${cdto.seq})">[delete]</span> 
							</c:if>
							
							
							${cdto.regdate} ${cdto.name}(${cdto.id})
						</div>
					</td>
				</tr>
				</c:forEach>
			</table>
			
			
		</section>
	</div>
	
</body>
</html>











