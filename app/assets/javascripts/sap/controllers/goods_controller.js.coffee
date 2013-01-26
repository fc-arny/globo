@GoodsController = ($scope,$http) ->

  $http.get('/api/v1/goods/search').success (data) ->
    $scope.goods = data


