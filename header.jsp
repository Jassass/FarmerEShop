<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource scope="application" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/farmereshop" user="root" password="" />
<c:set var="contactNumber" value="${param.contactNumber}" />
<c:if test="${contactNumber == null}">
	<jsp:forward page="index.jsp"></jsp:forward>
</c:if>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/materialize.min.css">
	<link rel="stylesheet" type="text/css" href="css/dash.css">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="js/materialize.min.js"></script>
</head>
<body>

	<sql:query var="userInfo">
		Select * from users where contactNumber = ?
		<sql:param value="${contactNumber}" />
	</sql:query>

	<form method="post" id="forwardForm">
		<input type="hidden" name="contactNumber" value="${contactNumber}">
	</form>
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
			    <li id="dash" onclick="forward(this.id)"><a class="waves-effect">Profile</a></li>
			    <li id="addItem" onclick="forward(this.id)"><a class="waves-effect">Add Item</a></li>
			    <li id="cart" onclick="forward(this.id)"><a class="waves-effect">Add to Cart</a></li>
			    <li id="notifications" onclick=""><a class="waves-effect"><span class="new badge">14</span>Notification</a></li>
			    <li><a class="waves-effect" href="logout.jsp">Logout</a></li>
		  	</ul>
	  	</div>

</body>
<script type="text/javascript" src="js/script.js"></script>
</html>