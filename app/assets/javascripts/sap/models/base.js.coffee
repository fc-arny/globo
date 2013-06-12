###
# Base model
###
class Sap.Models.Base extends Backbone.Model
  error: ->
    console.log 'er'
  # -------------------------------------------------- Parse API response
  parse: (response)->
    if response.status is Sap.API_STATUS_SUCCESS
      response.data
    else
      throw new Error(response.message)
