###
# Basket view
###
class Sap.Views.Basket extends Support.CompositeView

  el: '.basket'

  # -------------------------------------------------- Bind events
  events:
    'click .spin .plus' : '_onPlusClick'
    'click .spin .minus': '_onMinusClick'

  # -------------------------------------------------- Constructor
  initialize: (options) ->
    # Events
    Sap.vent.bind Sap.E_ORDER_ADD_TO_BASKET, @addToBasket, @
    Sap.vent.bind Sap.E_ORDER_UPDATE_COUNT, @updateCount, @


  # -------------------------------------------------- Add good to basket
  addToBasket: (orderItemId) ->
    orderItem = Sap.models.order.items.get orderItemId
    @renderItem orderItem

  # -------------------------------------------------- Render basket
  render: ->
    self = @

    # Render order items
    @collection.each ((model)->
      self.renderItem model
    )
    @updateSum()
    @

  # -------------------------------------------------- Render basket item
  renderItem:(model) ->
#    unless @$el.find("basket_item_#{model.get('good_item_id')}")
    $li = $(JST['orders/item'](item:model))
    @$el.find('.basket-items').append $li

  # -------------------------------------------------- Recalc order sum
  updateSum: ->
    sum = Sap.models.order.items.calcSum()
    sum = Math.floor(sum * 100) / 100
    @$el.find('.sum').html(sum + ' р.')

  # -------------------------------------------------- Update order item count
  updateCount:(goodItemId, count) ->
    $basketItem = @$el.find "#basket-good_item_#{goodItemId}"

    # Update model data
    orderItem = Sap.models.order.items.get $basketItem.data('id')
    orderItem.set(count:count)

    # Update markup and send data to server
    if count == 0
      $basketItem.closest('.basket-item').remove()
      orderItem.destroy()
    else
      $basketItem.find('.spin .count').html count
      orderItem.save()

    # Update order sum
    @updateSum()

  # -------------------------------------------------- Decrease good count
  _onMinusClick:(event)->
    @_triggerUpdateCount event, '-'


  # --------------------------------------------------Increase good count
  _onPlusClick: (event)->
    @_triggerUpdateCount event, '+'

  # -------------------------------------------------- Trigger event for updating count
  _triggerUpdateCount:(event, operation)->
    $basketItem = $(event.currentTarget).closest '.basket-item'
    orderItem   = Sap.models.order.items.get $basketItem.data 'id'

    count       = new Number(orderItem.get 'count')
    goodItemId  = orderItem.goodItem.get 'id'

    switch operation
      when '+' then count += 1
      when '-' then count -= 1

    Sap.vent.trigger Sap.E_ORDER_UPDATE_COUNT, goodItemId, count