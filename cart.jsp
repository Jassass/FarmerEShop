<%@include file="header.jsp"%>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="ISO-8859-1" name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Insert title here</title>
	</head>
	<style>
		* {
			box-sizing: border-box;
		}
		
		body {
			background-image: url("images/backdrop.jpg");
			background-size: cover;
			background-repeat: no-repeat;
			background-attachment: fixed;
			background-position: center;
		}
	</style>

	<body>

		<form id="addItemForm" action="addToCart.jsp" method="post" onsubmit="return addItem()">
			<div id="addToCart" class="modal">
				<div class="modal-content">
					<h4>Enter the Quantity</h4>
					<input type="hidden" name="cartItem" />
					<input name="quantity" id="quantity" type="number" onkeyup="validateQuantity(this)" />
		</form>
		</div>
		<div class="modal-footer">
			<button class="btn waves-effect waves-light" type="submit" name="addItemButton" value="true">Add to Cart</button>
			<a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
		</div>
		</div>
		</form>
		<!-- Main body -->
		<div class="col s9 main" id="main">

			<form>
				<div class="row">
					<div class="input-field col s2 offset-s4">
						<input type="text" name="searchQuery">
						<label for="searchQuery">Search</label>
					</div>
					<div class="input-field col s3">
						<button class="btn-floating waves-effect waves-light" type="submit" name="search" value="true">
						<i class="material-icons right">search</i>
					</button>
					</div>
				</div>
				<div class="fixed-action-btn">
					<a href="#main" class="btn-floating btn-large red tooltipped" data-position="left" data-delay="50" data-tooltip="Back to Top">
						<i class="large material-icons">arrow_upward</i>
					</a>
					<ul>
						<li>
							<a href="notifications.jsp" class="btn-floating green tooltipped" data-position="left" data-delay="50" data-tooltip="Notifications"><i class="material-icons">notifications</i></a>
						</li>
						<li>
							<a href="myCart.jsp" class="btn-floating blue tooltipped" data-position="left" data-delay="50" data-tooltip="My Cart"><i class="material-icons">shopping_cart</i></a>
						</li>
					</ul>
				</div>
			</form>

			<c:if test="${param.search}">
				<c:set var="likeParam" value="${param.searchQuery}" />
			</c:if>
			<!--database-->
			<sql:query var="items">
				SELECT id, Name, Description, Quantity FROM items where name like '%${likeParam}%' and available=1
			</sql:query>
			<div id="cards">
				<!-- cards -->

				<c:forEach items="${items.rows}" var="item">

					<div class="row col m9">

						<div class="card horizontal">
							<div class="card-image">
								<img src="images/sample-1.jpg">
								<span class="card-title"><strong>${item.name}</strong></span>
								<a class="btn-floating halfway-fab waves-effect waves-light red" onclick="add(${item.id}, ${item.quantity})"><i class="material-icons">add_shopping_cart</i></a>
							</div>
							<div class="card-stacked">
								<div class="card-content">
									${item.description}
								</div>
								<div class="card-action">
									<a href="prductInfo.jsp?id=${item.id}">More Info</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

		</div>

	</body>
	<script type="text/javascript" src="js/script.js"></script>
	<script>
	document.getElementById('quantity').valid = false;
</script>

	</html>