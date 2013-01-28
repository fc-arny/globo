angular.module('adminApp', [])
  .config [
    '$routeProvider',
    '$locationProvider'
    ($routeProvider, $locationProvider) ->
      $locationProvider.html5Mode(true)
      $routeProvider
        .when('/admin/goods/', {
          templateUrl: '/assets/admin/goods.html'
          controller: GoodsCtrl

        }).when('/admin/goods/new', {
          templateUrl: '/assets/admin/product.html'
          controller: NewGoodCtrl

        }).when('/admin/goods/:goodId/edit', {
          templateUrl: '/assets/admin/product.html'
          controller: EditGoodCtrl

        }).otherwise({
          redirectTo: '/admin/goods/'
        })
  ]
