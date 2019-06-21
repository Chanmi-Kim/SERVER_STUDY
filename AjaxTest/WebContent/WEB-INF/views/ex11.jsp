<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="/inc/asset.jsp" %>
<style>

	body { margin: 20px; }
	
	#box { border: 10px solid cornflowerblue; width: 148px; height: 148px; margin-bottom: 10px; position: relative; }
	
	.cat { position: absolute; }
	
	
	
</style>
<script>

	var no = 1;
	var flag = 0;

	$(function() {
		//<img src="/AjaxTest/images/catty01.png" id="cat1" class="cat">
		
		$("#btn1").click(function() {
			
			if (flag == 0) {
				var cat = "<img src='/AjaxTest/images/catty" + getCat() + ".png' id='cat" + no + "' class='cat'>";
				no++;
				
				$("#box").append(cat);
				flag = 1;
				
				$("#box > img").draggable({
					start: function() {
						flag = 0;
					}
				});
				
				$("#box > img").mousedown(function() {
					if (event.button == 1 && flag == 0) {
						$(this).remove();
					}
				});			
				
			}
			
		});
		
	});
	
	function getCat() {
		var n = parseInt(Math.random() * 21) + 1;
		if (n < 10) return "0" + n;
		return n;
	}
	
</script>
</head>
<body>
	<!-- ex11.jsp -->
	<h1>고양이</h1>
	
	<div id="box"></div>
	
	<input type="button" value="고양아~" id="btn1" class="btn btn-primary">
	
	<!--  
	1. 고양이 추가하기 - ajax
		: tblCat 레코드 insert
	
	2. 고양이 움직이기(어제 예제) - ajax
		: tblCat 레코드 update(좌표값)
		
	3. 고양이 삭제하기 - ajax
		: tblCat 레코드 delete
		
	4. 고양이 읽어오기(어제 예제) - 정통 방식
		: tblCat select > 페이지 새로고침
	-->
		
	
</body>
</html>











