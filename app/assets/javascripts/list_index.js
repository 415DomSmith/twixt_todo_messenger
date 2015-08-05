// ============================================
// ==== JQUERY FOR LISTS INDEX PAGE ===========
// ============================================

var ready;
ready = function(){

	// console.log("list_index.js jquery is ready");



// ==================================
// ==== TOGGLES FOR HIDDEN DIVS =====
// ==================================
	$('.new-list-button').click(function () {
		$('.hidden-list-box').toggle("slow");
	});

	$('.remove-list').click(function(e){
		e.stopPropagation();
		$('.hidden-remove-box').toggle("slow");
	});

	$('.cancel-button').click(function(e){
		e.stopPropagation();
		$('.hidden-remove-box').toggle("slow");
	});

	$('.close-me-button').click(function (){
		removeAddItemForms();
		removeAddNotificationForms();
		toggleScreenBlank();
	});


	// ==========================================
// ========= LIST DRAG ANIMATIONS ===========
// ==========================================
		
	$(".draggable").draggable({ cursor: "crosshair", revert: "invalid"});
	$("#drop").droppable({ accept: ".draggable", 
  	drop: function(event, ui) {
    
    var list = ui.draggable
    list.toggle()
		var id = list.attr('data-id');
		var listName = list.attr('data-name');
		
		$.ajax({
			type: 'GET',
			url: '/lists/' + id + '/items/',
			dataType: 'json'
		}).done(function (data){
			var items = data;
			//LIST HEADER TEXT STRING

			var html= '<div class="list-item-box draggable-list" data-id="'+ id +'">' +
											'<div class="list-header" id="draggable">' +
											'<i class="close-list-button fa fa-times"></i>'+
												'<span class="list-name-text">' + listName +'</span>' +
												'<i class="add-item-icon fa fa-plus" data-id="'+ id +'""></i>' +
											'</div>'+
											'<div class="list-body">'+ 
												'<ul class="list-ul">';							
			items.forEach(function (item){
				//LIST ITEM TEXT STRING
				html += '<li class="list-li">' +
						// LIST ITEM HEADER
						'<div class="list-item-header-outer">' +
										'<div class="list-item-header-inner">' +
											'<i class="collapse-icon fa fa-caret-square-o-down"></i>' +
											'<span class="list-item-name">' + item.name + '</span>' +
											'<i class="schedule-text-button fa fa-phone-square" data-listId="' + id + '" data-itemId="' + item.id + '" data-itemName="' + item.name + '"></i>'	+		
											'<i class="schedule-email-button fa fa-envelope-o" data-listId="' + id + '" data-itemId="' + item.id + '" data-itemName="' + item.name + '"></i>' +	
											'<i class="google-calendar-button fa fa-calendar"></i>' +		
										'</div>' +
									'</div>' +
						// LIST ITEM BODY
						'<div class="list-item-body">';

					 if (item.image_url == "" || item.image_url == "nil"){
									html += //item.description + 
									'</div>' +
									'<div class="list-item-footer">' +
										'<i class="item-completed-button fa fa-check-square"></i>' +
										'<i class="delete-item-button fa fa-minus-square"></i>' +
									'</div>' +
								'</li>';
							}
					else {
							html +=	'<div class="image-div">' +
										'<img src="'+ item.image_url +'" class="item-img"></div>' +
										'</div>' + //item.description +	
										'<div class="list-item-footer">' +
										'<i class="item-completed-button fa fa-check-square"></i>' +
										'<i class="delete-item-button fa fa-minus-square"></i>' +
									'</div>' +
										'</li>';
						}
			});
			html += '</ul>' +
						'</div>' +
					'</div>';

		//APPEND CONCATED STRING / LIST TO DOM			
			$('#drop').append(html);

// ==========================================
// ==== ADD .CLICK EVENTS TO LIST ICONS =====
// ==========================================
		
		//ADD NEW ITEM TO LIST
			$('.add-item-icon').click(function(e){
				removeAddItemForms();
				removeAddNotificationForms();
				var $this = $(this);
				var id = $this.attr('data-id');
				toggleScreenBlank();
				renderAddItem(id);

			});

		//CLOSE LIST -- SHRINK TO BUTTON
			$('.close-list-button').click(function(e){
				$(this).closest('.list-item-box').remove();
				list.toggle();
			});	

		//TOGGLE DESCRIPTION AND FOOTER
			$('.collapse-icon').click(function(e){
				console.log('CLOSE ME');
				$(this).closest('li').find('.list-item-body').toggle();
				// $(this).closest('.list-item-footer').toggle();
			});


		//GOOGLE CALENDAR BUTTON

		$('.google-calendar-button').click(function(e){
			toggleScreenBlank();

		});

		//SCHEDULE EMAIL BUTTON

		$('.schedule-email-button').click(function(e){
			removeAddItemForms();
			removeAddNotificationForms();
			toggleScreenBlank();
			var $this = $(this);
			var itemId = $this.attr('data-itemId');
			var listId = $this.attr('data-listId');
			var itemName = $this.attr('data-itemName');
			console.log(itemId + " " + listId + " " + itemName);
			renderAddEmailNotification(itemId, listId, itemName);
		});


		//SCHEDULE TEXT BUTTON

		$('.schedule-text-button').click(function(e){
			removeAddItemForms();
			removeAddNotificationForms();
			toggleScreenBlank();
			var $this = $(this);
			var itemId = $this.attr('data-itemId');
			var listId = $this.attr('data-listId');
			var itemName = $this.attr('data-itemName');
			renderAddNotification(itemId, listId, itemName);
		});

		//ITEM COMPLETED BUTTON

		$('.item-completed-button').click(function(e){


		});

		//ITEM COMPLETED BUTTON

		$('.delete-item-button').click(function(e){


		});

		});//END OF AJAX .done CALL
	// });//END OF LIST-TOGGLE-BOX CLICK FUNCTION
   
  var dropped = ui.draggable;
  var droppedOn = $(this);
  $(dropped).detach().css({top: 0,left: 0}).appendTo(droppedOn);   
	}, 
   over: function(event, elem) {
   $(this).addClass("over");
    	// console.log("over");
    },
    out: function(event, elem) {
    $(this).removeClass("over");
		}
		});
		$("#drop").sortable();

		$("#origin").droppable({ accept: ".draggable", drop: function(event, ui) {
       // console.log("drop");
    $(this).removeClass("border").removeClass("over");
      var dropped = ui.draggable;
      var droppedOn = $(this);
      $(dropped).detach().css({top: 0,left: 0}).appendTo(droppedOn);      
  }});       


	
	
// ============================================
// =========== GLOBAL FUNCTIONS ===============
// ============================================


	function toggleScreenBlank() {
		$('.screen-blanket').toggle();
		$('.render-forms-here').toggle();
	}

	function renderAddItem(id) {
		var html = '<div class="new-item-form-box">' +
				        '<h3 style="margin-bottom:30px;">Add a new item to your list</h3>' +
				        '<form action="/lists/'+ id +'/items/" class="add-item-form" method="POST">' +
				            '<div>' +
				                '<div class="item-name-label"><label for="title">Name: </div>' +
				                    '<input type="text" name="item[name]" class="item-name-input" class="add-item-form" autofocus>' +
				                '</label>' +
				            '</div>' +
				            '<div><label class="add-item-description-label">Item Description: </label></div>'+
				                '<div class="text-box">'+    
				                        '<textarea name="item[description]" rows="5" cols="20" class="add-item-description-text-area"></textarea>' +
				                '</div>' +
				            '<div class="upload-care-label">' +
				                '<label for="uploadcare">Upload an Image for this Item</label>' +
				            '</div>' +
				            '<div class="image-upload-div" style="display:inline;">' +
				                '<input type="hidden" name="item[image_url]" role="uploadcare-uploader" id="uploadcare-widget" class="image-upload">' +
				            '</div>' +                
				            '<div style="margin-top:30px;">' +
				                '<input type="submit" value="Add List Item" class="add-item-submit-button btn btn-primary">' +
				            '</div>' +
				        '</form>' +
				    '</div>';

		$(html).appendTo('.render-forms-here');
	}

	function renderAddNotification(itemId, listId, itemName) {
		var html = '<div class="new-reminder-form-box">' +
			            '<h3>Send text reminder</h3>' +
			            '<form action="/notifications/" class="new-notification-form" method="POST">' +
			                '<div class="notification-label">' +
			                    '<label for="phone">Cell phone number:</label>' + 
			                '</div>' +
			                '<div>' +
			                    '<input type="tel" name="notification[phone]" class="add-item-form" maxlength="12" required="required" placeholder="xxx-xxx-xxxx" autofocus>' +
			                '</div>' +
			                '<div class="item-description-label">' +
			                    '<label for="message"> Custom message (optional): </label>' +
			                '</div>' +    
			                '<div id ="item-description" class="notification-text-box">' +
			                    '<input type="text" name="notification[message]" class="add-item-form">' + 
			                '</div>' +
			                '<div>' +
			                    '<label for="select">Select when to send this reminder:</label>' + 
			                '</div>' +
			                '<input type="hidden" name="notification[item_name]" value="'+ itemName +'">' +
			                '<input type="hidden" name="notification[item_id]" value="'+ itemId +'">' +
			                '<input type="hidden" name="notification[list_id]" value="'+ listId +'">' +
			                '<select name="notification[send_by]"" onchange="this.form.submit()">' +
			                    '<option selected>Select time</option>' +
			                    '<option>Now</option>' +
			                    '<option>One Hour</option>' +
			                    '<option>One Day</option>' +
			                    '<option>One Week</option>' +
			                '</select>' +
			                '<noscript><input type="submit" value="Submit"></noscript>' +
			            '</form>' +            
			        '</div>';
		$(html).appendTo('.render-forms-here');
	}


	function renderAddEmailNotification(itemId, listId, itemName) {
		var html =   '<div class="new-reminder-form-box">' + 
            '<h3>Send email reminder</h3>' + 
            '<form action="/notifications/" class="new-notification-form" method="POST">' + 
            		'<input type="hidden" name="notification[item_name]" value="'+ itemName +'">' +
	              '<input type="hidden" name="notification[item_id]" value="'+ itemId +'">' +
	              '<input type="hidden" name="notification[list_id]" value="'+ listId +'">' +
                '<div class="notification-label">' + 
                    '<label for="recemail">Recipient Email:</label> ' + 
                '</div>' + 
                ' <div>' + 
                    '<input type="text" name="notification[recemail]" class="add-item-form" required="required" placeholder="example@example.com" autofocus>' + 
                '</div>' + 
                '<div class="item-description-label">' + 
                    '<label for="message"> Custom message (optional): </label>' + 
                '</div>' + 
                '<div id ="item-description" class="notification-text-box">    ' + 
                    '<input type="text" name="notification[message]" class="add-item-form"> ' + 
                '</div>' + 
                '<div>' + 
                    ' <label for="select">Select when to send this reminder:</label> ' +
                '</div>' + 
	                 '<select name="notification[send_by]" onchange="this.form.submit()">'+
                	'<option selected>Select time</option>' +
			                    '<option>Now</option>' +
			                    '<option>One Hour</option>' +
			                    '<option>One Day</option>' +
			                    '<option>One Week</option>' +
			                '</select>' +
			                '<noscript><input type="submit" value="Submit"></noscript>' +
			            '</form>' +            
			        '</div>';
			     $(html).appendTo('.render-forms-here');
	}

	function removeAddItemForms() {
		$('.new-item-form-box').remove();
	}
	
	function removeAddNotificationForms() {
		$('.new-reminder-form-box').remove();
	}

};
//END

$(document).ready(ready);
$(document).on('page:load', ready);
