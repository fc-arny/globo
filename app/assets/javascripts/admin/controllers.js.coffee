# Controllers
#@GoodsCtrl = ($scope, $http) ->
#  $scope.tablehead = [
#    {name: 'number',    title: 'Number'},
#    {name: 'name',      title: 'Name'},
#    {name: 'price',     title: 'Price'}
#  ]
#  $http.get('/api/v1/goods/search?store_id=2')
#    .success (data) ->
#      $scope.goods = data
#      console.log $scope.goods
#
##GoodsCtrl.$inject = ['$scope', '$routeParams'];
#
#
@NewGoodCtrl = ($scope, $http) ->
  $scope.data = 'Новый товар'
#
##NewGoodCtrl.$inject = ['$scope', '$routeParams'];
#
#
#@EditGoodCtrl = ($scope, $http) ->
#  $scope.data = 'Редактирование товара'

#EditGoodCtrl.$inject = ['$scope', '$routeParams'];