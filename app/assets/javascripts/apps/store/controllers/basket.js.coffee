angular.module('gm.store.controllers').controller 'BasketController', [
  '$scope', 'OrdersService', 'OrderItemService'
  ($scope, OrdersService, OrderItemService)->
    $scope.total = 0
    $scope.loading = true
    $scope.order = null

    $scope.init = ->
      OrdersService.one('current').get().then (response)->
        $scope.order = response
        $scope.loading = false
        for i in $scope.order.items
          $scope.total += i.current_price * i.value

    $scope.$on 'goods:update_ordered', (event, data) ->


]