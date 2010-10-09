// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// I owe a litre of beer to @rbates for the following 2 functions
// -- Stripteasus Explosivus

function insert_fields(link, method, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + method, "g")
  $(link).up().insert({
    before: content.replace(regexp, new_id)
  });
}

function remove_fields(link) {
  var hidden_field = $(link).previous("input[type=hidden]");
  if (hidden_field) {
    hidden_field.value = '1';
  }
  $(link).up(".fields").hide();
}

function add_weird_character(elementid, character){
  $(elementid).value = $(elementid).value + character;
  $(elementid).focus();
}
