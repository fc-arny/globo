angular.module('gm.store.controllers').controller 'BasketController', [
  '$scope', 'OrdersService', 'OrderItemsService'
  ($scope, OrdersService, BasketService)->
    $scope.total = 0
    $scope.loading = true
    $scope.order = null

    $scope.init = ->
      OrdersService.one('current').get().then (response)->
        $scope.order = response
        $scope.loading = false
        calculate_total()

    $scope.$on 'goods:order_item', (event, data) ->
      item = _.findWhere($scope.order.items, gid: data.gid)
      if item
        item.value = data.value
      else
        $scope.order.items.push(data)

      calculate_total()


    calculate_total = ->
      $scope.total = 0
      for i in $scope.order.items
        $scope.total += parseFloat(i.current_price * i.value)
]