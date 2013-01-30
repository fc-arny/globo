@GoodsCtrl = ($scope, Goods) ->
  $scope.index = ->
    Goods.query ((resource)->
      $scope.goods = resource
    ), (response) ->
      console.log 'index:response'

  $scope.new = ->
    console.log 'New'
    Goods.get
      action: 'new'
    , ((resource) ->
        console.log resource
    ),
      (response) ->
        console.log 'response'

  $scope.show = (g_id)->
    console.log 'Show'
    Goods.get
      good_id: g_id
    , ((resource) ->
      console.log 'resource'
    ), (response) ->
      console.log 'response'

