$(document).on 'turbolinks:load', ->
  navbar = $('#navbar-links')

  path = window.location.pathname
  navbar.find("[href$='#{path}']").parent().addClass('active')
