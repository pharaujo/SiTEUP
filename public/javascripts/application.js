$(document).ready(function(){
  $('input.ui-datepicker').datepicker();
	$.datepicker.setDefaults($.datepicker.regional['']);
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
