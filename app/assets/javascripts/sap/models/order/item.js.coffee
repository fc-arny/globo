###
# Goods in basket model
###
class Sap.Models.OrderItem extends Backbone.Model

  ###
  #  Constructor
  ###
  initialize: (options) ->
    @_parseGoodItem()


  ###
  #
  ###
  _parseGoodItem:->
#    @goodItem = new Sa
