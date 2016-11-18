$(document).on 'turbolinks:load', ->
  mouseDown = false

  $(document).on 'mousedown', ->
    mouseDown = true

  $(document).on 'mouseup', ->
    mouseDown = false

  # For interacting with on a form.
  $('#schedule td.seg').on 'mouseover', (event) ->
    if mouseDown
      $(this).toggleClass('active')
      refreshWeek()
  $('#schedule td.seg').on 'mousedown', (event) ->
    $(this).toggleClass('active')
    refreshWeek()

showWeek = ->
  field = $("input[id$='_week_b']")

refreshWeek = ->
  field = $("input[id$='_week_b']")
  week = []
  for i in [0..168]
    week.push(0)
    
  $('td.seg').each (index, elem) ->
    box = $(elem)
    offset = box.data('offset')
    if box.hasClass('active')
      week[offset] = 1

    field.val(week.join(''))
