###
# Base model
###
class GM.Models.Base extends Backbone.Model
  error: ->
    console.log 'Error: in GM.Models.Base'
  # -------------------------------------------------- Parse API response
  parse: (response)->
    if response.status is GM.API_STATUS_SUCCESS
      response.data
    else
      throw new Error(response.message)
