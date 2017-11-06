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
    
    #toast-container {
      top: auto !important;
      right: auto !important;
      bottom: 10%;
      left: 50%;
    }
  </style>

  <body>

    <div class="col s8 main">
          <sql:query var="items">
            SELECT items.name, items.farmer, accepted.status FROM accepted, cart, items where cart.user = ${contactNumber} and accepted.cartId = cart.id and items.id = cart.itemId;
          </sql:query>

          <!--card-->
          <c:forEach items="${items.rows}" var="item" varStatus="loop">
				<c:if test="${loop.index % 2 == 1}">
					<div class="row">
				</c:if>
				<div class="col s12 m4 offset-m1">
					<div class="card blue-grey darken-1">
						<div class="card-content white-text">
							<span class="card-title"><b>NAME ${item.name}</b></span>
							<ul>
                                <c:choose>
                                    <c:when test="${item.status == 1}">
                                        Item Accepted
                                    </c:when>
                                    <c:when test="${item.status == 0}">
                                        Item Rejected
                                    </c:when>
                                </c:choose>
                                <hr />
                                ${item.farmer}
							</ul>
						</div>

					</div>
				</div>
				<c:if test="${loop.index % 2  == 1}">
					</div>
				</c:if>
			</c:forEach>
    </div>

    <sql:update>
		delete from accepted where cartId in (Select id from cart where user = ?)
	    <sql:param value="${contactNumber}" />
    </sql:update>

  </body>
  <script type="text/javascript" src="js/script.js"></script>

  </html>