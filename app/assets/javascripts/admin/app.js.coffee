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


# Controllers
controllerGoodsList = ($scope, $http) ->
  $http.get('/api/v1/goods/search.json?store_id=2').success (data) ->
    $scope.goods = data

#controllerGoodsList.$inject = ['$scope', '$http'];

PhoneDetailCtrl = ($scope, $routeParams) ->
  console.log 'PhoneListCtrl'

#PhoneDetailCtrl.$inject = ['$scope', '$routeParams'];