###
#-----------------------------------------------------
# jQuery plugin for basket
#
# @author Arthur Shcheglov
#-----------------------------------------------------
###
((window, $)->

  class Basket
    @countTimer = null

    ###
    # Constructor
    ###
    constructor: ($node, options)->

      @$basket = $node

      defaults =
        order: {}
        selectors:
          # Goods
          goodsContainer: '.content-main'
          goodItem: '.good-item'
          addButton : '.add-to-basket'

          # Basket
          basketItems : '.basket-items'

      @options = $.extend defaults, options

      @_cache()
      @_bindEvents()
      @_init()

    ###
    # Inits
    ###
    _init: ->
      _this = @

      @$basketItems.html('Загрузка корзины...')

      # Create or Fetch current order
      if @options.order
        @order = new Sap.Models.Order @options.order
      else
        @order.save()

      # Markup for basket items
      @_buildBasket()

    ###
    # Bind events
    ###
    _bindEvents: ->
      # Basket
      @$basket.on 'click', '.spin .plus', (event) => @_onGoodPlusClick (event)
      @$basket.on 'click', '.spin .minus', (event) => @_onGoodMinusClick(event)
      @$basket.on 'click', '.remove', (event) => @_onGoodRemoveClick(event)

      # Others
      @$goodsContainer.on 'click', '.add-to-basket', (event) => @_onAddToBasketClick(event)

    ###
    # Cache DOM-objects
    ###
    _cache: ->
      @$goodsContainer = $(@options.selectors.goodsContainer)
      @$basketItems = $(@options.selectors.basketItems)

    ###
    # Create basket's markup
    ###
    _buildBasket: ->
      _this = @

      # Clear
      @$basketItems.html('')

      # Render good items
      @order.items.each (item)->
        li = JST['orders/item'](item:item)
        _this.$basketItems.prepend li


    ###
    # Add good in basket
    ###
    _onAddToBasketClick: (event)->
      $goodItem = $(event.currentTarget).closest(@options.selectors.goodItem)

      # Get data
      id = $goodItem.data('id')
      name = $goodItem.data('name')

      @_buildGoodItem(id, name)

    ###
    # Update order item count
    ###
    _updateCount:(orderItemId, count) ->
      orderItem = @order.items.where(id:orderItemId)

      orderItem = orderItem[0]
      orderItem.set(count:count)
      orderItem.save()

    ###
    # Decrese good count
    ###
    _onGoodMinusClick:(event)->
      # Update markup
      $count = $(event.currentTarget).closest('.spin').find('.count')
      count = new Number( $count.text() ) - 1

      $count.html count

      if count == 0
        $count.closest('.basket-item').remove()

      # Update data
      orderItemId = $(event.currentTarget).closest('.basket-item').data('order_item_id')
      @_updateCount( orderItemId, count )


    ###
    # Increase goods count
    ###
    _onGoodPlusClick: (event)->
      # Update html
      $count = $(event.currentTarget).closest('.spin').find('.count')
      count = new Number( $count.text() ) + 1
      $count.html count

      # Update data
      orderItemId = $(event.currentTarget).closest('.basket-item').data('order_item_id')
      @_updateCount( orderItemId, count )

    ###
    # Remove good from basket
    ###
    _onGoodRemove: (event) ->
      $basketItem = $(event.currentTarget).closest('.basket-item')
      orderItemId = $basketItem.data('order_item_id')
      $basketItem.remove()

      @_updateCount( orderItemId, 0 )

  # Create plugin
  Sap.createjQueryPlugin Basket

) window, jQuery