###
# Goods in basket model
###
class GM.Models.OrderItem extends GM.Models.Base

  urlRoot: ->
    "/api/v1/orders/#{GM.models.order.hash()}/items"

  # -------------------------------------------------- Constructor
  initialize: (options) ->
    @_parseGoodItem()

  # -------------------------------------------------- Parse good item
  _parseGoodItem: ->
    @goodItem = null
    if @has('good_item')

      @goodItem = new GM.Models.GoodItem @get('good_item')
      @unset('good_item', silent:true)
