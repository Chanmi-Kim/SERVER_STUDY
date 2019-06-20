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

</style>
<script>

	$(function() {
		
		$(".cat").draggable({
			stop: function(event, ui) {
				//alert("드랍");
				//좌표값?
				//alert(this.id);
				var id = this.id;
				var x = ui.position.left;
				var y = ui.position.top;
				
				//alert(x + " : " + y);
				
				$.ajax({
					type: "GET",
					url: "/AjaxTest/ex08data.do",
					data: "x=" + x + "&y=" + y + "&id=" + id, //x=100&y=50&id=cat1
					dataType: "xml",
					success: function(result) {
						//<result>1</result>
						//<result>0</result>
					},
					error: function(a,b,c) {
						console.log(a,b,c);
					}
				});
				
			}
		});


		/* 
		$("#${dto.catid}").css("left", "${dto.x}px");
		$("#${dto.catid}").css("top", "${dto.y}px"); 
		*/
		
		<c:forEach items="${list}" var="dto">
			$("#${dto.catid}").css("left", "${dto.x}px");
			$("#${dto.catid}").css("top", "${dto.y}px");
		</c:forEach>
		
	});
	
</script>
</head>
<body>
	<!-- ex08.jsp -->
	
	<img src="/AjaxTest/images/catty01.png" id="cat1" class="cat">
	<img src="/AjaxTest/images/catty02.png" id="cat2" class="cat">
	<img src="/AjaxTest/images/catty03.png" id="cat3" class="cat">
	<img src="/AjaxTest/images/catty04.png" id="cat4" class="cat">
	<img src="/AjaxTest/images/catty05.png" id="cat5" class="cat">
	
	<%-- 
	${dto.catid}
	${dto.x}
	${dto.y} 
	--%>
	
</body>
</html>










