angular.module('gm.store.controllers').controller 'GoodsController', [
  '$scope', 'GoodsService', 'OrderItemsService', '$state', '$rootScope'
  ($scope, GoodsService, OrderItemsService, $state, $rootScope)->

    # Vars ---------------------------
    $scope.show_more = true     # Show load more button?
    $scope.loading   = true     # if loading process
    $scope.offset    = 0        # Offset
    $scope.category  = null     # Current category

    # Filtering
    $scope.filter_category = 'all'

    # Sorting
    $scope.sort_field  = 'default'
    $scope.sort_dir = ''
    $scope.sorts = default: 'умолчанию', name_asc: 'имени от А до Я', name_desc: 'имени от Я до А', price_asc: 'цене по убыванию', price_desc: 'цене по возрастанию'

    # Good Items
    $scope.items = []

    # Requests queue
    $scope._requests = []


    # Methods ------------------------
    # --------------------------------
    $scope.init = ->

    # Add to basket
    $scope.add_to_basket = (item, value)->

      item.ordered ||= {}
      item.ordered.value = (if value <= 0 then 0 else value)
      score = (item.ordered.value / item.good.value) * item.price

      if $scope._requests[item.id] is undefined
        val = item.ordered.value
        $scope._requests[item.id] = new RequestQueue(->
          OrderItemsService.post(good_item_id: item.id, value: val)
        , 500)

      $scope._requests[item.id].push item.ordered.value

      $rootScope.$broadcast 'goods:update_ordered', id: item.id, value: item.ordered.value, score: score

      item.ordered = null if item.ordered.value == 0

    $scope.remove_from_basket = (item) ->
      $scope.add_to_basket(item, 0)

    # Route handler
    $scope.$on "$stateChangeSuccess", (event, toState, toParams, fromState, fromParams) ->
      category_id    = toParams['category'].split('-')[0]

      # Breadcrumbs
      $scope.category         = gon.categories[category_id]
      $scope.parent_category  = gon.categories[$scope.category.parent_id]

      # Filter
      $scope.category_filter = $scope.category.children

      # Change category
      if toParams.category isnt fromParams.category
        $scope.filter_category = 'all'
        $scope.offset   = 0

      $scope.goods    = []

      # Load goods
      load_goods(false)

    # Sorting
    $scope.sort = (field_dir) ->
      field_dir = field_dir.split('_')

      $scope.offset = 0
      $scope.sort_dir = field_dir.pop()
      $scope.sort_field  = field_dir.join('_')

      load_goods(false)

    # Filtering by category
    $scope.filter_by_category = (category_id = 'all')->
      $scope.offset = 0
      $scope.filter_category = category_id

      load_goods(false)

    # Load more goods
    $scope.more_goods = ->
      load_goods(true)

    # PRIVATE ------------------------
    # --------------------------------

    # Load data
    load_goods = (append = true)->
      $scope.loading = true

      GoodsService.getList(query_params()).then (response)->
        $scope.goods = response

        $scope.show_more = ($scope.goods.meta.count > $scope.goods.meta.limit + $scope.goods.meta.offset)
        $scope.offset   += $scope.goods.meta.limit

        if append
          $scope.items = _.union($scope.items, _.toArray(response))
        else
          $scope.items = _.toArray(response)
      .then ->
        $scope.loading = false

    # Params for query list of goods
    query_params = ->
      # Common
      query = offset: $scope.offset

      # Filtering
      query['filter[category]'] = if $scope.filter_category != 'all' then $scope.filter_category else $scope.category.id

      # Sorting
      if $scope.sort_field isnt 'default'
        query['sort[dir]']   = $scope.sort_dir
        query['sort[field]'] = $scope.sort_field

      # Result query
      query

]