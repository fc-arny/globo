Sap.Views.GoodsList = Support.CompositeView.extend(
  className: 'good-list'

  initialize: (options) ->
    _.bindAll(@,'render')
    @category = options.category



  events:
    'click a.more': 'more'

  # Render good list
  render: () ->
    @renderLayout()
    @renderGoods()
    this

  # Render container for goods
  renderLayout: ()->
    @$el.html(JST['goods/list'](
      goods   : @collection
      category: @category
    ))

  # Render goods
  renderGoods: ()->
    self = @
    @collection.each((model)->
      item = new Sap.Views.GoodsItem(model:model)
      self.renderChild(item)
      self.$('.goods').append(item.el)
    )

  # Load more goods
  more: ()->
    Sap.routers.goods.list(Sap.models.currentStore.get('url'),Sap.models.currentCategory.get('url'))
)