<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1" name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/materialize.min.css">
	<link rel="stylesheet" type="text/css" href="css/dash.css">
</head>
<body>

	<jsp:useBean id="user" class="a.UserBean" scope="session">
	</jsp:useBean>

	<sql:setDataSource scope="application" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/farmereshop" user="root" password="" />
	<sql:query var="userInfo">
		Select * from users where contactNumber = ?
		<sql:param value="${user.contactNumber}" />
	</sql:query>

	<!-- Main Header -->
	<nav>
	    <div class="nav-wrapper light-green accent-3">
	      <a href="#!" class="brand-logo center">Farmers E-Shop</a>
	    </div>
  	</nav>

	<div class="row">
		<!-- Side Navbar -->
		<div class="col s3">
			<ul id="slide-out" class="side-nav fixed">
				<li><div class="light-green accent-3 user-view">
				  <i class="material-icons md-light large">account_circle</i>
			      <a href="#!name"><span class="name"><c:out value="${userInfo.rows[0].fName }" /> <c:out value="${userInfo.rows[0].lName }" /></span></a>
			      <a href="#!email"><span class="number"><c:out value="${userInfo.rows[0].contactNumber }" /></span></a>
			    </div></li>
			    <li class="active"><a class="waves-effect" href="/FarmerEShop/dash.jsp">Profile</a></li>
			    <li><a class="waves-effect" href="/FarmerEShop/addItem.html">Add Item</a></li>
			    <li><a class="waves-effect" href="/FarmerEShop/cart.html">Add to Cart</a></li>
			    <li><a class="waves-effect" href="#!"><span class="new badge">14</span>Notification</a></li>
			    <li><a class="waves-effect" href="#!">Logout</a></li>
		  	</ul>
	  	</div>
	  	
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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/materialize.min.js"></script>
</html>