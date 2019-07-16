<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>jQuery Mobile</title>
<link rel="stylesheet" href="/myhome/asset/css/jquery.mobile-1.4.5.css">
<script src="/myhome/asset/js/jquery-1.12.4.js"></script>
<script src="/myhome/asset/js/jquery.mobile-1.4.5.js"></script>
<style>

</style>
<script>

	$(function() {
		
	});
	
</script>
</head>
<body>
	<!-- views/mobile/ex10.jsp -->
	<div data-role="page">
		<div data-role="header">
			<h1>jQuery Mobile Page</h1>
		</div>
		<div role="main" class="ui-content">
		
			<h2>플립 스위치(checkbox or select)</h2>
			
			<form>
				<input type="checkbox" data-role="flipswitch">
				<input type="checkbox" data-role="flipswitch" checked>
				<input type="checkbox" data-role="flipswitch" data-on-text="켜짐" data-off-text="꺼짐" data-corners="false">
				<select data-role="flipswitch">
					<option>OFF</option>
					<option>ON</option>
				</select>
			</form>
			
			<hr>
		
			<h2>셀렉트 박스</h2>
			
			<form>
				<div>
					<label>
						애완 동물 : 
						<select data-icon="star" data-iconpos="left" data-native-menu="false">
							<option value="1">강아지</option>
							<option value="2">고양이</option>
							<option value="3">병아리</option>
							<option value="4">코끼리</option>
						</select>
					</label>	
				</div>
			</form>
			
			<hr>
			
			<h2>체크박스 & 라디오버튼</h2>
			
			<form>
				<div data-role="controlgroup" data-type="vertical">
					<label><input type="checkbox"> Red</label>
					<label><input type="checkbox"> Yellow</label>
					<label><input type="checkbox"> Blue</label>
				</div>
				<hr>
				<div data-role="controlgroup">
					<label><input type="radio" name="rb"> Agree</label>
					<label><input type="radio" name="rb"> Disagree</label>
				</div>
			</form>
			
			
			<hr>
		
		
		
			<h2>주소록</h2>
			
			<ul data-role="listview" data-inset="true">
				<li data-icon="phone">
					<a href="#">
						<img src="/myhome/asset/images/man_01.png" style="width:100%; height:100%;">
						<h3>홍길동</h3>
						<p>010-2345-6789 / 학교친구</p>
					</a>
				</li>
				<li data-icon="phone">
					<a href="#">
						<img src="/myhome/asset/images/man_02.png" style="width:100%; height:100%;">
						<h3>아무개</h3>
						<p>010-2345-6789 / 학교친구</p>
					</a>
				</li>
				<li data-icon="phone">
					<a href="#">
						<img src="/myhome/asset/images/man_03.png" style="width:100%; height:100%;">
						<h3>테스트</h3>
						<p>010-2345-6789 / 학교친구</p>
					</a>
				</li>
				<li data-icon="phone">
					<a href="#">
						<img src="/myhome/asset/images/woman_01.png" style="width:100%; height:100%;">
						<h3>호호호</h3>
						<p>010-2345-6789 / 학교친구</p>
					</a>
				</li>
			</ul>
			
			
			<hr>
		
			<h2>Count Bubble(Badge) + Icons</h2>
			
			<ul data-role="listview" data-inset="true">
				<li data-icon="check"><a href="#">받은 편지함 <span class="ui-li-count">12</span></a></li>
				<li data-icon="info"><a href="#">보낸 편지함 <span class="ui-li-count">5</span></a></li>
				<li data-icon="back"><a href="#">보관함 <span class="ui-li-count">23</span></a></li>
				<li data-icon="delete"><a href="#">휴지통 <span class="ui-li-count">64</span></a></li>
			</ul>
			
			<hr>
			
			
			
			<h2>자동 구분자</h2>
			
			<ul data-role="listview" data-inset="true" data-autodividers="true">
				<li>가위</li>
				<li>가방</li>
				<li>가자미</li>
				<li>고라니</li>
				<li>나비비안코</li>
				<li>다리</li>
				<li>다다미</li>
				<li>다리미</li>
				<li>다래끼</li>
			</ul>
			
			<hr>
			
			
		
		
			<h2>구분자</h2>
			
			<ul data-role="listview" data-inset="ture">
				
				<li data-role="list-divider">우유가 안들어갔습니다.</li>
				<li>아메리카노</li>
				<li>에스프레소</li>
				<li>더치 커피</li>
				
				<li data-role="list-divider">우유가 들어갔습니다.</li>
				<li>라테</li>
				<li>리스트레또 비안코</li>
				<li>카푸치노</li>
				<li>비엔나</li>
				
			</ul>
			
			
			<hr>
		
		
			<h2>Clickable Item</h2>
			<ul data-role="listview" data-inset="true">
				<li><a href="#coffee1" data-transition="slide">아메리카노</a></li>
				<li><a href="#coffee2" data-transition="slide">에스프레소</a></li>
				<li><a href="#coffee3" data-transition="slide">라테</a></li>
				<li><a href="#coffee4" data-transition="slide">리스트레또 비안코</a></li>
				<li><a href="#coffee5" data-transition="slide">카푸치노</a></li>
			</ul>
			
			<hr>
			
			
			<h2>Inset</h2>
			<ul data-role="listview" data-inset="true">
				<li>아메리카노</li>
				<li>에스프레소</li>
				<li>라테</li>
				<li>리스트레또 비안코</li>
				<li>카푸치노</li>
			</ul>
			
			<hr>
			
			
			<h2>Unorderd List</h2>
			<ul data-role="listview">
				<li>아메리카노</li>
				<li>에스프레소</li>
				<li>라테</li>
				<li>리스트레또 비안코</li>
				<li>카푸치노</li>
			</ul>
			
			<hr>
			
			<h2>Ordered List</h2>
			<ol data-role="listview">
				<li>아메리카노</li>
				<li>에스프레소</li>
				<li>라테</li>
				<li>리스트레또 비안코</li>
				<li>카푸치노</li>
			</ol>
			
		</div>
		<div data-role="footer" data-position="fixed">
			<h4>http://test.com</h4>
		</div>
	</div><!-- page -->
		
		
	<div data-role="page" id="coffee1">
		<div data-role="header">
			<h1>Coffee Info</h1>
		</div>
		<div role="main" class="ui-content">
			<h2>아메리카노</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam deserunt quia ipsa velit nulla facere sit inventore beatae nobis nisi odit sint dicta doloremque commodi nostrum accusantium aperiam. Nesciunt totam!</p>
		</div>
	</div>
	
	<div data-role="page" id="coffee2">
		<div data-role="header">
			<h1>Coffee Info</h1>
		</div>
		<div role="main" class="ui-content">
			<h2>에스프레소</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam deserunt quia ipsa velit nulla facere sit inventore beatae nobis nisi odit sint dicta doloremque commodi nostrum accusantium aperiam. Nesciunt totam!</p>
		</div>
	</div>
	
	<div data-role="page" id="coffee3">
		<div data-role="header">
			<h1>Coffee Info</h1>
		</div>
		<div role="main" class="ui-content">
			<h2>라테</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam deserunt quia ipsa velit nulla facere sit inventore beatae nobis nisi odit sint dicta doloremque commodi nostrum accusantium aperiam. Nesciunt totam!</p>
		</div>
	</div>
	
	<div data-role="page" id="coffee4">
		<div data-role="header">
			<h1>Coffee Info</h1>
		</div>
		<div role="main" class="ui-content">
			<h2>리스트레또 비안코</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam deserunt quia ipsa velit nulla facere sit inventore beatae nobis nisi odit sint dicta doloremque commodi nostrum accusantium aperiam. Nesciunt totam!</p>
		</div>
	</div>
	
	<div data-role="page" id="coffee5">
		<div data-role="header">
			<h1>Coffee Info</h1>
		</div>
		<div role="main" class="ui-content">
			<h2>카푸치노</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam deserunt quia ipsa velit nulla facere sit inventore beatae nobis nisi odit sint dicta doloremque commodi nostrum accusantium aperiam. Nesciunt totam!</p>
		</div>
	</div>
		
	
	
</body>
</html>














