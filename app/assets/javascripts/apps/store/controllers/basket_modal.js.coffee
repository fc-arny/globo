angular.module('gm.store.controllers').controller 'BasketModalController', [
  '$scope', 'OrdersService', 'BasketService'
  ($scope, OrdersService, BasketService)->

    $scope.init = ->
      $scope.init = ->
      OrdersService.one('current').get().then (response)->
        $scope.order = response

    $scope.$on 'goods:order_item', (event, data) ->
      item = _.findWhere($scope.order.items, id: data.id)
      if item
        item.value = data.value
      else
        $scope.order.items.push(data)
]