((angular)->
  angular.module('gm.controllers.store').controller('GoodsController', [
    '$scope', '$http', ($scope, $http)->
      $http.get('api/v1/good/items').success(
        (data)->
          $scope.goods = data
          console.log data
      )
      $scope.goods
      $scope.init = ->
        console.log 'init'
  ])
)(window.angular)