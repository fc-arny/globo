((angular)->
  'use strict'

  angular.module('gm.store', [
    'restangular'

    'ngSanitize'

    'gm.store.controllers'
    'gm.store.services'
    'gm.store.filters'
    'gm.store.directives'

    'ui.bootstrap'
    'ui.router'
  ]).config([
    '$httpProvider'
    '$urlRouterProvider'
    '$locationProvider'
    '$stateProvider'
    'RestangularProvider'
    ($httpProvider, $urlRouterProvider, $locationProvider, $stateProvider, RestangularProvider)->
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
        url: '/:category'
        controller: 'GoodsController'
        views:
          goodsContainer:
            templateUrl: '/templates/store/goods/list'
          filterContainer:
            templateUrl: '/templates/store/goods/filter'
          breadcrumsContainer:
            templateUrl: '/templates/store/goods/breadcrumbs'
      ).state 'goods.details',
        url: '/item/:id'
        views:
          goodsContainer:
            templateUrl: '/templates/store/goods/detail'

      $urlRouterProvider.otherwise '/'

      $locationProvider.hashPrefix '!'

  ])
#  .run(['$state', '$stateParams',  ($state, $stateParams) ->
##    console.log $state.current
##    $state.transitionTo $state.current, $stateParams
#  ])
)(window.angular)