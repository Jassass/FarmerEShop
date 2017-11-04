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
	background-image: url("images/sign.jpg");
	background-size: cover;
	background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center; 
}
#toast-container {
  top: auto !important;
  right: auto !important;
  bottom: 10%;
  left:42%;  
}
input{
color: white;
}
</style>
</head>
<body>
<div id="google_translate_element"></div><script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en', includedLanguages: 'en,hi', layout: google.translate.TranslateElement.FloatPosition.TOP_RIGHT}, 'google_translate_element');
}
</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
	<h2 style="text-align: center; color: #12ef0e;">A Farmer's E-Shop</h2>
	<hr />
	<div class="row">
		<div class="col s8 offset-s2" style="color: #12ef0e;">
			<form action="signup.jsp" method="post">
				<fieldset>
					<legend style="font-size: 25px;">Sign Up</legend>
					<div class="row">
						<div class="input-field col s6">
							<i class="material-icons prefix">account_circle</i> 
							<input name = "fName" id="fName" type="text" class="validate"> <label
								for="fName">First Name</label>
						</div>
						<div class="input-field col s6">
							<input name="lName" id="lName" type="text" class="validate"> <label
								for="lName">Last Name</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">check</i>
							<input name="password" id="password" type="password" class="validate"> <label for="password">Password</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">verified_user</i> <input
								name ="confirm" id="confirm" type="password" class="validate"> <label
								for="confirm">Confirm Password</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">phone</i> 
							<input name="contactNumber" id="contact" type="number" class="validate"> <label for="contact">Contact
								Number</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s4">
							<i class="material-icons prefix">pin_drop</i> 
							<input name="location" id="location" type="text" class="validate"> <label for="location">Location</label>
						</div>
						<div class="input-field col s4">
							<i class="material-icons prefix">add_location</i> <input name="city" id="city" type="text" class="validate"> <label
								for="city">City</label>
						</div>
						<div class="input-field col s4">
							<i class="material-icons prefix">place</i> 
							<input name="state" id="state" type="text" class="validate"> <label for="state">State</label>
						</div>
					</div>
					<div class="row" style="box-sizing: border-box;">
						<div class="col s3" style="font-size: 30px;">
							Type:
						</div>
						<div class="col s3">
							<input class="with-gap" name="type" type="radio" id="farmer" value="farmer"/>
							<label for="farmer">Farmer</label>
						</div>
						<div class="col s3">
							<input class="with-gap" name="type" type="radio" id="market" value="market"/>
							<label for="market">Market Consumer</label>
						</div>
						<div class="col s3">
							<input class="with-gap" name="type" type="radio" id="personal" value="personal"/>
							<label for="personal">Personal Consumer</label>
						</div>
					</div>


					<div style='text-align: center;'>
						<button class="btn waves-effect waves-light" type="submit"
							name="signUp" value="true">
							SUBMIT <i class="material-icons right">send</i>
						</button>
					</div>
				</fieldset>
			</form>
		</div>
	</div>

<c:if test="${param.signUp}">
	<jsp:useBean id="signUpUser" class="a.UserBean">
		<jsp:setProperty name="signUpUser" property="*" />
		<c:set var="error" value="${signUpUser.registerUser()}" />
		<c:choose>
			<c:when test="${error == ''}">
				<jsp:forward page="index.jsp">
					<jsp:param name="contactNumber" value="${signUpUser.contactNumber}" />
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