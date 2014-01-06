###
# Good collection in Basket
###
class GM.Collections.OrderItems extends Backbone.Collection

  model: GM.Models.OrderItem

  # -------------------------------------------------- Constructor
  initialize: (models, options) ->

  # -------------------------------------------------- Calc order sum
  calcSum: ->
    sum = 0
    @each((item)->
      sum += item.get('value')*item.get('price')
    )
    sum


