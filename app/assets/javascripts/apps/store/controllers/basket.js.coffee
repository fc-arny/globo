((angular)->
  angular.module('gm.store.controllers').controller('BasketController', [
    '$scope'
    ($scope)->
      $scope.score = 1
      $scope.loading = true

      $scope.init = ->
        $scope.loading = false


  ])
)(window.angular)