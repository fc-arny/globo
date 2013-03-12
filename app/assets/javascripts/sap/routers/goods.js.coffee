Sap.Routers.Goods = Support.SwappingRouter.extend(
  initialize: (data) ->
    this.el = $('.content-main')
    this.collection = data.goods
    this.categies = data.categories

  routes:
    ""                    : 'main'
    ":store"              : 'store'
    ":store/:category"    : 'list'

  store: (store) ->
    store_model = Sap.stores.getByUrl(store)
    view = new Sap.Views.GoodsStore(model:store_model)
    this.swap(view)

  main: () ->
    view = new Sap.Views.GoodsIndex
    $('.content-main').html(view.render().$el)

  list: (store, category) ->
    route       = this

    goods = new Sap.Collections.Goods
    store_model         = Sap.stores.getByUrl(store)
    category_model      = Sap.categories.getByUrl(category)

    # Getting goods by AJAX
    goods.fetch(
      data:
        store     : store_model.id
        category  : category_model.id
      success:->
        view = new Sap.Views.GoodsList(collection:goods)
        route.swap(view)
    )

)