<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1" name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
</head>
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
</style>
<body>

<div class="col s8 main">
<sql:update>
  UPDATE notifications
  SET status='1'
  WHERE ${contactNumber}=notificationTo    
</sql:update>


<c:choose>
<c:when test="${userInfo.rows[0].type == 'farmer'}">
<sql:query var="notifications">
  SELECT notifications.itemId, items.name, users.fname, users.contactNumber, notifications.date, cart.ID, cart.quantity FROM notifications,items,users, cart WHERE notifications.notificationTo=${contactNumber} and notifications.itemId=items.id and users.contactNumber=notifications.notificationFrom and notifications.cartId = cart.ID and available=1;
</sql:query>

  <c:forEach items="${notifications.rows}" var="notification" varStatus="loop">
				<c:if test="${loop.index % 2 == 1}">
					<div class="row">
				</c:if>
					<div class="col s12 m4 offset-m1">
					<div class="card blue-grey darken-1">
						<div class="card-content white-text">
						<span class="card-title"><b>${notification.name}</b></span>
						<ul>
							<li>${notification.fname} ${notification.lname}</li>
							<li>${notification.contactNumber}</li>
              <li>${notification.quantity}</li>
              <li>${notification.date}</li>
						</ul>
						</div>
						<div class="card-action white-text">
							<a href="handleNotification.jsp?status=1&cartId=${notification.id}&itemId=${notification.itemId}&quantity=${notification.quantity}">Accept</a>
              <a href="handleNotification.jsp?status=1&cartId=${notification.id}">Decline</a>
						</div>
					</div>
					</div>
				<c:if test="${loop.index % 2  == 1}">
					</div>
				</c:if>
	</c:forEach>
</c:when>
<c:otherwise>
<sql:query var="items">
  SELECT id, Name, Description, itemId, notificationFrom, notificationTo FROM items,notifications where id=itemId and ${contactNumber}= notificationTo and available=1  
</sql:query>

<!--card-->
<div class="col s9">                
<c:forEach items="${items.rows}" var="item">
          <div class="row col m12">
            
            <div class="card horizontal">
              <div class="card-image">
                <img src="images/sample-1.jpg">
                <span class="card-title"><strong>${item.name}</strong></span>
              </div>
              <div class="card-stacked">
                <div class="card-content">
                    ${item.description}     
                </div>
                <div class="card-action">
                  <a href="#"><b>From:</b> ${item.notificationFrom}</a>
                </div>
              </div>
            </div>   
          </div>
        
        </c:forEach>
        </div>
</c:otherwise>
</c:choose>
</div>

</body>
<script type="text/javascript" src="js/script.js"></script>
</html>