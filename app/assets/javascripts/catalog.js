// For templates
//= require hamlcoffee

// Backbone Lib -------------------
//---------------------------------
//= require underscore
//= require backbone
//= require backbone.marionette

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

	var data = {
		//order     : #{@order.to_json},
		stores    : []//#{@stores.to_json}
		//categories: #{@categories.to_json}
	};

	GM.initialize(data);

//	GM.views.basket.render();
//	GM.initRoute();

	$(document).on("click", "a[href^='/goods']", function(evt) {
	  evt.preventDefault();
	  Backbone.history.navigate($(this).attr("href").replace('/goods',''), true);
	});
});