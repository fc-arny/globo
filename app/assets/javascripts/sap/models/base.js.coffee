###
# Base model
###
class Sap.Models.Base extends Backbone.Model
  # TODO: Глобольный обработчик ошибок для AJAX запросов

  # -------------------------------------------------- Parse API response
  parse: (response)->
    if response.status is Sap.API_STATUS_SUCCESS
      response.data
    else
      # TODO: обработка ошибки в АПИ запросе
      console.log 'Error: ' + response.message
      null
