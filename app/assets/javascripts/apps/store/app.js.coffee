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
      $stateProvider.state('index',
        url: ''
        views:
          '@':
            controller: 'GoodsIndexController'
            templateUrl: '/templates/store/goods/index'
          'promoContainer@index':
            templateUrl: '/templates/store/goods/p/promo'
          'searchContainer@index':
            templateUrl: '/templates/store/goods/p/search'
      ).state('list',
        url: '/:category'
        views:
          '@':
            controller: 'GoodsController'
            templateUrl: '/templates/store/goods/list'
          'goodsContainer@list':
            templateUrl: '/templates/store/goods/p/items'
          'filterContainer@list':
            templateUrl: '/templates/store/goods/p/filter'
          'breadcrumbsContainer@list':
            templateUrl: '/templates/store/goods/p/breadcrumbs'
      ).state 'goods_details',
        url: '/item/:id'
        views:
          goodsContainer:
            templateUrl: '/templates/store/goods/detail'

      $urlRouterProvider.otherwise '/'
      $locationProvider.hashPrefix '!'

  ])
#  .run(['$rootScope', '$state', '$stateParams',  ($rootScope, $state, $stateParams) ->
##      $rootScope.$state = $state;
##      $rootScope.$stateParams = $stateParams;
#  ])
)(window.angular)