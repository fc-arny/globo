angular.module('gm.util.filters').filter('decimal', ->
  (input, part = 'first') ->
    if part is 'first'
      parseInt input
    else if part is 'last'
      val = Math.ceil(input * 100 - Math.floor(input) * 100)
      val = '0' + val if val < 10
      val
    else
      parseFloat(input)

)