((angular)->
  angular.module('gm.services.store').
    factory('GoodsService', [
      '$resource'
      ($resource)->
        GoodsService
        $resource 'api/v1/good/items', {}, ->
          query: {method: 'POST', params: {p: 1}, responseType: 'json', isArray: false}#category: 1000}}
    ])
)(window.angular)