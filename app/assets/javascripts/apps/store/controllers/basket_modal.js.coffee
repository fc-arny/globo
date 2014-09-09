angular.module('gm.store.controllers').controller 'BasketModalController', [
  '$scope', 'OrdersService', 'BasketService'
  ($scope, OrdersService, BasketService)->

    $scope.init = ->
      OrdersService.one('current').get().then (response)->
        $scope.order = response
        calculate_total()

    calculate_total = ->
      $scope.total = 0
      for i in $scope.order.items
        $scope.total += parseFloat(i.price * i.value)

    $scope.$on 'order:item:update', (event, data) ->
      item = _.findWhere($scope.order.items, id: data.id)
      if item
        item.value = data.value
        if data.value == 0
          index = $scope.order.items.indexOf(item)
          $scope.order.items.splice(index, 1)
      else
        $scope.order.items.push(data)

      calculate_total() # TODO: Create basket directive
]