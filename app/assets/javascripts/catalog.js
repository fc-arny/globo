// For templates
//= require hamlcoffee

// Backbone Lib -------------------
//---------------------------------
//= require underscore
//= require common/lib/json2.js
//= require backbone
//= require backbone-support

// Backbone App -------------------
//---------------------------------
//= require_directory ./catalog
//= require_tree ./catalog/models
//= require_tree ./catalog/collections
//= require_tree ./catalog/views
//= require_tree ./catalog/routers
//= require_tree ../templates

$(function(){
	//TODO: Cache it

	GM.views.basket.render();
	GM.initRoute();

	$(document).on("click", "a[href^='/goods']", function(evt) {
	  evt.preventDefault();
	  Backbone.history.navigate($(this).attr("href").replace('/goods',''), true);
	});
});