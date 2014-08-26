angular.module('gm.store.directives').directive('goodItem', [
  'BasketService', '$rootScope',
  (BasketService, $rootScope) ->
    restrict: 'EA'
    scope:
      item: '='
    transclude: true
    link: (scope, element, attrs, ctrl, transclude) ->
      # Requests queue
      scope._requests = []

      # Add to basket
      scope.add_to_basket = (item, value)->
        item.value = (if value <= 0 then 0 else value)

        if scope._requests[item.id] is undefined
          scope._requests[item.id] = new RequestQueue((value)->
            BasketService.post(good_item_id: item.id, value: value)
          , 500)

        scope._requests[item.id].push item.value

        $rootScope.$broadcast 'goods:order_item', item

        item.value = null if item.value == 0

      # Remove from basket
      scope.remove_from_basket = (item) ->
        scope.add_to_basket(item, 0)

      transclude(scope, (clone)->
          element.append clone
        )
  ])