((angular)->
  angular.module('gm.store.controllers').controller('GoodsIndexController', [
    '$scope', 'GoodsService', '$state'
    ($scope, GoodsService, $state)->

      $scope.init = ->

        # Route handler
      $scope.$on "$stateChangeSuccess", (event, toState, toParams, fromState, fromParams) ->
       console.log 'Index'

  ])
)(window.angular)