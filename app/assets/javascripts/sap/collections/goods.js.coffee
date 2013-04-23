class Sap.Collections.Goods extends  Backbone.Collection
  model : Sap.Models.Good
  url   : '/api/v1/goods'
  page  : 0

  # First request return goods and info for pagination
  parse : (resp, xhr)->
    @count = resp.data.count
    resp.data.goods
