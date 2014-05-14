((angular)->
  'use strict'

  angular.module('gm.controllers.store', [
    'restangular'

#    'ngRoute'
    'ngSanitize'

    'gm.services.store'
    'gm.filters.store'
    'gm.directives.store'

    'ui.bootstrap'
    'ui.router'
  ]).config([
    '$httpProvider'
    '$urlRouterProvider'
    '$stateProvider'
    'RestangularProvider'
    ($httpProvider, $urlRouterProvider, $stateProvider, RestangularProvider)->
      $httpProvider.defaults.headers.common["X-Requested-With"] = 'XMLHttpRequest'

      # Restangular
      RestangularProvider.setBaseUrl '/api/v1'
      RestangularProvider.setRequestSuffix '.json'
      RestangularProvider.addResponseInterceptor (data, operation, what, url, response, deferred) ->
        extractedData = undefined

        extractedData     = data.data.result
        delete data.data.result

        extractedData.meta   = data.data
        extractedData.status = data.status

        extractedData

      # Routes
      $stateProvider.state('goods',
        url: '/'
        controller: 'GoodsController'
        views:
          goodsContainer:
            templateUrl: '/templates/store/goods/list'
      ).state('goods.list',
        url: '^/{category}'
        controller: 'GoodsController'
        views:
          goodsContainer:
            templateUrl: '/templates/store/goods/list'
      ).state 'goods.details',
        url: '^/item/:id'
        views:
          goodsContainer:
            templateUrl: '/templates/store/goods/detail'

  ])
)(window.angular)