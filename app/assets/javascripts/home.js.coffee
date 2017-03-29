# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('a.donate').click ->
    _gaq.push(['_trackEvent', 'Donate', 'buttonClick', 'Sent to Food Bank site'])

  $('form.new_volunteer input[type="submit"]').click ->
    $(this).prop('disabled', true)
    $(this).parents('form').submit()
