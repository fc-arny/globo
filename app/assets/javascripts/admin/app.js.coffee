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
          controller: controllerProductEdit
        }).otherwise({
          redirectTo: '/admin/goods/'
        })
  ]
