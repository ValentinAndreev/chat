App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    active_chatroom = $("active[data-chatroom='#{data.chatroom_id}']")
    if active_chatroom.length > 0
      $("active").append(data.message)
      $("#text_field").val("")
    else
      $("#list-#{data.chatroom_id}").css("font-weight", "bold")

  send_message: (chatroom_id, message) ->
    @perform "send_message", {chatroom_id: chatroom_id, text: message}