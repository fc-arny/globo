angular.module('adminApp', [])
  .config [
    '$routeProvider'
    ($routeProvider) ->

      $routeProvider
        .when('/goods', {
          templateUrl: 'templateGoodsList'
          controller: controllerGoodsList
        }).when('/goods/:goodId', {
          controller: PhoneDetailCtrl
        }).otherwise({
          redirectTo: '/goods'
        })
  ]
