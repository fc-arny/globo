@Sap =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: (data) ->
    console.log 'Init app'
    goods = new Sap.Collections.Goods(data.goods)
    console.log goods
    # Define Routers
    new Sap.Routers.Goods(goods:goods)

    # Enable histroy API
    if (!Backbone.history.started)
      Backbone.history.start(
        pushState: true
        root: '/goods'
      )
      Backbone.history.started = true


    this


