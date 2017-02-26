require 'rails_helper'

feature 'Users creation and login' do
  scenario 'sign up' do
    visit new_user_registration_path
    fill_in 'Username', with: 'username'
    fill_in 'Email', with: 'mail@mail.com'
    fill_in 'Password', with: 'password', match: :prefer_exact
    fill_in 'Password confirmation', with: 'password', match: :prefer_exact
    click_on 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'user login with wrong credentials' do
    visit new_user_session_path
    fill_in 'Username', with: 'wrong_username'
    fill_in 'Password', with: 'wrong_password'
    click_on 'Log in'
    expect(page).to have_content 'Invalid Username or password.'
  end

  scenario 'user log in and logout' do
    log_in_user
    click_on 'Logout'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end