$(document).on 'turbolinks:load', ->
  # For editing on profiles.
  $('#tasks').on 'click', '.task a.remove', (event) ->
    event.preventDefault()
    task = $(this).closest('.task')
    id = task.find("[id$='_id']").val()
    if id
      task.find("[name*='_remove']").val('1')
      task.hide()
    else
      task.remove()

  count = 1000
  $('#tasks').on 'click', 'button.add', (event) ->
    descriptionField = $('#description_copy')
    descriptionField.removeClass('error')
    description = descriptionField.val()
    if description and description.trim() != ''
      descriptionField.val('')
      # The dynamically added ones don't require id or _remove.
      $('#tasks ul').append("""
        <li class="task">
          #{description}
          <a href="#" class="remove"><i class="fa fa-times"></i></a>
          <input
            name="client[tasks_attributes][#{count}][description]"
            type="hidden"
            value="#{description}">
        </li>
      """)
      count += 1
    else
      descriptionField.addClass('error')
