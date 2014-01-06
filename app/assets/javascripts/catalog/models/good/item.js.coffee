###
 # Good model
###
class GM.Models.GoodItem extends Backbone.Model



  # Constructor --------------------------------------
  initialize:(options) ->
    @_parseGood()
  # // Constructor -----------------------------------

  # Parse good ---------------------------------------
  _parseGood: ->
    @good = null

    if @has 'good'
      @good = new GM.Models.Good @get('good')
      @unset('good', silent:true)
  # // Parse good ------------------------------------