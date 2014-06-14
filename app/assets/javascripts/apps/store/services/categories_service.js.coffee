((angular)->
  angular.module('gm.store.services').
    factory('CategoriesService', (Restangular)->
      Restangular.service('categories')
  )
)(window.angular)