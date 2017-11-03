<%@include file="header.jsp"%>
<sql:update>
	Create Table if not exists cart${contactNumber}(ID int NOT NULL AUTO_INCREMENT, itemId int , quantity int not null, status int default 0, PRIMARY KEY (ID), FOREIGN KEY (itemId) REFERENCES items(id))
</sql:update>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1" name="viewport" content="width=device-width, initial-scale=1.0">
	<title>DashBoard</title>
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

		<!-- Main body -->

	  	<div class="col s8 main">
	  		<table class="bordered centered responsive-table" style="margin-top: 10%;">
	          <c:forEach items="${userInfo.rows[0]}" var = "column">
	          	<tr>
	              <th><c:out value="${column.key}" /></th>
	              <td><c:out value="${column.value}" /></td>
	          	</tr>
	          </c:forEach>
      		</table>
	  	</div>
  	
	</div>
  	
</body>
<script type="text/javascript" src="js/script.js"></script>
</html>
