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
        <sql:query var="items">
					SELECT id, Name, Description, itemId, notificationFrom, notificationTo FROM items,notifications where id=itemId and ${contactNumber}= notificationTo  
				</sql:query>

          <sql:update>
            UPDATE notifications
            SET status='1'
            WHERE ${contactNumber}=notificationTo    
          </sql:update>
            

	  		<!-- cards -->


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
</body>
<script type="text/javascript" src="js/script.js"></script>
</html>