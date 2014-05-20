((angular)->
  angular.module('gm.controllers.store').controller('GoodsController', [
    '$scope', 'GoodsService', '$state'
    ($scope, GoodsService, $state)->
      $scope.category = ''
      $scope.init = ->
#        GoodsService.getList().then (response)->
#          $scope.goods = response


      $scope.more   = true      # Show load more button?
      $scope.offset = 0         # Offset

      $scope.$on "$stateChangeSuccess", (event, toState, toParams, fromState, fromParams) ->
        # Change category
        $scope.offset = 0 if toParams.category isnt fromParams.category

        # Load goods
        GoodsService.getList(category: toParams.category, offset: $scope.offset).then (response)->
          $scope.goods  = response
          $scope.more   = $scope.goods.meta.count > $scope.goods.meta.limit + $scope.goods.meta.offset
          $scope.offset += $scope.goods.meta.limit

          console.log response
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