$(document).ready(function() {

	var avatar = $("#header-avatar");
	var dropdown = $("#avatar-dropdownmenu");
	
	avatar.click( function(event) {
		event.stopPropagation();
		dropdown.toggle();
	});
	
	// body click closes menu
	$("body").click( function() {
		dropdown.hide();
	});
	
});