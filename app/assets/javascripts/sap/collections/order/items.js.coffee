###
# Good collection in Basket
###
class Sap.Collections.OrderItems extends Backbone.Collection

  model: Sap.Models.OrderItem

  url: ->
    "/api/v1/orders/#{Sap.models.order.hash()}/items"

  model: Sap.Models.OrderItem

  # Constructor ------------------------------
  initialize: (models, options) ->
#    @parseItems(models)
  # // Constructor ---------------------------

  # Parse order items --------------------------------
  parseItems:(data)->
    items = []
    _.each data, (item)->
      newItem = new Sap.Models.OrderItem
        id            : item.id
        count         : item.count
        good_item_id  : item.good_item.id
        price         : item.good_item.price
        store_id      : item.good_item.srtore_id
        name          : item.good_item.good.name
        good_id       : item.good_item.good.id

      items.push newItem
    items
  # // Parse order items -----------------------------