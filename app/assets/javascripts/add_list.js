// ============================================
// ==== JQUERY TO ADD A LIST FROM NAVBAR =====
// ============================================
// toggles hidden property using Jquery .toggle method

var ready;
ready = function(){

	console.log("add_list.js jquery is ready");

	$('.click-me-to-add-list').click(function(e){
		e.preventDefault();
		var $this = $(this);
		$('.hidden-list-box').toggle("slow");
	});

};

$(document).ready(ready);
$(document).on('page:load', ready);