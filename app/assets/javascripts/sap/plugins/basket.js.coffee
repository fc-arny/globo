# jQuery plugin for basket
((window, $)->
  class Basket
    ###
    # Constructor
    ###
    constructor: ($node, options)->
      @$node = $node
      @options = $.extend true,
        classes:
          basket
)
