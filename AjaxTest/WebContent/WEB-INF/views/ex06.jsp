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
		
		$("#btn1").click(function() {
			
			var ajax = new XMLHttpRequest();
			
			ajax.onreadystatechange = function() {
				if (ajax.readyState == 4 && ajax.status == 200) {
					var result = ajax.responseText; //돌려받은 데이터
					
					if (result == "0") {
						$("#result").text("사용 가능한 아이디입니다.");
					} else {
						$("#result").text("이미 사용중인 아이디입니다.");
					}
				}
			};
			
			ajax.open("GET", "/AjaxTest/ex06data.do?id=" + $("#id").val());
			ajax.send();
			
		});//btn1.click
		
		
		$("#btn2").click(function() {
			
			//ajax.send();
			$.ajax({
				type: "GET", //ajax.open("GET") - 요청 메소드 방식
				url: "/AjaxTest/ex06data.do", //ajax.open("GET", "URL") - 요청 주소
				data: "id=" + $("#id2").val(), //쿼리 스트링 - 서버에게 보낼 데이터
				success: function(result) { //onreadystatechange 이벤트 함수
					//result == ajax.responseText
					//alert(result);
					if (result == "0") {
						$("#result2").text("사용 가능한 아이디입니다.");
					} else {
						$("#result2").text("이미 사용중인 아이디입니다.");
					}
				},
				error: function(a,b,c) { //에러 발생하면 호출
					alert(a + b + c);
				}
			});
			
		});//
		
		
		/* $("#btnSearch").click(function() {
			
			if ($("#search").val() != "") {
				
				$.ajax({
					type: "GET",
					url: "/AjaxTest/ex06address.do",
					data: "search=" + $("#search").val(),
					success: function(result) {
						//alert(result);
						//alert(result.split("\r\n")[0].split(",")[0]);
						
						var list = result.split("\r\n");
						
						for (var i=0; i<list.length; i++) {
							var detail = list[i].split(",");
							
							$("#address1").append("<option>[" + detail[0] + "] " + detail[1] + " " + detail[2] + " " + detail[3] + " " + detail[4] + "</option>");
						}
						
					},
					error: function(a,b,c) {
						console.log(a,b,c);
					}
				});
				
			} else {
				alert("동이름을 입력하세요.");
			}
			
		}); */
		
		
		
		//Ajax - XML(응답 데이터 형식) 
		$("#btnSearch").click(function() {
			
			if ($("#search").val() != "") {
				
				$.ajax({
					type: "GET",
					url: "/AjaxTest/ex06address.do",
					data: "search=" + $("#search").val(),
					dataType: "xml", //응답 데이터의 타입(text, xml, json)
					success: function(result) {
						//console.log(result.constructor);//자료형?? string
						//console.log(result);
						
						//기존 검색 결과 지우기
						$("#address1").html("");
						
						$(result).find("item").each(function(index, item) {
							//console.log($(item).find("zipcode").text());
							$("#address1").append(
													"<option>[" + 
													$(item).find("zipcode").text() + 
													"] " + 
													$(item).find("address").text() + 
													"</option>");	
						});
					},
					error: function(a,b,c) {
						console.log(a,b,c);
					}
				});
				
			} else {
				alert("동이름을 입력하세요.");
			}
			
		});
		
		$("#address1").change(function() {
			$("#address2").focus();
		});
		
		
	});//ready
	
</script>
</head>
<body>
	<!-- ex06.jsp -->
	<div class="container">
		<h1>회원 가입</h1>
		
		<table class="table table-bordered">
			<tr>
				<th>이름</th>
				<td><input type="text"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" id="id" name="id" size="10">
					<input type="button" value="중복검사" id="btn1">
					<span id="result" style="color:tomato;"></span>
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" id="id2" name="id2" size="10">
					<input type="button" value="중복검사" id="btn2">
					<span id="result2" style="color:tomato;"></span>
				</td>
			</tr>
			<tr>
				<th>주소 검색</th>
				<td>
					<input type="text" id="search" placeholder="검색할 동이름">
					<input type="button" value="검색하기" id="btnSearch">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<select id="address1"></select>
				</td>
			</tr>
			<tr>
				<th>상세 주소</th>
				<td><input type="text" id="address2"></td>
			</tr>
		</table>
		
	</div>
</body>
</html>










