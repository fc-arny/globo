###
# Basket view
###
class Sap.Views.Basket extends Support.CompositeView

  el: '.basket'

  # -------------------------------------------------- Constructor
  initialize: (options) ->
    _.bindAll(@, 'addToBasket')

    Sap.vent.bind('addToBasket', @addToBasket)

  # -------------------------------------------------- Bind events
  events:
    'click .spin .plus' :'goodPlus'
    'click .spin .minus': 'goodMinus'

  _onAddToBasket: (event) ->
    Sap.vent.bind('addToBasket', @addToBasket, @)


  addToBasket: (orderItem) ->
    @renderItem orderItem

  # -------------------------------------------------- Render basket
  render: ->
    _this = @

    # Render order items
    @collection.each ((model)->
      _this.renderItem model
    )
    @

  # -------------------------------------------------- Render basket item
  renderItem:(model) ->
#    unless @$el.find("basket_item_#{model.get('good_item_id')}")
    $li = $(JST['orders/item'](item:model))
    @$el.find('.basket-items').append $li

  # -------------------------------------------------- Update order item count
  _updateCount:(orderItemId, count) ->
    orderItem = Sap.models.order.items.where(id:orderItemId)

    # Update Model
    orderItem = orderItem[0]
    orderItem.set(count:count)
    orderItem.save()

    Sap.vent.trigger('basket.updateCount', orderItem)

  # -------------------------------------------------- Decrese good count
  goodMinus:(event)->
    # Update markup
    $count = $(event.currentTarget).closest('.spin').find('.count')
    count = new Number( $count.text() ) - 1

    $count.html count

    if count == 0
      $count.closest('.basket-item').remove()

    # Update data
    orderItemId = $(event.currentTarget).closest('.basket-item').data('order_item_id')
    @_updateCount( orderItemId, count )

  # --------------------------------------------------Increase goods count
  goodPlus: (event)->
    # Update html
    $count = $(event.currentTarget).closest('.spin').find('.count')
    count = new Number( $count.text() ) + 1
    $count.html count

    # Update data
    orderItemId = $(event.currentTarget).closest('.basket-item').data('order_item_id')
    @_updateCount( orderItemId, count )


