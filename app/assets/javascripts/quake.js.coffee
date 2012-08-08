class window.Quake
  constructor: (opts) ->
    @down = false
    $('.quake').remove()
    $('body').append(@terminal())
    @input = $('.quake input')
    @input.keyup @search

  speed: 300

  setLastSearch: (val) =>
    localStorage.lastSearch = val if localStorage

  setLastResult: (val) =>
    localStorage.lastResult = val if localStorage

  lastSearch: =>
    localStorage.lastSearch if localStorage and localStorage.lastSearch

  lastResult: =>
    localStorage.lastResult if localStorage and localStorage.lastResult

  terminal: =>

    div     = $ '<div class = "quake"></div>'
    results = $ '<div class = "results"></div>'

    results.html(@lastResult()) if @lastResult

    div.append results

    input = $ '<input name="q" class="q" type="search" autosave="quake_search" placeholder="search..."/>'
    input.val( @lastSearch ) if @lastSearch

    div.append input
    div


  open:  =>
    @down = true
    opts =
      duration: @speed
      complete: ->
        $('.quake input').focus()

    $('.quake').animate { bottom: '45%'}, opts
    @input.fadeIn()

  close: =>
    @down = false
    $('.quake').animate { bottom: '100%'}, { duration: @speed }
    @input.fadeOut()

  toggle: =>
    if @down
      @close()
    else
      @open()

  search: (event) =>
    clearTimeout( @timeout ) if @timeout
    if event.which is 27
      event.preventDefault();
      @toggle()
    else
      @timeout = setTimeout @searchNow, 300

    false

  searchNow: =>
    $.getJSON('/search/index?q=' + @input.val(), @onResults)

  onResults: (data) =>
    $('.quake .results').empty()
    for record in data
      div = $ '<div></div>'

      ul = $ '<ul></ul>'
      console.log record
      for name, val of record
        console.log name,val
        li = $ '<li></li>'
        li.append name
        li.append ": "
        li.append val
        ul.append li

      div.append ul

      $('.quake .results').append div
      @setLastSearch @input.val()
      @setLastResult $('.quake .results').html()
