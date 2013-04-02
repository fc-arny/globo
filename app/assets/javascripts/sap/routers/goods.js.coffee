Sap.Routers.Goods = Support.SwappingRouter.extend(

  # Constants
  LIST_LIMIT: 3

  # Init router
  initialize: (data) ->
    @el = $('.content-main')
    @collection = data.goods
    @categies = data.categories


  # Routers
  routes:
    ":store"              : 'store'
    ":store/:category"    : 'list'

  ###
  # Best offers of given store
  ###
  store: (store) ->
    store_model = Sap.collections.stores.getByUrl(store)
    view = new Sap.Views.GoodsStore(model:store_model)
    this.swap(view)

  ###
  # Good list router, load goods by API
  ###
  list: (storeUrl, categoryUrl, loadMore = 0) ->
    # Temp collection
    _goods = new Sap.Collections.Goods()

    # Getting models by url
    store     = Sap.collections.stores.getByUrl(storeUrl)
    category  = Sap.collections.categories.getByUrl(categoryUrl)

    # Create collection
    if Sap.collections.goods is undefined
      Sap.collections.goods = new Sap.Collections.Goods()

    # Reset page number
    if not loadMore
      Sap.collections.goods.page = 0

    # Save current store and category
    Sap.models.currentStore     = store
    Sap.models.currentCategory  = category

    # Getting goods by AJAX
    _goods.fetch(
      add: true
      data:
        store     : Sap.models.currentStore.id
        category  : Sap.models.currentCategory.id
        limit     : @LIST_LIMIT
        offset    : @LIST_LIMIT * Sap.collections.goods.page        # TODO: Лучше передавать на номер страницы!
      success:()->
        if Sap.views.goodsList is undefined || not Sap.collections.goods.page
          # Fetch goods
          Sap.views.goodsList = new Sap.Views.GoodsList(
            collection: _goods
            category  : Sap.models.currentCategory
          )
          Sap.routers.goods.swap(Sap.views.goodsList)
        else
          Sap.views.goodsList.renderGoods(_goods)

        # Collect all loaded good in collection
        Sap.collections.goods.add _goods.models

        # Increment loading page number
        Sap.collections.goods.page++
    )

  # Private
)