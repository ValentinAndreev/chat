# frozen_string_literal: true
class Chatroom < ApplicationRecord
  has_many :chatroom_users, dependent: :destroy
  has_many :users, through: :chatroom_users
  has_many :messages, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: { maximum: 20,
    too_long: "%{count} characters is the maximum allowed" }
end
