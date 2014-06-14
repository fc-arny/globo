((angular)->
  angular.module('gm.store.controllers').controller('GoodsController', [
    '$scope', 'GoodsService', '$state'
    ($scope, GoodsService, $state)->

      # Vars ---------------------------
      # --------------------------------
      $scope.show_more = false     # Show load more button?
      $scope.offset    = 0         # Offset
      $scope.category  = null      # Current category

      $scope.items = []

      # Methods ------------------------
      # --------------------------------
      $scope.init = ->

      # Route handler
      $scope.$on "$stateChangeSuccess", (event, toState, toParams, fromState, fromParams) ->
        # Change category
        $scope.category = toParams.category
        $scope.offset   = 0 if toParams.category isnt fromParams.category
        $scope.goods    = []

        # Load goods
        $scope.load_goods(false)

      # Load data
      $scope.load_goods = (append = true)->
        GoodsService.getList(category: $scope.category, offset: $scope.offset).then (response)->
          $scope.goods = response

          $scope.show_more = ($scope.goods.meta.count > $scope.goods.meta.limit + $scope.goods.meta.offset)
          $scope.offset   += $scope.goods.meta.limit

          if append
            $scope.items = _.union($scope.items, _.toArray(response))
          else
            $scope.items = _.toArray(response)

      # PRIVATE ------------------------
      # --------------------------------

  ])
)(window.angular)