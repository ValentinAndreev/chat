FactoryGirl.define do
  factory :message do
    text 'message'
    association :chatroom, factory: :chatroom
    association :user, factory: :user
  end
end