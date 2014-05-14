((angular)->
  angular.module('gm.controllers.store').controller('GoodsController', [
    '$scope', 'GoodsService', '$state'
    ($scope, GoodsService, $state)->
      console.log 'Op'

      $scope.init = ->
        GoodsService.getList().then (response)->
          $scope.goods = response

      $scope.$on "$stateChangeSuccess", (event, toState, toParams, fromState, fromParams) ->
#        console.log toParams
#        console.log toState
#        console.log fromParams
#        console.log fromState
        $state.go('goods');
#        $($window).scrollTop 0
#        if toState.name is "main"
#          mixpanelService.trackEvent "tour-preorder",
#            tour_id: $scope.tourId
#
#        else if toState.name is "travelers"
#          mixpanelService.trackEvent "tour-travelers",
#            tour_id: $scope.tourId
#            travelers_count: $scope.preorder.passengersCount


  ])
)(window.angular)