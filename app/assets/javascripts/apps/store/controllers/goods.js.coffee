((angular)->
  angular.module('gm.store.controllers').controller('GoodsController', [
    '$scope', 'GoodsService', '$state'
    ($scope, GoodsService, $state)->

      # Vars ---------------------------
      # --------------------------------
      $scope.show_more = false     # Show load more button?
      $scope.offset    = 0         # Offset
      $scope.category  = null      # Current category

      # Filtering
      $scope.filter_category = 'all'

      # Good Items
      $scope.items = []

      # Methods ------------------------
      # --------------------------------
      $scope.init = ->

      # Route handler
      $scope.$on "$stateChangeSuccess", (event, toState, toParams, fromState, fromParams) ->
        category_id     = toParams.category.split('-')[0]

        # Breadcrumbs
        $scope.category         = gon.categories[category_id]
        $scope.parent_category  = gon.categories[$scope.category.parent_id]

        # Filter
        $scope.category_filter = $scope.category.children

        # Change category
        $scope.offset   = 0 if toParams.category isnt fromParams.category
        $scope.goods    = []

        # Load goods
        load_goods(false)

      $scope.filter_by_category = (category_id = 'all')->
        $scope.offset = 0
        $scope.filter_category = category_id

        load_goods(false)

      # PRIVATE ------------------------
      # --------------------------------

      # Load data
      load_goods = (append = true)->
        GoodsService.getList(query_params()).then (response)->
          $scope.goods = response

          $scope.show_more = ($scope.goods.meta.count > $scope.goods.meta.limit + $scope.goods.meta.offset)
          $scope.offset   += $scope.goods.meta.limit

          if append
            $scope.items = _.union($scope.items, _.toArray(response))
          else
            $scope.items = _.toArray(response)

      # Params for query list of goods
      query_params = ->
        # Common
        query = category: $scope.category.id, offset: $scope.offset

        # Filtering
        query['filter[category]'] = $scope.filter_category unless $scope.filter_category == 'all'

        # Result query
        query

  ])
)(window.angular)