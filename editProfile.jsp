<%@include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Sign-up</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/materialize.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/materialize.min.css">
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
	input{
		color: black;
	}
	label{
		color: black;
	}
#toast-container {
  top: auto !important;
  right: auto !important;
  bottom: 10%;
  left:42%;  
}
</style>
</head>
<body>
	<div class="row col s9">
		<div class="col s8 offset-s2" style="color: #12ef0e;">
			<form action="editProfile.jsp" method="post">
				<fieldset>
					<legend style="font-size: 25px;">Update Profile</legend>
					<div class="row">
						<div class="input-field col s6">
							<i class="material-icons prefix">account_circle</i> 
							<input name = "fName" id="fName" type="text" class="validate" value="${userInfo.rows[0].fName}">
						</div>
						<div class="input-field col s6">
							<input name="lName" id="lName" type="text" class="validate" value="${userInfo.rows[0].lName}">
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">check</i>
							<input name="password" id="password" type="text" class="validate" value="${userInfo.rows[0].password}">
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">verified_user</i> <input
								name ="confirm" id="confirm" type="text" class="validate">
							<label for="confirm">Confirm Password</label>
						</div>
					</div>
						
							<input name="contactNumber" id="contact" type="number" class="validate" value="${userInfo.rows[0].contactNumber}" hidden>
	
					<div class="row">
						<div class="input-field col s4">
							<i class="material-icons prefix">pin_drop</i> 
							<input name="location" id="location" type="text" class="validate" value="${userInfo.rows[0].location}">
						</div>
						<div class="input-field col s4">
							<i class="material-icons prefix">add_location</i>
							<input name="city" id="city" type="text" class="validate" value="${userInfo.rows[0].city}">
						</div>
						<div class="input-field col s4">
							<i class="material-icons prefix">place</i> 
							<input name="state" id="state" type="text" class="validate" value="${userInfo.rows[0].state}">
						</div>
					</div>

					<div style='text-align: center;'>
						<button class="btn waves-effect waves-light" type="submit"
							name="update" value="true">
							UPDATE PROFILE <i class="material-icons right">send</i>
						</button>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
<c:if test="${param.update}">
	<jsp:useBean id="updateUser" class="a.UserBean">
		<jsp:setProperty name="updateUser" property="*" />

		<c:set var="error" value="${updateUser.updateProfile(contactNumber)}" />
		<c:choose>
			<c:when test="${error == ''}">
				<jsp:forward page="index.jsp">
					<jsp:param name="contactNumber" value="${updateUser.contactNumber}" />
				</jsp:forward>
			</c:when>
			<c:otherwise>
				<script type="text/javascript">
					Materialize.toast('${error}', 1000)
				</script>
			</c:otherwise>
		</c:choose>
	</jsp:useBean>
</c:if>
</body>
</html>