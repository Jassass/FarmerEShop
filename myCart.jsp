<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1" name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
	<style>
	  *{
	    box-sizing: border-box;
	  }
	  body{
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
		  left:50%;  
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
					SELECT farmer, Name, MarketRate, Type, ValidUpto, itemId, cart.Quantity, cart.id from items, cart where cart.user = ? and status = 0 and itemId = items.id  
					<sql:param value="${contactNumber}" />
				</sql:query>
			</c:when>
			<c:when test="${userInfo.rows[0].type == 'personal'}">
				<sql:query var="items">
					SELECT farmer, Name, PersonalRate, Type, ValidUpto, itemId, cart.Quantity, cart.id from items, cart where cart.user = ? and status = 0 and itemId = items.id  
					<sql:param value="${contactNumber}" />
				</sql:query>
			</c:when>
		</c:choose>

		<!-- Main body -->
	  	<div class="col s9 main">
		  	
			<c:forEach items="${items.rows}" var="item" varStatus="loop">
				<c:if test="${loop.index % 2 == 1}">
					<div class="row">
				</c:if>
					<div class="col s12 m4 offset-m1">
					<div class="card blue-grey darken-1">
						<div class="card-content white-text">
						<span class="card-title"><b>${item.name}</b></span>
						<ul>
							<li>${item.type}</li>
							<li>${item.marketrate}</li>
							<li>${item.personalrate}</li>
							<li>${item.validUpto}</li>
							<li>${item.farmer}</li>
						</ul>
						</div>
						<div class="card-action white-text">
							<a href="addNotification.jsp?itemId=${item.itemId}&id=${item.id}&sender=${contactNumber}&receiver=${item.farmer}">Buy</a>
							${item.quantity} Kg
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