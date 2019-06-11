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
	<!-- ex26_cookie_two.jsp -->
	<div class="container">
		<h1>두번째 페이지</h1>
		
		<div>
			<a href="ex26_cookie_one.jsp">첫번째 페이지</a>
			<a href="ex26_cookie_two.jsp">두번째 페이지</a>
			<a href="ex26_cookie_three.jsp">세번째 페이지</a>
		</div>
		
		<h2>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut ipsam odio numquam quibusdam eos doloremque rerum dicta incidunt repellat atque in maiores voluptate explicabo distinctio iure illum voluptatum culpa alias?</h2>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut qui expedita facere ducimus reiciendis. Architecto voluptatibus soluta odio alias sit explicabo ipsam vero deserunt quae corrupti maiores illo ab at.</p>
		<p>Officia pariatur sequi quibusdam omnis sunt molestiae deserunt vero iste eveniet soluta nobis magnam ab itaque nesciunt laborum unde nostrum error! Aliquid quia quis quam dolor facilis ab sit ipsam.</p>
		<p>Tempora in obcaecati quam laborum totam sapiente qui omnis consequuntur earum est aliquid nesciunt corporis cumque sint recusandae dolore nostrum quidem dolorem numquam quos libero. Repellendus corrupti nam sed rem!</p>
		<h2>Ipsam blanditiis earum esse cum explicabo voluptas dolorum veritatis cumque pariatur eos necessitatibus commodi architecto quod laboriosam minus debitis porro illum inventore perferendis quos odit amet dolor aliquam iste mollitia.</h2>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vitae unde nihil vero nostrum itaque optio eveniet ullam debitis omnis alias quidem voluptates veniam nesciunt id vel earum non placeat. Necessitatibus?</p>
		<p>Veritatis praesentium accusamus eum voluptate hic rerum culpa tempora sequi nam iste quia a commodi quo officiis odio rem quod optio inventore ullam laboriosam deserunt qui ratione ut neque eligendi.</p>
		<p>Iste ex atque ea eligendi dolorum odio a cum fuga natus quibusdam qui aut illo unde quasi libero enim blanditiis maiores nemo vitae eum ut debitis esse quo dolorem labore?</p>
		<h2>Sed blanditiis fugiat sunt explicabo laudantium aliquam veniam corrupti officia error ratione vitae magnam esse iure aut excepturi repudiandae similique possimus fugit in eius provident odio ea adipisci facilis eveniet!</h2>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eaque dolore reprehenderit necessitatibus quidem quas amet doloribus aliquam voluptates nostrum natus veritatis debitis accusamus optio a alias repellendus non dignissimos quis.</p>
		<p>Perspiciatis in porro reprehenderit repellendus maxime enim delectus tenetur illo. Eligendi soluta eius nam quisquam architecto odio non. Illum cum voluptatum quae quod qui repudiandae! Velit mollitia repellat ex? Cumque.</p>
		<p>Libero veniam rerum dolore itaque ipsam facere tempore repudiandae optio quas aliquid! Deleniti ratione labore veritatis dolore repellat aspernatur quam placeat porro quos quas sunt nostrum ullam quaerat totam alias!</p>
		<h2>Assumenda incidunt sapiente dolores temporibus. Aliquid temporibus quod saepe nulla tenetur ad id quas quis possimus doloremque praesentium mollitia reiciendis unde. Mollitia porro sint ratione natus laudantium odit alias hic.</h2>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut est accusantium possimus veniam nam id ratione ex odit sit autem quasi sed fugiat cumque fugit ipsum quos explicabo illo repudiandae.</p>
		<p>Harum veniam laudantium quos saepe esse amet voluptates! Labore repudiandae minus sequi dicta praesentium esse vel nihil voluptate rerum totam veritatis animi corporis? Deserunt laboriosam officiis vero excepturi mollitia saepe.</p>
		<p>Unde suscipit sequi a hic omnis vero molestiae voluptatibus eum vel tempora debitis est dolor veniam delectus rem explicabo officiis consequatur odit dolores numquam dicta quos alias repudiandae laborum consectetur?</p>
		<h2>Mollitia quisquam molestias quasi illum libero necessitatibus quis distinctio illo repudiandae fuga praesentium totam eligendi aspernatur incidunt reiciendis! Nostrum fuga modi quibusdam! Cupiditate est ratione odit nostrum laborum dignissimos recusandae.</h2>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nulla placeat officiis accusantium cum quasi voluptatum minima repudiandae dignissimos quod porro maiores est maxime saepe dolorem magnam odio facilis aut. Fugiat?</p>
		<p>Ducimus quasi ut quis accusantium quia nostrum nemo animi suscipit placeat in iure architecto. Hic dolorem molestias reprehenderit mollitia illo provident voluptatum quaerat ab debitis adipisci pariatur ipsa obcaecati maxime.</p>
		<p>Placeat excepturi sequi reprehenderit voluptatem sed provident suscipit est error asperiores optio ipsam enim. Dolore sit labore consequuntur quam aliquid repellendus nemo officiis et dolorum commodi suscipit eum obcaecati iure.</p>
		
	</div>
</body>
</html>











