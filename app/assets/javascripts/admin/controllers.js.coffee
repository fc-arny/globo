# Controllers
@controllerGoodsList = ($scope, $http) ->
  $http.get('/api/v1/goods/search?store_id=2')
    .success (data) ->

      $scope.goods = data

#controllerGoodsList.$inject = ['$scope', '$routeParams'];