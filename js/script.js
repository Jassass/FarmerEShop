function forward(id) {
	$('#forwardForm').attr('action',id+'.jsp');
	$('#forwardForm').submit();
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

var page = document.location.pathname
page = page.split("/");
page = page[2].split('.');
page = page[0];

$('#' + page).addClass('active');