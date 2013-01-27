# Controllers
@controllerGoodsList = ($scope, $http) ->
  $scope.tablehead = [
    {name: 'number',    title: 'Number'},
    {name: 'name',      title: 'Name'},
    {name: 'price',     title: 'Price'}
  ]
  $http.get('/api/v1/goods/search?store_id=2')
    .success (data) ->
      $scope.goods = data
      console.log $scope.goods

#controllerGoodsList.$inject = ['$scope', '$routeParams'];


@controllerProductEdit = ($scope, $http) ->
  $scope.data = 'Редактирование товара'

#controllerProductEdit.$inject = ['$scope', '$routeParams'];