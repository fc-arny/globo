((angular) ->
  angular.module('gm.store.services').
    factory('GoodsService',  (Restangular) ->
      Restangular.service('good/items')
  )
)(window.angular)