Sap.Collections.Goods = Backbone.Collection.extend(
  model : Sap.Models.Good
  url   : '/api/v1/goods'
  page  : 0

  # First request return goods and info for pagination
  parse : (resp, xhr)->
    resp.goods
)