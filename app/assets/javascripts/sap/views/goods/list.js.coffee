###
# Main class for working with goods, basket ant etc
###
class Sap.Views.GoodsList extends Support.CompositeView
  className: 'goods-content'

  ###
  # Bind events for inside elements
  ###
  events:
    'click a.more'          : 'more'

  ###
  # PUBLIC
  ###

  ###
  # Initialization view
  ###
  initialize: (options) ->
    @category = options.category

    # Prepare
    @_cache()

  ###
  # Render good list
  ###
  render: () ->
    @renderLayout()
    @renderGoods(@collection)
    this

  ###
  # Render container for goods
  ###
  renderLayout: ()->
    # Reset collection
    Sap.collections.goods = @collection

    @$el.html(JST['goods/list'](
      goods   : @collection
      category: @category
    ))

  ###
  # Render goods
  ###
  renderGoods: (collection)->
    self = @
    collection.each((model)->
      item = new Sap.Views.GoodsItem(model:model)
      self.renderChild(item)

      # Set data
      item.$el.attr('data-id', model.get('id'))
      item.$el.attr('data-name', model.get('name'))

      # Append
      self.$('.good-list').append(item.el)
    )

    # Increment/Decrement goods in basket
#    Sap.models.order.addGood(good)


  # Load more goods
  more: ()->
    Sap.routers.goods.list(Sap.models.currentStore.get('url'), Sap.models.currentCategory.get('url'), 1)

  ###
  # PRIVATE
  ###

  ###
  # Cache DOM elements
  ###
  _cache: ->
    @$basket = $('.basket')