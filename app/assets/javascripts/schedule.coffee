$(document).on 'turbolinks:load', ->
  showWeek()
  mouseDown = false

  $(document).on 'mousedown', ->
    mouseDown = true

  $(document).on 'mouseup', ->
    mouseDown = false

  # For interacting with on a form.
  $('#schedule td.seg').on 'mouseover', (event) ->
    if mouseDown
      $(this).toggleClass('active')
      updateWeek()
  $('#schedule td.seg').on 'mousedown', (event) ->
    $(this).toggleClass('active')
    updateWeek()

showWeek = ->
  field = $("input[id$='_week_b']")
  value = field.val()
  $('td.seg').each (index, elem) ->
    box = $(elem)
    offset = box.data('offset')
    if value.charAt(offset) == '1'
      $(elem).addClass('active')

updateWeek = ->
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
