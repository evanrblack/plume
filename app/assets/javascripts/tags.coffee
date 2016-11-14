$(document).on 'turbolinks:load', ->
  # Runs on load
  $(".tag input[type='checkbox']").each (index, element) ->
    checkbox = $(element)
    if checkbox.is(':checked')
      checkbox.parent().addClass('active')

  # Runs on change
  $(".tag input[type='checkbox']").on 'change',  ->
    if this.checked
      $(this).parent().addClass('active')
    else
      $(this).parent().removeClass('active')
