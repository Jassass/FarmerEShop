<!DOCTYPE html>
<html>
<head>
<title>Sign-up</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/materialize.min.css">
</head>
<body>
	<h2 style="text-align: center; color: #12ef0e;">A Farmer's E-Shop</h2>
	<hr />
	<div class="row">
		<div class="col s8 offset-s2" style="color: #12ef0e;">
			<form action="index.jsp" method="post">
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
</body>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/materialize.min.js"></script>

</html>