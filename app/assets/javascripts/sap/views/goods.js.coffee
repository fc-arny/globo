###
# Main class for working with goods, basket ant etc
###
class Sap.Views.GoodsList extends Support.CompositeView
  className: 'goods-content'

 # -------------------------------------------------- Bind events
  events:
    'click a.more'          : 'more'
    'click .actions .add-to-basket' : '_onAddToBasketClick'
    'click .actions .plus'          : '_onPlusClick'
    'click .actions .minus'         : '_onMinusClick'

  # -------------------------------------------------- Initialization view
  initialize: (options) ->
    console.log 'Init goods'
    @category = options.category

    @_cache()

    # Events
    Sap.vent.bind Sap.E_ORDER_UPDATE_COUNT, @updateCount, @

  # -------------------------------------------------- Render good list
  render: () ->
    @renderLayout()
    @renderGoods(@collection)
    @

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

  # -------------------------------------------------- Load more goods
  more: ()->
    store     = Sap.models.currentStore.get('url')
    category  = Sap.models.currentCategory.get('url')

    Sap.routers.goods.list store, category, true

  # -------------------------------------------------- Update order item count
  updateCount:(goodItemId, count) ->
    $goodItem = @$el.find "#good_item_#{goodItemId}"

    if count == 0
      $goodItem.closest('.basket-item').remove()
    else
      $goodItem.find('.actions .count').html count

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
      Sap.vent.trigger Sap.E_ORDER_ADD_TO_BASKET, orderItem
    )

  # -------------------------------------------------- Generate event 'addToBasket'
  _onAddToBasketClick:(event) ->
    self = @

    $goodItem = $(event.target).closest '.good-item'
    goodItem  =  Sap.collections.goods.get $goodItem.data('good_item_id')

    goodItem.set 'count', 1
    $goodItem.find('.actions').html JST['goods/actions'](good:goodItem)

    if Sap.models.order
      @addToBasket goodItem.get('id')
    else
      order = new Sap.Models.Order().save(null, success:(response)->
        unless response.isNew()
          Sap.models.order = order
          self.addToBasket goodItem.get('id')
      )

  # -------------------------------------------------- Increase good count
  _onPlusClick:(event) ->
    @_triggerUpdateCount event, '+'

  # -------------------------------------------------- Decrease good count
  _onMinusClick:(event) ->
    @_triggerUpdateCount event, '-'

  # -------------------------------------------------- Trigger event for updating count
  _triggerUpdateCount:(event, operation)->
    $goodItem = $(event.currentTarget).closest('.good-item')

    count = new Number($goodItem.find('.count').text())
    goodItemId = $goodItem.data 'good_item_id'

    switch operation
      when '+' then count += 1
      when '-' then count -= 1

    Sap.vent.trigger Sap.E_ORDER_UPDATE_COUNT, goodItemId, count

  _cache: ->
    @$basket = $('.basket')