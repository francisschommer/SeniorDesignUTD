jQuery(document).ready(function($) {

	$('#msg').html("This is updated by jQuery");

	// ----------------------------------------------------------------------- found: http://stackoverflow.com/questions/24514717/bootstrap-navbar-active-state-not-working
    $.each($('#navbar').find('li'), function() {
        $(this).toggleClass('active', 
            window.location.pathname.indexOf($(this).find('a').attr('href')) > -1);
    }); 
    // ---------------
});