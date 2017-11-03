<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1" name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
	</script>
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
	  	<div class="col s9 main">
		  	
			  <!--database-->
				<sql:query var="items">
					 Select * from items where id=?
					 <sql:param value="${param.id}" />
				</sql:query>

			<div id="cards">
	  		<!-- cards -->
			  	<div class="row col m11">
						
						<div class="card horizontal">
							<div class="card-image">
								<img src="images/sample-1.jpg">
								<span class="card-title"><strong>${items.rows[0].name}</strong></span>
								<a class="btn-floating halfway-fab waves-effect waves-light red" onclick="add()"><i class="material-icons">add</i></a>
							</div>
							<div class="card-stacked">
								<div class="card-content">
										${items.rows[0].description}			
								</div>
								<div class="card-action">
									<a href="#">More Info</a>
								</div>
							</div>
						</div>   
					</div>
	  		</div>
	  	</div>
  	
	</div>
  	
</body>
<script type="text/javascript" src="js/script.js"></script>
</html>