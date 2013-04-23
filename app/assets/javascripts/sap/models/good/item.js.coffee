###
 # Good model
###
class Sap.Models.GoodItem extends Backbone.Model
  ###
  # PUBLIC
  ###

  ###
  # Constructor
  ###
  initialize:(options) ->
    @_parseGood()

  ###
  # PRIVATE
  ###

  ###
  # Fetch Good object from GoodItem
  ###
  _parseGood: ->
    @good = new Sap.Models.Good @.get('good')
    @unset('good')