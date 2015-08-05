// ============================================
// ==== JQUERY TO ADD A GROUP FROM NAVBAR =====
// ============================================
// toggles hidden property using Jquery .toggle method

var ready;
ready = function(){

	console.log("add_group.js jquery is ready");

	$('.click-me-to-add-group').click(function(e){
		e.preventDefault();
		var $this = $(this);
		$('.hidden-new-group-box').toggle("slow");
	});

};

$(document).ready(ready);
$(document).on('page:load', ready);