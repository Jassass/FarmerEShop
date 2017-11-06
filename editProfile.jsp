<%@ include file="header.jsp" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<title>Sign-up</title>
			<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
			<script type="text/javascript" src="js/materialize.min.js"></script>
			<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
			<link rel="stylesheet" type="text/css" href="css/materialize.min.css">
			<script>

	function validateText(element)
	{
		var textPattern =  /^[A-Za-z]{2,20}$/;
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
		
		if(document.getElementById('fName').valid && document.getElementById('lName').valid && document.getElementById('password').valid && document.getElementById('confirm').valid && document.getElementById('location').valid && document.getElementById('city').valid && document.getElementById('state').valid){
			return true;
		}else{
			Materialize.toast('Invalid Submission', 1000)
			return false;
		}
		
	}

</script>
			<style>
				* {
					box-sizing: border-box;
				}
				
				body {
					background-image: url("images/backdrop.jpg");
					background-size: cover;
					background-repeat: no-repeat;
					background-attachment: fixed;
					background-position: center;
				}
				
				input {
					color: black;
				}
				
				label {
					color: black;
				}
				
				#toast-container {
					top: auto !important;
					right: auto !important;
					bottom: 10%;
					left: 42%;
				}
			</style>
		</head>

		<body>
			<div class="row col s9">
				<div class="col s8 offset-s2" style="color: #12ef0e;">
					<form action="editProfile.jsp" method="post" onsubmit="return validateForm(this.form)">
						<fieldset>
							<legend style="font-size: 25px;">Update Profile</legend>
							<div class="row">
								<div class="input-field col s6">
									<i class="material-icons prefix">account_circle</i>
									<input name="fName" id="fName" type="text" value="${userInfo.rows[0].fName}" onkeyup="validateText(this);" class="tooltipped"
										data-position="top" data-delay="50" data-tooltip="Only Alphabets">
								</div>
								<div class="input-field col s6">
									<input name="lName" id="lName" type="text" value="${userInfo.rows[0].lName}" onkeyup="validateText(this);" class="tooltipped"
										data-position="top" data-delay="50" data-tooltip="Only Alphabets">
								</div>
							</div>
							<div class="row">
								<div class="input-field col s12">
									<i class="material-icons prefix">check</i>
									<input name="password" id="password" type="text" value="${userInfo.rows[0].password}" onkeyup="validatePassword(this);" class="tooltipped"
										data-position="top" data-delay="50" data-tooltip="Minimum 7 words"> <label for="password">
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">verified_user</i> <input
								name ="confirm" id="confirm" type="text" onkeyup="validateConfirm(this);" class="tooltipped" data-position="top" data-delay="50" data-tooltip="Must match the password">
							<label for="confirm">Confirm Password</label>
								</div>
							</div>

							<input name="contactNumber" id="contact" type="number" value="${userInfo.rows[0].contactNumber}" hidden>

							<div class="row">
								<div class="input-field col s4">
									<i class="material-icons prefix">pin_drop</i>
									<input name="location" id="location" type="text" value="${userInfo.rows[0].location}" onkeyup="validateAlphaNum(this);" class="tooltipped"
										data-position="top" data-delay="50" data-tooltip="Only Alphabets">
								</div>
								<div class="input-field col s4">
									<i class="material-icons prefix">add_location</i>
									<input name="city" id="city" type="text" value="${userInfo.rows[0].city}" onkeyup="validateText(this);" class="tooltipped"
										data-position="top" data-delay="50" data-tooltip="Only Alphabets">
								</div>
								<div class="input-field col s4">
									<i class="material-icons prefix">place</i>
									<input name="state" id="state" type="text" value="${userInfo.rows[0].state}" onkeyup="validateText(this);" class="tooltipped"
										data-position="top" data-delay="50" data-tooltip="Only Alphabets">
								</div>
							</div>

							<div style='text-align: center;'>
								<button class="btn waves-effect waves-light" type="submit" name="update" value="true">
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
							<c:redirect url="dash.jsp" />
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
		<script>
	document.getElementById('fName').valid = true;
	document.getElementById('lName').valid = true;
	document.getElementById('password').valid = true;
	document.getElementById('confirm').valid = false;
	document.getElementById('location').valid = true;
	document.getElementById('city').valid = true;
	document.getElementById('state').valid = true;
</script>

		</html>