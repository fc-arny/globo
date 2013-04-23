###
# Order model containing goods from basket
###
class Sap.Models.Order extends Backbone.Model
  url: '/api/v1/orders'

  initialize: ->
    # Good in basket
    @_parseItems()

  ###
  # Parse order's goods
  ###
  _parseItems: ->
    orderItems = @get('order_items')
    orderHash = @get('id') + 'x' + @get('hash_str')
    @items = new Sap.Collections.OrderItems( orderItems, orderHash: orderHash )

    @items.each (orderItem) ->
      orderItem.goodItem = new Sap.Models.GoodItem orderItem.get('good_item')
      orderItem.unset('good_item')
