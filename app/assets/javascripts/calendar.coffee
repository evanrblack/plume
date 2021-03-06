$(document).on 'turbolinks:load', ->
  calendar = $('.calendar')
  changeMonth(calendar, new Date())

  $('.calendar .previous').click (event) ->
    event.preventDefault()
    previousMonth = new Date($(this).data('date'))
    changeMonth(calendar, previousMonth)
    
  $('.calendar .next').click (event) ->
    event.preventDefault()
    nextMonth = new Date($(this).data('date'))
    changeMonth(calendar, nextMonth)

# TODO: See if this can be simplified
changeMonth = (cal, d) ->
  chosenYear = d.getFullYear()
  chosenMonth = d.getMonth()
  cal.find('.month').text("#{getMonthName(d)} (#{chosenYear})")
  firstDate = new Date(chosenYear, chosenMonth)
  firstDay = (firstDate.getDay() + 6) % 7 - 1  # modulo for monday = 0
  cal.find('.day').each (i, elem) ->
    date = new Date(chosenYear, chosenMonth, i - firstDay)
    day = $(elem)
    dayNum = day.find('.day-num')
    day.removeClass('outside')
    day.addClass('outside') if date.getMonth() != chosenMonth
    day.data('date', "#{date.getFullYear()}-#{date.getMonth() + 1}-#{date.getDate()}")
    # dayNum.removeClass('label-default label-primary')
    dayNum.text(date.getDate())
  previousDate = new Date(chosenYear, chosenMonth-1)
  nextDate = new Date(chosenYear, chosenMonth+1)
  cal.find('.previous').data('date', previousDate.toString())
  cal.find('.next').data('date', nextDate.toString())

# Util
MONTH_NAMES = [
  'January'
  'February'
  'March'
  'April'
  'May'
  'June'
  'July'
  'August'
  'September'
  'October'
  'November'
  'December'
]

getMonthName = (d) ->
  return MONTH_NAMES[d.getMonth()]
