<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
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
