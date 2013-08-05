###
# Goods in basket model
###
class Sap.Models.OrderItem extends Sap.Models.Base

  urlRoot: ->
    "/api/v1/orders/#{Sap.models.order.hash()}/items"

  # -------------------------------------------------- Constructor
  initialize: (options) ->
    @_parseGoodItem()

  # -------------------------------------------------- Parse good item
  _parseGoodItem: ->
    @goodItem = null
    if @has('good_item')

      @goodItem = new Sap.Models.GoodItem @get('good_item')
      @unset('good_item', silent:true)
