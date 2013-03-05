Sap.Routers.Goods = Support.SwappingRouter.extend(
  initialize: (data) ->
    this.el = $('.span10')
    this.collection = data.goods
    this.categies = data.categories

  routes:
    ""                    : 'main'
    ":store"              : 'store'
    ":store/*categories"  : 'list'

  store: (store) ->
    console.log 'STORE'

  main: () ->
    console.log "MAIN"
    view = new Sap.Views.GoodsIndex
    $('.content-main').html(view.render().$el)

  list: (store,categories) ->
    console.log 'LIST'
    route       = this
    goods       = new Sap.Collections.Goods
    categories  = Sap.categories.getByUrl(categories)

    categoryIds = []
    for category in categories.models
      categoryIds.push category.get('id')

    goods.fetch(
      data:
        category: categoryIds
      success:->
        console.log 'ListAction'

        view = new Sap.Views.GoodsList(collection:goods)
        route.swap(view)
    )

)