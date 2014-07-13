((angular) ->
  angular.module('gm.store.filters').filter('decimal_part', ->
    (input, part = 'first') ->
      if part is 'first'
        parseInt input
      else if part is 'last'
        val = Math.ceil(input * 100 - Math.floor(input) * 100)
        val = '0' + val if val < 10
        val
      else
        throw 'Wrong param \'part\' value'

  )
)(window.angular)