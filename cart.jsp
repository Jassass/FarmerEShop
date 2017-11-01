<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1" name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
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
		  	
		  	<form>
		  	<div class="row">
		        <div class="input-field col s2 offset-s4">
		          <input type="text" name="searchQuery">
		          <label for="searchQuery">Search</label>
		        </div>
		        <div class="input-field col s3">
		        	<button class="btn-floating waves-effect waves-light" type="submit" name="search" value="true">
						<i class="material-icons right">search</i>
					</button>
		        </div>
			</div>
			</form>
	  		
	  			<c:if test="${param.search}">
	  				<c:set var="likeParam" value="${param.searchQuery}" />
	  			</c:if>
			  <!--database-->
				<sql:query var="items">
					SELECT Name, Description FROM items where name like '%${likeParam}%'
				</sql:query>
			<div id="cards">
	  		<!-- cards -->

				<c:forEach items="${items.rows}" var="item">
								
					<div class="row col m11">
						
						<div class="card horizontal">
							<div class="card-image">
								<img src="images/sample-1.jpg">
								<span class="card-title"><strong>${item.name}</strong></span>
								<a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">add</i></a>
							</div>
							<div class="card-stacked">
								<div class="card-content">
										${item.description}			
								</div>
								<div class="card-action">
									<a href="#">More Info</a>
								</div>
							</div>
						</div>   
					</div>
				</c:forEach>
	  		</div>
	  	</div>
  	
	</div>
  	
</body>
<script type="text/javascript" src="js/script.js"></script>
</html>