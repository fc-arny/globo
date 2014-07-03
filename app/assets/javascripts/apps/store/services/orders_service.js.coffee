((angular) ->
  angular.module('gm.store.services').
    factory('OrdersService', (Restangular)->
      Restangular.service('orders')
  )
)(window.angular)