angular.module('adminApp', [])
  .config [
    '$routeProvider',
    '$locationProvider'
    ($routeProvider, $locationProvider) ->
      $locationProvider.html5Mode(true)
      $routeProvider
        .when('/admin/goods/', {
          templateUrl: '/assets/admin/goods.html'
          controller: controllerGoodsList
        }).when('/admin/goods/product/:goodId', {
          templateUrl: '/assets/admin/product.html'
          controller: controllerProductEdit
        }).otherwise({
          redirectTo: '/admin/goods/'
        })
  ]
