FactoryGirl.define do
  factory :chatroom_user do
    association :chatroom, factory: :chatroom
    association :user, factory: :user
  end
end