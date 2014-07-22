angular.module('gm.store.controllers').controller 'BasketController', [
  '$scope', 'OrdersService', 'OrderItemsService'
  ($scope, OrdersService, OrderItemsService)->
    $scope.total = 0
    $scope.loading = true
    $scope.order = null

    $scope.init = ->
      OrdersService.one('current').get().then (response)->
        $scope.order = response
        $scope.loading = false
        calculate_total()

    $scope.$on 'goods:update_ordered', (event, data) ->
      calculate_total()


    calculate_total = ->
      for i in $scope.order.items
        $scope.total += i.current_price * i.value
]