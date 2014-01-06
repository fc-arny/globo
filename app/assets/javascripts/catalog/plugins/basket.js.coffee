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
        @order = new GM.Models.Order @options.order
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
        _this._buildOrderItem(item)

    ###
    #
    ###
    _buildOrderItem:(item)->
      li = JST['orders/item'](item:item)
      @$basketItems.prepend li

    ###
    # Add good in basket
    ###
    _onAddToBasketClick: (event)->
      _this = @
      $goodItem = $(event.currentTarget).closest(@options.selectors.goodItem)

      # Get data
      id = $goodItem.data('item_id')
      name = $goodItem.data('name')

      item = new GM.Models.OrderItem(order_hash: @order.hash())

      item.save(
        value         : 1
        good_item_id  : id
      ,
        success: ->
          _this._buildOrderItem(item)
      )


    ###
    # Update order item count
    ###
    _updateValue:(orderItemId, value) ->
      orderItem = @order.items.where(id:orderItemId)

      orderItem = orderItem[0]
      orderItem.set(value:value)
      orderItem.save()

    ###
    # Decrese good value
    ###
    _onGoodMinusClick:(event)->
      # Update markup
      $value = $(event.currentTarget).closest('.spin').find('.count')
      value = new Number( $value.text() ) - 1

      $value.html value

      if value == 0
        $value.closest('.basket-item').remove()

      # Update data
      orderItemId = $(event.currentTarget).closest('.basket-item').data('order_item_id')
      @_updateValue( orderItemId, value )


    ###
    # Increase goods value
    ###
    _onGoodPlusClick: (event)->
      # Update html
      $value = $(event.currentTarget).closest('.spin').find('.count')
      value = new Number( $value.text() ) + 1
      $value.html value

      # Update data
      orderItemId = $(event.currentTarget).closest('.basket-item').data('order_item_id')
      @_updateValue( orderItemId, value )

    ###
    # Remove good from basket
    ###
    _onGoodRemove: (event) ->
      $basketItem = $(event.currentTarget).closest('.basket-item')
      orderItemId = $basketItem.data('order_item_id')
      $basketItem.remove()

      @_updateValue( orderItemId, 0 )

  # Create plugin
#  GM.createjQueryPlugin Basket

) window, jQuery