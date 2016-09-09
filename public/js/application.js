$(document).ready(function() {

	$("#get_the_feeling").on("submit", function(event){
		event.preventDefault();
		var $the_form = $(this);
		var form_data = $the_form.serialize();
		$.ajax({
			method: $the_form.attr("method"),
			url: $the_form.attr("action"),
			data: form_data
		})
		.done(function(response){
			$("#iframe-container").remove();
			$("#display-container").before(response);
		});
	});

});
