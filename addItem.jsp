<%@include file="header.jsp"%>
    <!DOCTYPE html>
    <html>

    <head>

        <script>
$(document).ready(function() {
    $('select').material_select();
});

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

	function validateNumber(element)
	{
		var Pattern =  /^[0-9]{1,10}$/;
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

    function validateDescription(element)
	{
        console.log('call');
		var Pattern =  /^[A-Za-z ,]{10,500}$/;
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

    function validateDate(element){
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth()+1; //January is 0!

        var yyyy = today.getFullYear();
        if(dd<10){
            dd='0'+dd;
        } 
        if(mm<10){
            mm='0'+mm;
        } 
        var today = yyyy + '-' + mm + '-' + dd ;
        if(element.value != null && element.value.localeCompare(today) == 1){
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
		
		if(document.getElementById('name').valid && document.getElementById('rateM').valid && document.getElementById('rateP').valid && document.getElementById('desc').valid && document.getElementById('validUpto').valid){
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
        </style>
    </head>

    <body>

        <sql:query var="sellto">
            SELECT contactNumber,fName,lName,location FROM users where type!='farmer'
        </sql:query>
        <!-- Main body -->
        <div class="col s9 main">
            <form class="col s12" action="addItem.jsp" method="post" onsubmit="return validateForm(this.form)">
                <div class="row">
                    <div class="radioInline col s4 offset-s3">
                        <font size="5px">Type:</font>
                        <p class="radioP">
                            <input name="type" type="radio" id="test1" value="grain" checked />
                            <label for="test1">Grain</label>
                        </p>
                        <p class="radioP">
                            <input name="type" type="radio" id="test2" value="vegetable" />
                            <label for="test2">Vegetable</label>
                        </p>
                        <p class="radioP">
                            <input name="type" type="radio" id="test3" value="fruit" />
                            <label for="test3">Fruit</label>
                        </p>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">blur_circular</i>
                        <input id="name" type="text" name="name" onchange="validateText(this);" class="tooltipped" data-position="top" data-delay="50"
                            data-tooltip="Only Alphabets">
                        <label for="name">Name</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">rate_review</i>
                        <input id="rateM" type="number" name="rateM" onchange="validateNumber(this);" class="tooltipped" data-position="top" data-delay="50"
                            data-tooltip="Maximum 10 Digits only">
                        <label for="rateM">Market Rate</label>
                    </div>
                    <div class="input-field col s6">
                        <i class="material-icons prefix">rate_review</i>
                        <input id="rateP" type="number" name="rateP" onchange="validateNumber(this);" class="tooltipped" data-position="top" data-delay="50"
                            data-tooltip="Maximum 10 Digits only">
                        <label for="rateP">Personal Rate</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">add_box</i>
                        <input id="quantity" type="number" name="quantity" onchange="validateNumber(this);" class="tooltipped" data-position="top"
                            data-delay="50" data-tooltip="Maximum 10 Digits only">
                        <label for="quantity">Quantity</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s10">
                        <i class="material-icons prefix">description</i>
                        <textarea name="description" id="desc" class="materialize-textarea tooltipped" onchange="validateDescription(this)" data-position="top"
                            data-delay="50" data-tooltip="Description of your yield minimum of length 10"></textarea>
                        <label for="desc">Description</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">date_range</i>
                        <input type="text" class="datepicker" name="validUpto" id="validUpto" onchange="validateDate(this)">
                        <label for="validUpto">Valid Upto</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">date_range</i>
                        <select name="location" multiple>
                            <option value="" disabled selected>Choose your option</option>
                            <c:forEach items="${sellto.rows}" var="locations">
                                <option value="${locations.location}">${locations.location}</option>
                            </c:forEach>
                        </select>
                        <label>Sell to a location</label>
                    </div>
                    <div class="input-field col s6">
                        <i class="material-icons prefix">date_range</i>
                        <select name="person" multiple>
                            <option value="" disabled selected>Choose your option</option>
                            <c:forEach items="${sellto.rows}" var="persons">
                                <option value="${persons.contactNumber}">${persons.fName} ${persons.lName}</option>
                            </c:forEach>
                        </select>
                        <label>Sell to a person</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col s3 offset-s4">
                        <button class="btn waves-effect waves-light" type="submit" name="action" value="true">
                            Submit <i class="material-icons right">send</i>
                        </button>
                    </div>
                </div>
            </form>
        </div>
        </div>
        <c:if test="${param.action}">
            <sql:update>
                INSERT INTO items(Name, Type, Quantity, PersonalRate, MarketRate, Description, ValidUpto, farmer) VALUES(?, ?, ?, ?, ?, ?,
                ?, ?)
                <sql:param value="${param.name}" />
                <sql:param value="${param.type}" />
                <sql:param value="${param.quantity}" />
                <sql:param value="${param.rateP}" />
                <sql:param value="${param.rateM}" />
                <sql:param value="${param.description}" />
                <sql:param value="${param.validUpto}" />
                <sql:param value="${contactNumber}" />
            </sql:update>

            <sql:query var="itemId">
                SELECT id FROM items ORDER BY id DESC LIMIT 1
            </sql:query>


            <c:forEach items="${paramValues.person}" var="p">
                <sql:update>
                    INSERT INTO notifications(itemId, notificationTo, notificationFrom, date) VALUES(?, ?, ?, ?)
                    <sql:param value="${itemId.rows[0].id}" />
                    <sql:param value="${p}" />
                    <sql:param value="${contactNumber}" />
                    <sql:param value="<%= new java.util.Date() %>" />
                </sql:update>
            </c:forEach>

            <c:forEach items="${paramValues.location}" var="l">
                <sql:query var="notifyPersons">
                    Select contactNumber from users where type != 'farmer' and location=?
                    <sql:param value="${l}" />
                </sql:query>
                <c:forEach items="${notifyPersons.rows}" var="notifyPerson">
                    <sql:update>
                        INSERT INTO notifications(itemId, notificationTo, notificationFrom, date) VALUES(?, ?, ?, ?)
                        <sql:param value="${itemId.rows[0].id}" />
                        <sql:param value="${notifyPerson.contactNumber}" />
                        <sql:param value="${contactNumber}" />
                        <sql:param value="<%= new java.util.Date() %>" />
                    </sql:update>
                </c:forEach>
            </c:forEach>

            <script type="text/javascript">
                Materialize.toast('Item Added Successfully', 1000)
            </script>
        </c:if>
    </body>
    <script type="text/javascript" src="js/script.js"></script>
    <script>
        document.getElementById('name').valid = false;
        document.getElementById('rateM').valid = false;
        document.getElementById('rateP').valid = false;
        document.getElementById('desc').valid = false;
        document.getElementById('validUpto').valid = false;
    </script>

    </html>