// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// I owe a litre of beer to @rbates for the following 2 functions
// -- Stripteasus Explosivus

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function insert_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}

function add_weird_character(elementid, character){
  $(elementid).value = $(elementid).value + character;
  $(elementid).focus();
}
