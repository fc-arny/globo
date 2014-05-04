###
# Store View
###
class GM.Views.GoodsIndex #extends Support.CompositeView

  initialize: (options) ->

  render: ->
    @$el.html JST['goods/index'](store:@model)
    @
