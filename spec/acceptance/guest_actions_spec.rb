require 'rails_helper'

feature 'Guests actions' do
  background { visit root_path }

  scenario 'guest must see invitation to registration' do
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  scenario 'guest can register' do
    click_on 'Sign up'
    expect(page).to have_current_path(new_user_registration_path)
  end

  scenario 'guest can log in' do
    expect(page).to have_current_path(new_user_session_path)
  end

  scenario "guest can't see any chatrooms" do
    expect(page).to_not have_content 'chatrooms'
  end
end