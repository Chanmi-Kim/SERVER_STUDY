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
<style>

</style>
<script>
	
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
		if (getCookie("theme") != "") {
			selectedItem = getCookie("theme");
			changeItem();
			applyItem();
			//save();
		}
	});
	
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
	
</script>
</head>
<body>
	<!-- ex26_cookie_three.jsp -->
	<div class="container">
		<h1>세번째 페이지</h1>
		
		<div>
			<a href="ex26_cookie_one.jsp">첫번째 페이지</a>
			<a href="ex26_cookie_two.jsp">두번째 페이지</a>
			<a href="ex26_cookie_three.jsp">세번째 페이지</a>
		</div>
		
		<h2>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia iusto omnis a repellendus sequi vitae quas dolore nulla repellat quam facilis dolor illum obcaecati eaque nam temporibus neque hic modi!</h2>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error porro enim nihil illum harum quos maxime nam ratione est nesciunt repudiandae asperiores nisi culpa veritatis ducimus! Ut voluptas molestias adipisci.</p>
		<p>Repellat tempora assumenda obcaecati voluptas ipsam eligendi voluptatum itaque expedita nulla beatae quis consectetur. Modi ratione laborum delectus consectetur aperiam nisi consequatur ducimus. Mollitia et sint enim vel necessitatibus accusamus.</p>
		<p>Dolore eius nam tempore aspernatur ad nulla reiciendis repellat iste deleniti illum. Reiciendis a rem distinctio! Cum non sint itaque quos porro quis cumque debitis repellat commodi est amet hic.</p>
		<h2>Hic assumenda quia mollitia porro veniam quasi dolore sequi amet saepe necessitatibus corporis modi laudantium ipsa quisquam quis animi alias! Cum modi dicta consectetur nulla iure facere debitis eveniet quisquam!</h2>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores enim reprehenderit magni illo aliquam architecto hic vero suscipit minus deleniti cumque eligendi dolor numquam mollitia quae expedita atque doloremque dicta.</p>
		<p>Doloribus voluptas soluta deserunt placeat odio maxime dolorum eligendi ea molestiae eveniet fuga ab repellat est autem quidem. Libero repellendus tempora ipsum adipisci quis sunt qui eum consectetur fugiat delectus.</p>
		<p>Sed commodi suscipit praesentium temporibus unde pariatur vero quas libero omnis quod dignissimos perspiciatis vitae quis dolorem repellendus facilis sint deserunt illo autem reprehenderit sequi enim nulla accusamus beatae asperiores.</p>
		<h2>Et laboriosam repellat accusantium iusto necessitatibus facere quas debitis fugit dolorum enim tenetur blanditiis accusamus ipsum unde eligendi commodi exercitationem. Esse ipsam tenetur modi commodi sint autem velit facilis tempore!</h2>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quasi quas suscipit consequuntur facere earum quia doloremque assumenda voluptatem consectetur quisquam illum blanditiis voluptates ullam velit possimus atque nihil ut alias.</p>
		<p>Doloribus beatae velit dolores quibusdam saepe tempore itaque aliquam pariatur eligendi possimus libero earum ipsam optio vero quisquam aperiam veritatis asperiores culpa nam modi quod magni nemo. Voluptates possimus rem.</p>
		<p>Nisi sed hic vel debitis ut repellat ratione reprehenderit facere possimus ipsa qui eius inventore impedit quasi nobis aliquid temporibus eaque soluta maiores eligendi at fugiat sapiente. Amet consequatur perferendis.</p>
		<h2>Fuga deserunt corporis dolor perspiciatis expedita veniam accusamus nulla et placeat enim aliquam debitis? Quasi quas autem aperiam esse modi sed facilis. Unde magni architecto praesentium voluptates quos et vero.</h2>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nobis autem blanditiis odit eius voluptate quam et accusamus vel debitis repellat magni ab ratione quis consequuntur quibusdam dolorum voluptatem atque repudiandae?</p>
		<p>Quisquam optio ipsam libero atque earum facilis cumque quasi molestiae modi vel laboriosam ducimus illum id esse ratione nisi perferendis voluptatibus! Voluptate obcaecati officia accusantium corrupti natus omnis odio soluta.</p>
		<p>Doloremque reiciendis deserunt fuga illo ad praesentium perspiciatis assumenda vel modi quibusdam eveniet nulla dolorem quaerat optio voluptas culpa ullam vero voluptatum odit sint laudantium totam architecto asperiores voluptatibus provident.</p>
		<h2>Iste at ut eligendi magni natus quibusdam quaerat id accusamus fugiat a eaque asperiores ullam inventore repudiandae sapiente eum quia distinctio laudantium eos saepe doloribus perferendis sint non similique et.</h2>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error quidem voluptates cupiditate minus sed explicabo repellendus rerum odit eveniet deleniti unde velit blanditiis vel! In delectus quae beatae ad libero!</p>
		<p>Quos omnis a vitae in quidem iste nihil dolor error at necessitatibus placeat dicta praesentium adipisci voluptas beatae amet unde quae odit. Vel incidunt eligendi commodi rerum debitis laborum vero!</p>
		<p>Ipsum nisi suscipit molestias maxime pariatur et provident voluptatibus nesciunt. Quos velit quasi saepe dolor repudiandae dolorum sunt tempore voluptatem illum fugiat ducimus ea reiciendis odio perspiciatis quia deserunt nisi.</p>
		
	</div>
</body>
</html>











