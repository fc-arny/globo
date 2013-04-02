Sap.Views.GoodsList = Support.CompositeView.extend(
  className: 'goods-content'

  initialize: (options) ->
    _.bindAll(@,'render')
    @category = options.category

  events:
    'click a.more' : 'more'
    'click .add-to-basket' : 'addToBasket'

  # Render good list
  render: () ->
    @renderLayout()
    @renderGoods(@collection)
    this

  # Render container for goods
  renderLayout: ()->
    # Reset collection
    Sap.collections.goods = @collection

    @$el.html(JST['goods/list'](
      goods   : @collection
      category: @category
    ))

  # Render goods
  renderGoods: (collection)->
    self = @
    collection.each((model)->
      item = new Sap.Views.GoodsItem(model:model)
      self.renderChild(item)
      self.$('.good-list').append(item.el)
    )

  changeContentFull:()->
    @$el.empty()
    @renderLayout()

  addToBasket: (event)->
    # Getting model by ID
    id = $(event.target).data('id')
    good = Sap.collections.goods.get $(event.target).data('id')

    # Add to basket
    $li = $('<li></li>')
    $li.html good.get('name')
    $li.prependTo $('.basket-items')

    console.log Sap.collections.goods

  # Load more goods
  more: ()->
    Sap.routers.goods.list(Sap.models.currentStore.get('url'), Sap.models.currentCategory.get('url'), 1)
)