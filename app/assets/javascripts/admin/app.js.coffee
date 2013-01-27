angular.module('adminApp', [])
  .config [
    '$routeProvider'
    ($routeProvider) ->

      $routeProvider
        .when('/goods', {
          templateUrl: '/assets/admin/list.html'
          controller: controllerGoodsList
        }).when('/goods/:goodId', {
          controller: controllerGoodsList
        }).otherwise({
          redirectTo: '/goods'
        })
  ]
