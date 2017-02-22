# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
  $("#new_message").on "keypress", (e) ->
    if e && e.keyCode == 13
      e.preventDefault()
      $(this).submit()

  $("#new_message").on "submit", (e) ->
    e.preventDefault()
    chatroom_id = $("active").data("chatroom")
    text = $("#text_field").val()
    App.chatroom.send_message(chatroom_id, text)
    $("#text_field").val("")