###
# Order model containing goods from basket
###
class   Sap.Models.Order extends Sap.Models.Base
  url: '/api/v1/orders'
  total : 0

  # -------------------------------------------------- Constructor
  initialize: ->
    @_parseOrderItems()

  # -------------------------------------------------- Return hash string for order
  hash: ->
    @get('id') + 'x' + @get('hash_str')

  # -------------------------------------------------- Parse order's goods
  _parseOrderItems: ->
    @items = null

    if @has 'order_items'
      @items = new Sap.Collections.OrderItems @get('order_items')
      @unset('order_items', silent:true)

      @total = @items.calcSum()

      console.log @total
