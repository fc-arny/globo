###
# Order model containing goods from basket
###
class   GM.Models.Order extends GM.Models.Base
  total : 0

  # -------------------------------------------------- Generate order url with order hash
  url: ->
    '/api/v1/orders/' + @hash()

  # -------------------------------------------------- Constructor
  initialize: ->
    @_parseOrderItems()

  # -------------------------------------------------- Return hash string for order
  hash: ->
    _hash = ''
    if @get('id')
      _hash = @get('id') + 'x' + @get('hash_str')

    return _hash

  # -------------------------------------------------- Parse order's goods
  _parseOrderItems: ->
    @items = null

    if @has 'order_items'
      @items = new GM.Collections.OrderItems @get('order_items')
      @unset('order_items', silent:true)

      @total = @items.calcSum()