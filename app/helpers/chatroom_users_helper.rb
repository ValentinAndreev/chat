# frozen_string_literal: true
module ChatroomUsersHelper
  def joined?(user, chatroom)
    chatroom.chatroom_users.find_by user_id: user.id
  end

  def owner(chatroom)
    User.find_by_id(chatroom.user_id)
  end

  def messages(chatroom)
    chatroom.messages.length
  end
end
