((angular) ->
  angular.module('gm.services.store').
    factory('GoodsService',  (Restangular) ->
      Restangular.service('good/items')
  )
)(window.angular)