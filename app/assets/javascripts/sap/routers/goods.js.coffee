Sap.Routers.Goods = Backbone.Router.extend(#Support.SwappingRouter.extend(
  initialize: (data) ->
    console.log 'Init Route'
    console.log(data.goods)
    this.el = $('.span10')
    this.collection = data.goods

  routes:
    ""      : 'index'
    "*cat"  : 'list'

  index: () ->
    console.log "indexAction"

  list: () ->
#    view = Sap.Views.GoodsList
#    this.swap(view)
    view = new Sap.Views.GoodsList(collection: this.collection)
    $('.span10').html(view.render().$el)
    console.log 'ListAction'
)