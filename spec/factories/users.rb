FactoryGirl.define do
  factory :user do
    username 'user'
    email 'mail@mail.com'
    password "password"
    password_confirmation "password"
  end
end