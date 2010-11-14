$(document).ready(function(){
  // initialize all the datepickers
	$.datepicker.setDefaults($.datepicker.regional['pt-BR']);

  //$('input.ui-datetimepicker').datetimepicker();
  $('input.ui-datepicker').datepicker({defaultDate: "+1w"});
});


// Custom widget for a categorized auto-complete

$.widget( "custom.catcomplete", $.ui.autocomplete, {
	_renderMenu: function( ul, items ) {
		var self = this,
			currentCategory = "";
		$.each( items, function( index, item ) {
			if ( item.category != currentCategory ) {
				ul.append( "<li class='ui-autocomplete-category'>" + item.category + "</li>" );
				currentCategory = item.category;
			}
			self._renderItem( ul, item );
		});
	}
});


// Add and remove fields function for the nested forms.

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function insert_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}

// Add weird characters to aid the input of weird names.

function add_weird_character(elementid, character){
  $(elementid).value = $(elementid).value + character;
  $(elementid).focus();
}
