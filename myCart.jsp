<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1" name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
	<script>
		function fireNotification(itemId, id, sender, receiver){
			console.log(itemId, id);
			$.get("addNotification.jsp",
			{
				itemId: itemId,
				id: id,
				sender: sender,
				receiver: receiver
			},
			function(data, status){
			});
		}
	</script>
</head>
<body>

		<c:choose>
			<c:when test="${userInfo.rows[0].type == 'market'}">
				<sql:query var="items">
					SELECT farmer, Name, MarketRate, Type, ValidUpto, itemId, cart.Quantity, cart.id from items,cart${contactNumber} as cart where status = 0 and itemId = items.id  
				</sql:query>
			</c:when>
			<c:when test="${userInfo.rows[0].type == 'personal'}">
				<sql:query var="items">
					SELECT farmer, Name, PersonalRate, Type, ValidUpto, itemId, cart.Quantity, cart.id from items,cart${contactNumber} as cart where status = 0 and itemId = items.id  
				</sql:query>
			</c:when>
		</c:choose>

		<!-- Main body -->
	  	<div class="col s9 main">
		  	
		  	<form>
		  		<div class="row">
			        <div class="input-field col s2 offset-s4">
			          <input id="search" type="text" name="searchQuery">
			          <label for="search">Search</label>
			        </div>
			        <div class="input-field col s3">
			        	<button class="btn-floating waves-effect waves-light" type="submit" name="action">
    						<i class="material-icons right">search</i>
  						</button>
			        </div>
			     </div>
		  	</form>
	  		
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
							<a onclick="fireNotification(${item.itemId}, ${item.id}, ${contactNumber}, ${item.farmer})">Buy</a>
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