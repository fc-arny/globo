#angular.module('adminApp', [])
#  .config [
#    '$routeProvider',
#    '$locationProvider'
#    ($routeProvider, $locationProvider) ->
#      $locationProvider.html5Mode(true)
#      $routeProvider
#        .when('/admin/goods/', {
#          templateUrl: '/admin/goods.js'
#          controller: GoodsCtrl
#
#        }).when('/admin/goods/new', {
#          templateUrl: '/assets/admin/product.html'
#          controller: NewGoodCtrl
#
#        }).when('/admin/goods/:goodId/edit', {
#          templateUrl: '/assets/admin/product.html'
#          controller: EditGoodCtrl
#
#        }).otherwise({
#          redirectTo: '/admin/goods/'
#        })
#  ]
angular.module('adminApp', ['ngResource'])
  .factory 'Goods', ($resource)->
    $resource '/admin/goods/:good_id/:action', good_id: '@id'
  .config [
    '$routeProvider',
    '$locationProvider'
    ($routeProvider, $locationProvider) ->
      $locationProvider.html5Mode(true)
  ]
