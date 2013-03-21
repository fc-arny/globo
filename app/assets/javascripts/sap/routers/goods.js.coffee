Sap.Routers.Goods = Support.SwappingRouter.extend(


  # Init router
  initialize: (data) ->
    @el = $('.content-main')
    @collection = data.goods
    @categies = data.categories


  # Routers
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

    if Sap.collections.goods isnt undefined
      Sap.collections.goods.page++
    else
      Sap.collections.goods = new Sap.Collections.Goods()

    Sap.models.currentStore     = Sap.collections.stores.getByUrl(store)
    Sap.models.currentCategory  = Sap.collections.categories.getByUrl(category)

    # Getting goods by AJAX
    Sap.collections.goods.fetch(
      add: true
      data:
        store     : Sap.models.currentStore.id
        category  : Sap.models.currentCategory.id
        limit     : 3
        offset    : 3*Sap.collections.goods.page
      success:()->
        if Sap.views.goodsList is undefined
          # Fetch goods
          Sap.views.goodsList = new Sap.Views.GoodsList(
            collection: Sap.collections.goods
            category  : Sap.models.currentCategory

          )
          Sap.routers.goods.swap(Sap.views.goodsList)
        else
          Sap.views.goodsList.renderGoods()
    )

  # Private

)