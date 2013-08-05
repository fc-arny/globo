class Sap.Collections.GoodItems extends  Backbone.Collection
  model : Sap.Models.GoodItem
  url   : '/api/v1/goods'
  page  : 0

  # First request return goods and info for pagination
  parse : (resp, xhr)->
    @count = resp.data.value
    resp.data.goodItems
