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
    'click .add-to-basket'  : '_onAddToBasket'

  # -------------------------------------------------- Initialization view
  initialize: (options) ->
    @category = options.category

#    _.bindAll(@, 'updateCount')
#    Sap.vent.bind('basket.updateCount', @updateCount)

    # Prepare
    @_cache()

  # -------------------------------------------------- Render good list
  render: () ->
    @renderLayout()
    @renderGoods(@collection)
    this

  # -------------------------------------------------- Render container for goods
  renderLayout: ()->
    # Reset collection
    Sap.collections.goods = @collection

    @$el.html(JST['goods/list'](
      goods   : @collection
      category: @category
    ))


  # -------------------------------------------------- Render goods
  renderGoods: (collection)->
    self = @
    collection.each((model)->
      item = new Sap.Views.GoodsItem(model:model)
      self.renderChild(item)

      self.$('.good-list').append(item.el)
    )

    # Increment/Decrement goods in basket
#    Sap.models.order.addGood(good)


  # -------------------------------------------------- Load more goods
  more: ()->
    Sap.routers.goods.list(Sap.models.currentStore.get('url'), Sap.models.currentCategory.get('url'), true)

  updateCount: ->
    console.log 'up'

  # -------------------------------------------------- Generate event 'addToBasket'
  _onAddToBasket:(event) ->
    self = @
    goodItemId  = $(event.currentTarget).data('good_item_id')

    if Sap.models.order
      @addToBasket goodItemId
    else
      order = new Sap.Models.Order().save(null, success:(response)->
        unless response.isNew()
          Sap.models.order = order
          self.addToBasket goodItemId
      )


  # -------------------------------------------------- Create makup for event 'addToBasket'
  addToBasket:(goodItemId) ->
    orderItem = new Sap.Models.OrderItem(
      good_item_id  : goodItemId
      count         : 1
    )

    orderItem.save(null, success:(response)->
      orderItem._parseGoodItem()
      Sap.models.order.items.add orderItem
      # Trigger event
      Sap.vent.trigger 'addToBasket', orderItem
    )

  # Cache DOM elements

  _cache: ->
    @$basket = $('.basket')