require 'rails_helper'

feature 'Users actions with own chatrooms' do
  background { log_in_user }

  before do
    click_on 'New chatroom'
    fill_in 'Name', with: 'chatroom_name'
    click_on 'Create Chatroom'
    expect(page).to have_content('chatroom_name')
  end

  scenario 'user can edit chatrooms name' do
    click_on 'Edit chatroom'
    fill_in 'Name', with: 'chatroom_name_new'
    click_on 'Update Chatroom'
    expect(page).to have_content('chatroom_name_new')    
  end

  scenario 'user can delete chatroom' do
    click_on 'Delete chatroom'
    expect(page).to_not have_content('chatroom_name')     
  end
end