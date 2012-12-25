@GoodsController = ($scope,$http) ->

  $http.get('/api/v1/goods/search.json?store_id=2').success (data) ->
    $scope.goods = data