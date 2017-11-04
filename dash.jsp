<%@include file="header.jsp"%>
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
<!-- Edit button for editing profile  -->
	  	<div style="color:white; ">
        Edit Profile
        <a href="editProfile.jsp" class="btn-floating btn-large red">
         <i class="large material-icons">mode_edit</i>
        </a>
        </div>
  	
	</div>

</body>
<script type="text/javascript" src="js/script.js"></script>
</html>
