class @RequestQueue
  constructor: (callback, interval = 1000)->
    @callback = callback
    @interval = interval

    @_queue = []; @_timer = null

  push: (data)->
    @_queue.push(data)
    clearTimeout(@_timer)

    @_timer = setTimeout( =>
        params = @_queue.pop(); @_queue = [];
        @callback(params)
    , @interval)

    @_queue