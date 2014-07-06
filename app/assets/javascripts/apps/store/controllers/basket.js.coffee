angular.module('gm.store.controllers').controller 'BasketController', [
  '$scope', 'OrdersService', 'OrderItemService'
  ($scope, OrdersService, OrderItemService)->
    $scope.total = 0
    $scope.loading = true
    $scope.order = null

    $scope.init = ->
      $scope.order = OrdersService.one('basket').get().then ->
        $scope.loading = false

    $scope.$on 'goods:add_to_basket', (event, data) ->
      console.log 'Basket:Add to basket'
      console.log data
#      OrderItemService.one('1')

    $scope.$on 'goods:remove_to_basket', (event, data) ->
      console.log 'Remove from basket'
      OrderItemService.one('1')

]