<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="inc/asset.jsp" %>
<link rel="shortcut icon" href="favicon.ico">
<style>
	
	#theme .item {
		vertical-align: middle;
		cursor: pointer;
		text-align: center;
	}
	
	#item1 {
		outline: 5px solid black;
	}
	
	#item2 {
		background-color: #555;
		color: white;
	}
	
	#item3 {
		background-color: gold;
		color: tomato;
	}
	
</style>
<script>

	var selectedItem = "item1";
	var colors = [["#333333", "#FFFFFF"], ["#FFFFFF", "#555555"], ["tomato", "gold"]];
	var colors2 = [
		{
			"fore-color": "#333333",
			"back-color": "#FFFFFF"
		},
		{
			"fore-color": "#FFFFFF",
			"back-color": "#555555"
		},
		{
			"fore-color": "tomato",
			"back-color": "gold"
		}
	];
	
	var colors3 = {
		"item1": {
			"fore-color": "#333333",
			"back-color": "#FFFFFF"
		},
		"item2": {
			"fore-color": "#FFFFFF",
			"back-color": "#555555"
		},
		"item3": {
			"fore-color": "tomato",
			"back-color": "gold"
		}
	};
	
	$(function() {
		
		$(".item").click(function() {
			var id = $(this).attr("id");
			selectedItem = id;
			
			changeItem();
			applyItem();
			save();
		});//td.click
		
		
		//이전에 테마를 선택했었다면.. 쿠키값을 읽어서 복구 시키자
		//alert(getCookie("theme"));
		if (getCookie("theme") != "") {
			selectedItem = getCookie("theme");
			changeItem();
			applyItem();
			//save();
		}
		
		
	});//ready()
	
	function changeItem() {
		
		$(".item").css("outline", "0px");
		$("#" + selectedItem).css("outline", "5px solid black");
		
	}
	
	function applyItem() {
		
		//item1
		var index  = selectedItem.substr(4);
		//alert(index);

		//$("body, h1, div, td, p").css("color", colors[index-1][0]);
		//$("body, h1, div, td, p").css("background-color", colors[index-1][1]);
		
		//$("body, h1, div, td, p").css("color", colors2[index-1]["fore-color"]);
		//$("body, h1, div, td, p").css("background-color", colors2[index-1]["back-color"]);
		
		$("body, h1, div, td, p").css("color", colors3[selectedItem]["fore-color"]);
		$("body, h1, div, td, p").css("background-color", colors3[selectedItem]["back-color"]);
	}
	
	function save() {
		//사용자 선택한 값을 쿠키에 저장
		setCookie("theme", selectedItem, 30);
	}
	
</script>
</head>
<body>
	<!-- ex26_cookie_one.jsp -->
	<div class="container">
		<h1>첫번째 페이지(테마 설정)</h1>
		
		<div id="theme">
			<table class="table table-bordered" style="width: 450px; height: 100px;">
				<tr>
					<td class="item" id="item1">Lorem ipsum dolor.</td>
					<td class="item" id="item2">Lorem ipsum dolor.</td>
					<td class="item" id="item3">Lorem ipsum dolor.</td>
				</tr>
			</table>
		</div>
		
		<div>
			<a href="ex26_cookie_one.jsp">첫번째 페이지</a>
			<a href="ex26_cookie_two.jsp">두번째 페이지</a>
			<a href="ex26_cookie_three.jsp">세번째 페이지</a>
		</div>
		
		<h2>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quasi deserunt odit fuga quo illum magnam voluptatum quidem voluptatibus quis. Repellat aliquam nemo perspiciatis ullam laborum dolorum amet ab corporis accusamus.</h2>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odit consequuntur similique facilis fugiat perspiciatis quasi ratione dolorem id? Eius pariatur labore commodi molestiae porro vero repellat dicta autem iusto cumque.</p>
		<p>Mollitia voluptatem aperiam dolorum ipsam ea aliquid ad cumque tempore ex vel sint et facilis perspiciatis modi obcaecati! Sunt expedita totam numquam saepe labore dolorum qui laborum esse reiciendis nobis.</p>
		<p>Fugit aliquid laboriosam reiciendis unde rerum iusto tempore optio excepturi dolore nulla nihil reprehenderit? Similique omnis architecto sed vitae asperiores inventore totam iure fugit modi nostrum ullam nam ut minima.</p>
		<h2>Alias facilis molestiae molestias fugit consectetur corporis odit ab modi sequi non sed et dicta dignissimos praesentium ex ad atque exercitationem officia rem eligendi aliquam nihil facere quae expedita optio.</h2>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto libero quas illum dolores impedit voluptatum ipsa a voluptas nostrum laudantium quia quos accusantium soluta delectus hic natus accusamus deserunt perferendis!</p>
		<p>Amet numquam hic perferendis laudantium atque nisi officiis suscipit itaque ad magnam quam nulla. Esse beatae numquam laborum eum exercitationem at sunt nostrum nemo nisi aut ea autem harum non?</p>
		<p>Modi nisi illo fugiat quasi voluptatum quisquam totam maiores alias culpa consequuntur assumenda sapiente earum voluptatem fuga nemo suscipit numquam delectus error aut quaerat illum dolore facilis ratione debitis quam!</p>
		<h2>Sapiente illum qui nesciunt quisquam id tempore doloribus repellat quod veritatis nulla odit tenetur non quis laborum fugiat magni nisi aliquid placeat reiciendis quaerat. Nobis maiores assumenda cumque quod quibusdam!</h2>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste soluta libero tenetur nihil esse asperiores corporis nostrum architecto illum commodi delectus alias fugit minima enim est earum iusto eveniet nobis.</p>
		<p>Quis illum reprehenderit vitae dolore soluta aperiam dolorem quia debitis ex laudantium consequatur commodi eligendi dolores deleniti in voluptates corrupti? Molestias exercitationem in aperiam odio repellendus distinctio quia doloribus temporibus.</p>
		<p>Ipsam nam voluptates debitis sunt asperiores labore aspernatur non voluptatum corporis nemo distinctio vel minus magnam omnis doloremque doloribus cupiditate aliquam sed placeat consequuntur ab recusandae accusantium facilis amet tempora!</p>
		<h2>Commodi ipsa laudantium quia magni repellat explicabo architecto iure eos temporibus consequuntur dolorem ullam et qui maiores adipisci quos excepturi beatae debitis aspernatur laborum doloribus nesciunt quis veritatis odio voluptatum.</h2>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum veritatis dolore repudiandae itaque inventore explicabo cumque est voluptatibus! Veniam iusto beatae error nulla laudantium a consequatur aspernatur at maxime earum.</p>
		<p>Officia qui laudantium cupiditate itaque nemo nobis esse maiores odit optio dolor. Facere laborum officiis ab perspiciatis accusamus vitae non beatae. Iste quas harum molestiae dignissimos laboriosam aliquam quibusdam animi.</p>
		<p>Totam eaque doloremque dolorem aspernatur neque mollitia ullam optio et vitae aliquid non reprehenderit explicabo nesciunt eos perferendis architecto vero deserunt omnis doloribus obcaecati molestias facere accusamus at veritatis ex.</p>
		<h2>Velit molestiae delectus enim quo tempore sapiente reprehenderit ex labore nisi blanditiis vel nesciunt impedit odio dolores odit rem accusantium a officia ipsam magni ipsum nostrum consequatur optio id similique.</h2>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil quaerat quis magnam distinctio mollitia dolore suscipit quibusdam officia illum tempore nesciunt commodi accusamus dicta perspiciatis autem explicabo dolor aspernatur porro!</p>
		<p>In nostrum quo culpa debitis nisi aliquam corrupti qui aperiam ab illo neque quia error consequuntur laboriosam vero ea eligendi! Sed distinctio ducimus nesciunt tempora quibusdam harum facere necessitatibus. Nobis.</p>
		<p>Ducimus quas dolorum optio eaque obcaecati vero omnis! Ducimus corporis incidunt soluta. Excepturi illo corporis quidem ea eaque veritatis et adipisci expedita quam molestias rem laudantium quod recusandae aperiam ut.</p>
		
	</div>
</body>
</html>











