class @RequestQueue
  constructor: (callback, interval = 1000, async_event = false)->
    @interval = interval
    @callback = callback
    @async_event = async_event

    @_queue = []; @_lock = false; @_timer = null

  push: (data)->
    @_queue.push(data)
    clearTimeout(@_timer)

    @_timer = setTimeout(=>

      params = @_queue.pop(); @_queue = []; @_lock = true
      @callback(params)

      if @async_event
        $(document).on @async_event, -> @_lock = false
      else
        @_lock = false

    , @interval)