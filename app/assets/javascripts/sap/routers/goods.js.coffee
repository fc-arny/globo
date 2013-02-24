Sap.Routers.Goods = Support.SwappingRouter.extend(
  initialize: (data) ->
    console.log 'Init Route'
    console.log(data.goods)
    this.el = $('.span10')
    this.collection = data.goods
    this.categies = data.categories

  routes:
    ""      : 'index'
    "*categories"  : 'list'

  index: () ->
    console.log "indexAction"
    view = new Sap.Views.GoodsIndex
    $('.span10').html(view.render().$el)

  list: (categoriesUrl, page) ->
    route       = this
    goods       = new Sap.Collections.Goods
    categories  = Sap.categories.getByUrl(categoriesUrl)

    categoryIds = []
    for category in categories.models
      categoryIds.push category.get('id')

    goods.fetch(
      data:
        page: page
        category: categoryIds
      success:->
        console.log 'ListAction'

        view = new Sap.Views.GoodsList(collection:goods)
        route.swap(view)
    )

)