<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${contactNumber != null && contactNumber != ''}">
	<jsp:forward page="dash.jsp"></jsp:forward>
</c:if>
<!DOCTYPE html>
<html>
<head>
<title>Login home</title>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
	#toast-container {
	  top: auto !important;
	  right: auto !important;
	  bottom: 10%;
	  left:38%;  
	}
</style>
</head>
<body>
<div id="google_translate_element"></div><script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en', includedLanguages: 'en,hi', layout: google.translate.TranslateElement.FloatPosition.TOP_RIGHT}, 'google_translate_element');
}
</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
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
							type="number" class="validate" value='<c:out value="${param.contactNumber}" />'> 
							<label for="contact">Contact Number</label>
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
<c:choose>
	<c:when test="${param.login}">
		<jsp:useBean id="user" class="a.UserBean">
			<jsp:setProperty name="user" property="contactNumber" value="${param.contactNumber}" />
			<jsp:setProperty name="user" property="password" value="${param.password}"/>
			<c:choose>
				<c:when test="${user.verifyUser() == 'true'}">
					<c:set var="contactNumber" value="${user.contactNumber}" scope="session"/>
					<jsp:forward page="dash.jsp"></jsp:forward>
			    </c:when>
			    <c:otherwise>
					<script type="text/javascript">
						Materialize.toast('Invalid Number or Password... Try Again', 2000)
					</script>	    	
				</c:otherwise>
			</c:choose>
		</jsp:useBean>
	</c:when>
	<c:otherwise>
		<c:if test="${param.contactNumber != null}">
			<script type="text/javascript">
				Materialize.toast('Successfully Registered!', 2000)
			</script>
		</c:if>
	</c:otherwise>
</c:choose>

</body>
</html>
