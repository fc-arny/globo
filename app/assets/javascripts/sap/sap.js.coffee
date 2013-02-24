Sap =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: (data) ->
    console.log 'Init app'

    # Data
    this.categories = new Sap.Collections.Categories(data.categories)
    goods = new Sap.Collections.Goods(data.goods)

    # Routers
    new Sap.Routers.Goods(
      goods     : goods
      categories: this.categories
    )

    # Enable histroy API
    if (!Backbone.history.started)
      Backbone.history.start(
        pushState: true
        root: '/goods'
      )
      Backbone.history.started = true

    this

@Sap = Sap

