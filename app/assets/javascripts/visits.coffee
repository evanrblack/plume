$(document).on 'turbolinks:load', ->
  # For managing visits
  if $('#manage-visits').length
    refreshClients()

  # Click client -> get visits
  $('#clients').on 'click', 'a.client', (event) ->
    event.preventDefault()
    # Show active
    $('#clients a.client').removeClass('active')
    $(this).addClass('active')
    # Get visits
    clientId = $(this).data('client-id')
    $.getJSON '/visits.json', { client_id: clientId }, (visits) ->
      # Clear out stuff
      $('#visits ul').empty()
      $('#caregivers ul').empty()
      # Fill visits
      for visit in visits
        listItem = $("""
          <li>
            <a href="#" class="visit"
            data-visit-id="#{visit.id}"
            data-client-id="#{visit.client_id}"
            data-start-time-planned="#{visit.start_time_planned}"
            data-end-time-planned="#{visit.end_time_planned}">
              #{visit.text}
            </a>
          </li>
        """)
        if visit.unfilled
          listItem.append("""
            <span class="label label-danger">UNFILLED</span>
          """)
        else
          listItem.append("""
            <span class="label label-success">FILLED</span>
          """)
        $('#visits ul').append(listItem)

  # Click visit -> get caregivers
  $('#visits').on 'click', 'a.visit', (event) ->
    event.preventDefault()
    # Show active
    $('#visits a.visits').removeClass('active')
    $(this).addClass('active')
    # Get caregivers
    clientId = $(this).data('client-id')
    startTimePlanned = $(this).data('start-time-planned')
    endTimePlanned = $(this).data('end-time-planned')
    $.getJSON '/visits.json', { client_id: clientId, start_time_planned: startTimePlanned, end_time_planned: endTimePlanned }, (caregivers) ->
      caregiverList = $('#caregivers ul')
      caregiverList.empty()
      for caregiver in caregivers
        listItem = $("""
          <li>
            <a href="#" class="caregiver" data-caregiver-id="#{caregiver.id}">
              #{caregiver.name}
            </a>
            <br>
            <strong>Match Score:</strong>
            #{caregiver.score}%
            <br>
            <strong>Missing Tags:</strong>
            #{caregiver.missing_tags.join(', ')}
            <br>
            <strong>Distance:</strong>
            #{caregiver.distance} miles
          </li>
        """)
        caregiverList.append(listItem)

  # Click caregiver -> create / update shift
  $('#caregivers').on 'click', 'a.caregiver', (event) ->
    event.preventDefault()

    # Create visit
    client = $('#clients .client.active')
    visit = $('#visits .visit.active')
    clientId = client.data('client-id')
    visitId = visit.data('visit-id')
    startTimePlanned = visit.data('start-time-planned')
    endTimePlanned = visit.data('end-time-planned')
    caregiver = $(this)
    caregiverId = caregiver.data('caregiver-id')

    unless visitId?
      $.ajax({
        method: 'POST',
        url: '/visits.json',
        dataType: 'json',
        data: { client_id: clientId, start_time_planned: startTimePlanned, end_time_planned: endTimePlanned, caregiver_id: caregiverId }
      }).done ->
        $('#caregivers ul').empty()
        visit.parent().find('.label').removeClass('label-danger').addClass('label-success').text('FILLED')
        countLabel = client.parent().find('.label')
        countLabel.text(countLabel.text() - 1)
        if countLabel.text() == '0'
          countLabel.remove()
        $('#visits a.visit').removeClass('active')
    else
      $.ajax({
        method: 'PATCH',
        url: "/visits/#{visitId}.json",
        dataType: 'json',
        data: { caregiver_id: caregiverId }
      }).done ->
        
  

refreshClients = ->
  clientList = $('#clients ul')
  $.getJSON '/visits.json', (clients) ->
    # Clear out stuff
    clientList.empty()
    $('#visits ul').empty()
    $('#caregivers ul').empty()
    for client in clients
      listItem = $("""
        <li>
          <a href='#' class="client" data-client-id="#{client.id}">
            #{client.name}
          </a>
          </li>
        """)
      if client.unfilled > 0
        listItem.append("""
          <span class="label label-danger">#{client.unfilled}</span>
        """)
      clientList.append(listItem)
