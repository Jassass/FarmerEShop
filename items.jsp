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
  .right{
    text-align: right;
  }
</style>
<body>


<div class="col s8 main">

<!--for all the items farmer has added or check 'farmer' in items table.-->
<sql:query var="items">
  SELECT id, Name, Description, Quantity FROM items where farmer='${contactNumber}' and available=1  
</sql:query>

<!--card-->
<c:forEach items="${items.rows}" var="item">
<div class="col m12">                

          <div class="row">
            
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
                  <b>Quantity left:</b> ${item.quantity}
                  <span class="right">
                    <b>Delete Item:</b>
                    <a href="delete.jsp?id=${item.id}" class="btn-floating btn-large red">
                     <i class="large material-icons">delete_forever</i>
                    </a>
                  </span>
                </div>
              </div>
            </div>   
          </div>
        
       
        </div>
        

        </c:forEach>
        

</div>

</body>
<script type="text/javascript" src="js/script.js"></script>
</html>