<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!DOCTYPE html>
	<html>

	<head>
		<title>Sign-up</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="js/materialize.min.js"></script>
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="css/materialize.min.css">
		<style>
			* {
				box-sizing: border-box;
			}
			
			body {
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
				left: 15%;
			}
			
			input {
				color: white;
			}
		</style>

		<script>

	function validateText(element)
	{
		var textPattern =  /^[A-Za-z ]{2,20}$/;
		var flag = 0;
		if(element.value == null || !textPattern.test(element.value)){
			flag = 1;
		}
		if(flag==0){
		  $(element).removeClass("invalid");
		  $(element).addClass("valid");
		  element.valid = true;
		}else{
			$(element).removeClass("valid");
		 	$(element).addClass("invalid");
			element.valid = false;
		}
	}

	function validateAlphaNum(element)
	{
		var alphaNumPattern =  /^[A-Za-z0-9\-, ]{2,20}$/;
		var flag = 0;
		if(element.value == null || !alphaNumPattern.test(element.value)){
			flag = 1;
		}
		if(flag==0){
		  $(element).removeClass("invalid");
		  $(element).addClass("valid");
		  element.valid = true;
		}else{
			$(element).removeClass("valid");
		 	$(element).addClass("invalid");
			element.valid = false;
		}
	}

	function validateNumber(element)
	{
		var Pattern =  /^[0-9]{10,10}$/;
		var flag = 0;
		if(element.value == null || !Pattern.test(element.value)){
			flag = 1;
		}
		if(flag==0){
		  $(element).removeClass("invalid");
		  $(element).addClass("valid");
		  element.valid = true;
		}else{
			$(element).removeClass("valid");
		 	$(element).addClass("invalid");
			element.valid = false;
		}
	}

	function validatePassword(element)
	{
		var Pattern =   /^[A-Za-z0-9!@#$%^&*()_]{6,20}$/;
		var flag = 0;
		if(element.value == null || !Pattern.test(element.value)){
			flag = 1;
		}
		if(flag==0){
		  $(element).removeClass("invalid");
		  $(element).addClass("valid");
		  element.valid = true;
		}else{
			$(element).removeClass("valid");
		 	$(element).addClass("invalid");
			element.valid = false;
		}
		validateConfirm(document.getElementById('confirm'));
	}

	function validateConfirm(element)
	{
		var flag = 0;
		if(element.name == 'confirm' && element.value != $('#password').val()){
			flag = 1;
		}
		if(flag==0){
		  $(element).removeClass("invalid");
		  $(element).addClass("valid");
		  element.valid = true;
		}else{
			$(element).removeClass("valid");
		 	$(element).addClass("invalid");
			element.valid = false;
		}
	}

	function validateForm(form)
	{
		
		if(document.getElementById('fName').valid && document.getElementById('lName').valid && document.getElementById('password').valid && document.getElementById('confirm').valid && document.getElementById('contact').valid && document.getElementById('location').valid && document.getElementById('city').valid && document.getElementById('state').valid){
			return true;
		}else{
			Materialize.toast('Invalid Submission', 3000)
			return false;
		}
		
	}
	
</script>

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
				<form action="signup.jsp" id="signUpForm" method="post" onsubmit="return validateForm(this.form)">
					<fieldset>
						<legend style="font-size: 25px;">Sign Up</legend>
						<div class="row">
							<div class="input-field col s6">
								<i class="material-icons prefix">account_circle</i>
								<input name="fName" id="fName" type="text" onkeyup="validateText(this);" class="tooltipped" data-position="top" data-delay="50"
									data-tooltip="Only Alphabets">
								<label for="fName">First Name</label>
							</div>
							<div class="input-field col s6">
								<input name="lName" id="lName" type="text" onkeyup="validateText(this);" class="tooltipped" data-position="top" data-delay="50"
									data-tooltip="Only Alphabets"> <label for="lName">Last Name</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s12">
								<i class="material-icons prefix">check</i>
								<input name="password" id="password" type="password" onkeyup="validatePassword(this);" class="tooltipped" data-position="top"
									data-delay="50" data-tooltip="Minimum 7 words"> <label for="password">Password</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s12">
								<i class="material-icons prefix">verified_user</i> <input name="confirm" id="confirm" type="password" onkeyup="validateConfirm(this);"
									class="tooltipped" data-position="top" data-delay="50" data-tooltip="Must match the password">
								<label for="confirm">Confirm Password</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s12">
								<i class="material-icons prefix">phone</i>
								<input name="contactNumber" id="contact" type="number" onkeyup="validateNumber(this);" class="tooltipped" data-position="top"
									data-delay="50" data-tooltip="10 digit number"> <label for="contact">Contact
								Number</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s4">
								<i class="material-icons prefix">pin_drop</i>
								<input name="location" id="location" type="text" onkeyup="validateAlphaNum(this);" class="tooltipped" data-position="top" data-delay="50"
									data-tooltip="Only Alphabets"> <label for="location">Location</label>
							</div>
							<div class="input-field col s4">
								<i class="material-icons prefix">add_location</i> <input name="city" id="city" type="text" onkeyup="validateText(this);"
									class="tooltipped" data-position="top" data-delay="50" data-tooltip="Only Alphabets"> <label for="city">City</label>
							</div>
							<div class="input-field col s4">
								<i class="material-icons prefix">place</i>
								<input name="state" id="state" type="text" onkeyup="validateText(this);" class="tooltipped" data-position="top" data-delay="50"
									data-tooltip="Only Alphabets"> <label for="state">State</label>
							</div>
						</div>
						<div class="row" style="box-sizing: border-box;">
							<div class="col s3" style="font-size: 30px;">
								Type:
							</div>
							<div class="col s3">
								<input class="with-gap" name="type" type="radio" id="farmer" value="farmer" checked/>
								<label for="farmer">Farmer</label>
							</div>
							<div class="col s3">
								<input class="with-gap" name="type" type="radio" id="market" value="market" />
								<label for="market">Market Consumer</label>
							</div>
							<div class="col s3">
								<input class="with-gap" name="type" type="radio" id="personal" value="personal" />
								<label for="personal">Personal Consumer</label>
							</div>
						</div>


						<div style='text-align: center;'>
							<button class="btn waves-effect waves-light" type="submit" name="signUp" value="true">
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
						<jsp:forward page="login.jsp">
							<jsp:param name="contactNumber" value="${signUpUser.contactNumber}" />
						</jsp:forward>
					</c:when>
					<c:otherwise>
						<script type="text/javascript">
							Materialize.toast("${error}", 3000);
						</script>
					</c:otherwise>
				</c:choose>
			</jsp:useBean>
		</c:if>
	</body>
	<script>
	document.getElementById('fName').valid = false;
	document.getElementById('lName').valid = false;
	document.getElementById('password').valid = false;
	document.getElementById('confirm').valid = false;
	document.getElementById('contact').valid = false;
	document.getElementById('location').valid = false;
	document.getElementById('city').valid = false;
	document.getElementById('state').valid = false;
</script>

	</html>