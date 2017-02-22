# frozen_string_literal: true
module ChatroomUsersHelper
  def joined?(user, chatroom)
    chatroom.chatroom_users.find_by user_id: user.id
  end
end
