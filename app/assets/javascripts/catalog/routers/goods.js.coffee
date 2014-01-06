###
# Main route class
###
class GM.Routers.Goods extends Support.SwappingRouter

  # -------------------------------------------------- Init router
  initialize: (data) ->
    @el = $('.goods')
    @collection = data.goods

  # -------------------------------------------------- Routers
  routes:
    ":store"              : 'index'
    ":store/:category"    : 'list'

  # -------------------------------------------------- Best offers of given store
  index: (store) ->
    store_model = GM.collections.stores.getByUrl(store)
    view = new GM.Views.GoodsIndex(model:store_model)
    this.swap(view)

  ###
  # Good list router, load goods by API
  ###
  list: (storeUrl, categoryUrl, loadMore = false) ->
    # Temp collection
    _goods = new GM.Collections.Goods()

    # Getting models by url
    store     = GM.collections.stores.getByUrl(storeUrl)
    category  = GM.collections.categories.getByUrl(categoryUrl)

    # Create collection
    if GM.collections.goods is undefined
      GM.collections.goods = new GM.Collections.Goods()

    # Reset page number
    unless loadMore
      GM.collections.goods.page = 0

    # Save current store and category
    GM.models.currentStore     = store
    GM.models.currentCategory  = category

    # Getting goods by AJAX
    _goods.fetch(
      add: true
      data:
        store     : GM.models.currentStore.id
        category  : GM.models.currentCategory.id
        page      : GM.collections.goods.page
        order_id  : if GM.models.order then GM.models.order.hash() else null
      success:()->
        if GM.views.goodsList is undefined || not GM.collections.goods.page
          # Fetch goods
          GM.views.goodsList = new GM.Views.GoodsList(
            collection: _goods
            category  : GM.models.currentCategory
          )
          GM.routers.goods.swap(GM.views.goodsList)
        else
          GM.views.goodsList.renderGoods(_goods)


        GM.collections.goods.add _goods.models

        # Increment loading page number
        GM.collections.goods.page++
    )

  # Private