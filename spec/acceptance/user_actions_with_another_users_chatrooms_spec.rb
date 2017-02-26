require 'rails_helper'

feature 'Users actions with another users chatrooms' do
  background { log_in_user }
  given!(:anower_user) { create(:user, username: 'Anower name', email: 'another@mail.com') }
  given!(:chatroom) { create(:chatroom, user_id: anower_user.id) }  

  scenario 'user can open chatroom' do
    visit root_path
    click_on 'Show'
    expect(page).to have_content('All messages')
  end

  scenario "user can't edit and delete another users chatroom" do
    expect(page).to_not have_content('Edit chatroom')
    expect(page).to_not have_content('Delete chatroom')    
  end
end