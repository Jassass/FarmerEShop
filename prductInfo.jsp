<%@include file="header.jsp"%>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="ISO-8859-1" name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Insert title here</title>
		</script>
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

		<!-- Main body -->
		<div class="col s9 main">

			<!--database-->
			<sql:query var="items">
				Select * from items where id=?
				<sql:param value="${param.id}" />
			</sql:query>

			<div id="cards">
				<!-- cards -->
				<div class="row col m11">

					<div class="card horizontal">

						<div class="card-stacked">
							<br>
							<pre>
								<span class="card-title">PRODUCT NAME 		  ${items.rows[0].name}</span>
								<div class="card-content">
									PRODUCT TYPE ${items.rows[0].type}
									<hr> QUANTITY AVAILABLE ${items.rows[0].quantity} kg
									<hr> PERSONAL RATE Rs ${items.rows[0].PersonalRate} per kg
									<hr> MARKET RATE Rs ${items.rows[0].MarketRate} per kg
									<hr> VALID UPTO ${items.rows[0].validUpto}
									<hr> DESCRIPTION ${items.rows[0].description}
								</div>
							</pre>
							<div class="card-action">
								<a href="cart.jsp">Back</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		</div>

	</body>
	<script type="text/javascript" src="js/script.js"></script>

	</html>