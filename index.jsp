<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
<c:when test="${param.signUp}">
	<jsp:useBean id="signUpUser" class="a.UserBean">
		<jsp:setProperty name="signUpUser" property="*" />
		<c:out value="${signUpUser.registerUser()}" />
	</jsp:useBean>
</c:when>
<c:when test="${param.login}">
	<jsp:useBean id="user" class="a.UserBean">
		<jsp:setProperty name="user" property="contactNumber" value="${param.contactNumber}" />
		<jsp:setProperty name="user" property="password" value="${param.password}"/>
		<c:if test="${user.verifyUser() == 'true'}">
			<jsp:forward page="dash.jsp">
				<jsp:param name="contactNumber" value="${user.contactNumber}" />
			</jsp:forward>
	    </c:if>
	</jsp:useBean>
</c:when>
</c:choose>
<!DOCTYPE html>
<html>
<head>
<title>Login home</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/materialize.min.css">
</head>
<body>
<h2 style="text-align:center; color:#12ef0e;">A Farmer's E-Shop</h2>
<hr/>
	<div class="row">
	<div class="col s3">
	</div>
		<div class="input-field col s6">
			<form class="col s12" action="index.jsp" method="POST">
				<fieldset style="color:#12ef0e">
				<legend style="font-size:25px; font-weight:bold">LOGIN</legend>
					<div class="input-field col s12">
						<i class="material-icons prefix">phone</i> <input name="contactNumber" id="contact"
							type="number" class="validate"> <label for="contact">Contact
							Number</label>
					</div>
					<div class="input-field col s12">
						<i class="material-icons prefix">check</i> <input name="password" id="password"
							type="password" class="validate"> <label for="password">Password</label>
					</div>
					<div class="col s12">
						<div class="col s1"></div>
						<button class="btn waves-effect waves-light col s3" type="submit"
							name="login" value="true">
							LOGIN <i class="material-icons right">send</i>
						</button>
						<div class="col s1"></div>
						<a href="signup.jsp" class="btn waves-effect waves-light col s6"
							name="action">
							<i class="material-icons right">person_add</i>NEW USER HERE? <b>SIGN UP</b> 
						</a>
						<div class="col s1"></div>
					</div>
					
				</fieldset>
			</form>
	
	</div>
</div>

</body>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/materialize.min.js"></script>

</html>
