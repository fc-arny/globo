###
#-----------------------------------------------------
# jQuery plugin for basket
#
# @author Arthur Shcheglov
#-----------------------------------------------------
###
((window, $)->

  class Basket
    ###
    # Constructor
    ###
    constructor: ($node, options)->
      @$node = $node
      @options = $.extend true,
        selectors:
          basket : '.basket'
          addButton : '.add-to-basket'
          basketItems : '.basket-items'

      @_cache()
      @_bindEvents()

    ###
    # PUBLIC
    ###

    ###
    # PRIVATE
    ###

    ###
    # Bind events
    ###
    _bindEvents: ->
      @$node.on 'click', '.add-to-basket', (event) => @_onAddToBasketClick event
      console.log @$node


    ###
    # Cache DOM-objects
    ###
    _cache: ->
#      @$addButton = @$node.find @options.selectors.addButton
      @$basketItems = @$node.find @options.selectors.basketItems

    ###
    # Handler for "Add to Basket" click
    ###
    _onAddToBasketClick: (event) ->
      $li = $('<li></li>')
      $li.html 'Good'
      console.log @$basketItems
      $li.prependTo @$basketItems

  # Create plugin
  Sap.createjQueryPlugin Basket

) window, jQuery

