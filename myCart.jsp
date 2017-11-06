<%@include file="header.jsp"%>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="ISO-8859-1" name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Insert title here</title>
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
			
			#toast-container {
				top: auto !important;
				right: auto !important;
				bottom: 10%;
				left: 50%;
			}
		</style>
	</head>

	<body>
		<c:if test="${param.status}">
			<script type="text/javascript">
				Materialize.toast('Notified to Farmer', 1000)
			</script>
		</c:if>
		<c:choose>
			<c:when test="${userInfo.rows[0].type == 'market'}">
				<sql:query var="items">
					SELECT farmer, Name, MarketRate, Type, ValidUpto, itemId, cart.Quantity, cart.id from items, cart where cart.user = ? and
					status = 0 and itemId = items.id
					<sql:param value="${contactNumber}" />
				</sql:query>
			</c:when>
			<c:when test="${userInfo.rows[0].type == 'personal'}">
				<sql:query var="items">
					SELECT farmer, Name, PersonalRate, Type, ValidUpto, itemId, cart.Quantity, cart.id from items, cart where cart.user = ? and
					status = 0 and itemId = items.id
					<sql:param value="${contactNumber}" />
				</sql:query>
			</c:when>
		</c:choose>

		<!-- Main body -->
		<div class="col s9 main">
			<div id="main"></div>
			<div class="fixed-action-btn">
				<a href="#main" class="btn-floating btn-large red tooltipped" data-position="left" data-delay="50" data-tooltip="Back to Top">
					<i class="large material-icons">arrow_upward</i>
				</a>
				<ul>
					<li>
						<a href="notifications.jsp" class="btn-floating green tooltipped" data-position="left" data-delay="50" data-tooltip="Notifications"><i class="material-icons">notifications</i></a>
					</li>
					<li>
						<a href="cart.jsp" class="btn-floating blue tooltipped" data-position="left" data-delay="50" data-tooltip="Add to Cart"><i class="material-icons">add_shopping_cart</i></a>
					</li>
				</ul>
			</div>
			<c:forEach items="${items.rows}" var="item" varStatus="loop">
				<c:if test="${loop.index % 2 == 1}">
					<div class="row">
				</c:if>
				<div class="col s12 m4 offset-m1">
					<div class="card blue-grey darken-1">
						<div class="card-content white-text">
							<span class="card-title"><b>NAME ${item.name}</b></span>
							<ul>
								<li>TYPE ${item.type}</li>
								<li>RATE ${item.marketrate}</li>
								<li>RATE ${item.personalrate}</li>
								<li>VALID UPTO ${item.validUpto}</li>
								<li>CONTACT ${item.farmer}</li>
							</ul>
						</div>
						<div class="card-action white-text">
							<a href="addNotification.jsp?itemId=${item.itemId}&id=${item.id}&sender=${contactNumber}&receiver=${item.farmer}">Buy</a>

							<a href="deleteFromMyCart.jsp?id=${item.id}">Delete</a> ${item.quantity} Kg

							<c:choose>
								<c:when test="${userInfo.rows[0].type == 'market'}">
									Rs. ${item.marketrate*item.quantity}
								</c:when>
								<c:when test="${userInfo.rows[0].type == 'personal'}">
									Rs. ${item.personalrate*item.quantity}
								</c:when>
							</c:choose>
						</div>

					</div>
				</div>
				<c:if test="${loop.index % 2  == 1}">
					</div>
				</c:if>
			</c:forEach>

		</div>

		</div>

	</body>
	<script type="text/javascript" src="js/script.js"></script>

	</html>