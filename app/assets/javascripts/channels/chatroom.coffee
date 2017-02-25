App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    active_chatroom = $("active[data-chatroom='#{data.chatroom_id}']")
    if active_chatroom.length > 0
      $(active_chatroom).append(data.message)
      $("#text_field").val("")
      $("body, html").animate({scrollTop: $(document).height()}, 400)
    else
      $("notice[data-chatroom='#{data.chatroom_id}']").empty()
      $("notice[data-chatroom='#{data.chatroom_id}']").append(" New messages!")
      blink = ->
        $("notice[data-chatroom='#{data.chatroom_id}']").fadeOut('slow').fadeIn('slow')
        setTimeout blink, 100
      blink()

  send_message: (chatroom_id, message) ->
    @perform "send_message", {chatroom_id: chatroom_id, text: message}