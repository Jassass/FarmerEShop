<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Item</title>
</head>
<body>

		<!-- Main body -->
		<div class="col s9 main">
			<form class="col s12" action="p4.jsp" method="post">
				<div class="row">
					<div class="radioInline col s4 offset-s3">
						<font size="5px">Type:</font>
						<p class="radioP">
							<input name="type" type="radio" id="test1" /> <label
								for="test1">Wheat</label>
						</p>
						<p class="radioP">
							<input name="type" type="radio" id="test2" /> <label
								for="test2">Vegetable</label>
						</p>
						<p class="radioP">
							<input name="type" type="radio" id="test3" /> <label
								for="test3">Fruit</label>
						</p>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s6">
						<i class="material-icons prefix">blur_circular</i> <input id="name"
							type="text" class="validate" name="name" required> <label
							for="name">Name</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s6">
						<i class="material-icons prefix">rate_review</i> <input id="rateM"
							type="text" class="validate" name="rateM" required> <label
							for="rateM">Market Rate</label>
					</div>
					<div class="input-field col s6">
						<i class="material-icons prefix">rate_review</i> <input id="rateP"
							type="text" class="validate" name="rateP" required> <label
							for="rateP">Personal Rate</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s6">
						<i class="material-icons prefix">add_box</i> <input id="quantity"
							type="text" class="validate" name="quantity" required> <label
							for="quantity">Quantity</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s10">
						<i class="material-icons prefix">description</i>
						<textarea name="description" id="desc" class="materialize-textarea"></textarea>
						<label for="desc">Description</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s6">
						<i class="material-icons prefix">date_range</i> <input type="text"
							class="datepicker" name="validUpto" id="validUpto"> <label for="validUpto">Valid Upto</label>
					</div>
				</div>
				<div class="row">
					<div class="col s3 offset-s4">
						<button class="btn waves-effect waves-light" type="submit"
							name="action">
							Submit <i class="material-icons right">send</i>
						</button>
					</div>
				</div>
			</form>
		</div>

	</div>

</body>
</html>