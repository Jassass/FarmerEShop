<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1" name="viewport" content="width=device-width, initial-scale=1.0">
	<title>DashBoard</title>
</head>
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
</html>
