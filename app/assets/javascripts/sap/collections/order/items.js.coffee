###
# Good collection in Basket
###
class Sap.Collections.OrderItems extends Backbone.Collection

  model: Sap.Models.OrderItem

  # -------------------------------------------------- Constructor
  initialize: (models, options) ->

  # -------------------------------------------------- Calc order sum
  calcSum: ->
    sum = 0
    @each((item)->
      sum += item.get('count')*item.goodItem.get('price')
    )
    sum


