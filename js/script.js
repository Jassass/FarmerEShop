
var itemId = null;
var max_quantity = null;
function add(id, quantity)
{
    $('#addToCart').modal('open');
    itemId = id;
    max_quantity = quantity;
}  
function addItem(){
    if(document.getElementById('quantity').valid){
        $('[name="cartItem"]').val(itemId);
        itemId = null;
        $('#addToCart').modal('close');
        return true;
    }else{
        Materialize.toast('Maximum Availability : '+max_quantity+" kg", 3000)
		return false;
    }
    
}
function validateQuantity(element){

    if(element !=null && element.value >=0 && element.value <= max_quantity){
        $(element).removeClass("invalid");
        $(element).addClass("valid");
        element.valid = true;
    }else{
        $(element).removeClass("valid");
        $(element).addClass("invalid");
        element.valid = false;
    }

}

$('.datepicker').pickadate({
    format: 'yyyy-mm-dd',
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15, // Creates a dropdown of 15 years to control year,
    today: 'Today',
    clear: 'Clear',
    close: 'Ok',
    closeOnSelect: false // Close upon selecting a date,
});

$(document).ready(function(){ 
$('.modal').modal({
    complete: function() { $('[name="quantity"]').val(null); }
});
});

var page = document.location.pathname
page = page.split("/");
page = page[2].split('.');
page = page[0];

$('#' + page).addClass('active');