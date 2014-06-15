// Angular + Plugins
// ------------------------------------------
//= require angular/angular
//= require angular-resource/angular-resource

//= require restangular/dist/restangular

//= require angular-cookies/angular-cookies
//= require angular-animate/angular-animate
//= require angular-i18n/angular-locale_ru
//= require angular-ui-router/release/angular-ui-router
//= require angular-bootstrap/ui-bootstrap-tpls
//= require angular-sanitize/angular-sanitize
//= require angular-chosen-localytics/chosen

// Angular Store App
// ------------------------------------------
//= require      apps/store/modules

//= require_tree ./apps/store/filters
//= require_tree ./apps/store/directives
//= require_tree ./apps/store/services

//= require      apps/store/app

//= require_tree ./apps/store/controllers

// Main module
//angular.module('gm', ['gm.store']);

// Init app
angular.bootstrap($('#good-app-container').get(0), ['gm.store']);
console.log(gon.categories);