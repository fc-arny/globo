###
# Good collection in Basket
###
class Sap.Collections.OrderItems extends Backbone.Collection

  model: Sap.Models.OrderItem

  ###
  # Url method
  ###
  url: ->
    '/api/v1/orders/' + @orderHash + '/items'


  ###
  # Constructor
  ###
  initialize: (models, options) ->
    @orderHash = options.orderHash
    console.log options