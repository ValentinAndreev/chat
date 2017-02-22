# frozen_string_literal: true
class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  validates :text, presence: true, length: { maximum: 300,
    too_long: "%{count} characters is the maximum allowed" }
end
