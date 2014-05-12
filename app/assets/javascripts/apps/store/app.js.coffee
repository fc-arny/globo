((angular)->
  'use strict'

  angular.module('gm.controllers.store', [
    'restangular'

    'ngRoute'
    'ngSanitize'

    'gm.services.store'
    'gm.filters.store'
    'gm.directives.store'
    'ui.bootstrap'
  ]).config [
    '$routeProvider'
    '$locationProvider'
    ($routeProvider, $locationProvider)->
      $routeProvider.when('/item/:id',
        templateUrl: 'templates/store/goods/detail'
        controller: 'GoodsDetailController'
      ).when('/:category',
        templateUrl: 'templates/store/goods/search'
        controller: 'GoodsController'
      )

      $locationProvider.html5Mode true
  ]
)(window.angular)