###
# Basket view
###
class GM.Views.Basket #extends Support.CompositeView

  el: '.basket'

  # -------------------------------------------------- Bind events
  events:
    'click .spin .plus' : '_onPlusClick'
    'click .spin .minus': '_onMinusClick'

  # -------------------------------------------------- Constructor
  initialize: (options) ->

    # Events
    GM.vent.bind GM.E_ORDER_ADD_TO_BASKET, @addToBasket, @
    GM.vent.bind GM.E_ORDER_UPDATE_VALUE, @updateValue, @

  cleanup: ->
    @undelegateEvents()

  # -------------------------------------------------- Add good to basket
  addToBasket: (orderItemId) ->
    orderItem = GM.models.order.items.get orderItemId
    @renderItem orderItem

  # -------------------------------------------------- Render basket
  render: ->
    console.log 'render'

    self = @

    # Render order items
    @collection.each ((model)->

      self.renderItem model
    )
#    console.log @$el
#    $('.basket').html(@$el.html())
    @updateSum()
    @

  # -------------------------------------------------- Render basket item
  renderItem:(model) ->
    #unless @$el.find("basket_item_#{model.get('good_item_id')}")
    $li = $(JST['orders/item'](item:model))
    @$el.find('.basket-items').append $li

  # -------------------------------------------------- Recalc order sum
  updateSum: ->
    sum = GM.models.order.items.calcSum()
    sum = Math.floor(sum * 100) / 100
    @$el.find('.sum').html(sum + ' р.')

  # -------------------------------------------------- Update order item count
  updateValue:(goodItemId, value) ->
    $basketItem = @$el.find "#basket-good_item_#{goodItemId}"

    # Update model data
    orderItem = GM.models.order.items.get $basketItem.data('id')
    orderItem.set(value:value)

    # Update markup and send data to server
    if value == 0
      $basketItem.closest('.basket-item').remove()
      orderItem.destroy()
    else
      $basketItem.find('.spin .count').html value
      orderItem.save()

    # Update order sum
    @updateSum()

  # -------------------------------------------------- Decrease good count
  _onMinusClick:(event)->
    @_triggerUpdateValue event, '-'


  # --------------------------------------------------Increase good count
  _onPlusClick: (event)->
    @_triggerUpdateValue event, '+'

  # -------------------------------------------------- Trigger event for updating count
  _triggerUpdateValue:(event, operation)->
    console.log 'trigger'
#    event.stopPropagation()
    $basketItem = $(event.currentTarget).closest '.basket-item'
    orderItem   = GM.models.order.items.get $basketItem.data 'id'

    value       = new Number(orderItem.get 'value')
    goodItemId  = orderItem.goodItem.get 'id'

    switch operation
      when '+' then value += 1
      when '-' then value -= 1

    GM.vent.trigger GM.E_ORDER_UPDATE_VALUE, goodItemId, value