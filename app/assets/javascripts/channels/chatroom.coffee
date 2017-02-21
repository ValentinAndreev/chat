App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    active_chatroom = $("##{data.chatroom_id}")
    console.log(active_chatroom)
    if active_chatroom.length != 0 
      $(active_chatroom).append(data.message)
      $("#text_field").val("")
    else
      $("#list-#{data.chatroom_id}").css("font-weight", "bold")