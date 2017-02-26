require 'rails_helper'

feature 'Users actions with messages' do
  background { log_in_user }
  given!(:another_user) { create(:user, username: 'Another name', email: 'another@mail.com') }
  given!(:chatroom) { create(:chatroom, user_id: another_user.id) }
  given!(:message) { create(:message, chatroom: chatroom, user: @user) }
  given!(:another_message) { create(:message, text: 'another_message', chatroom: chatroom, user: another_user) }  

  before { visit root_path }  

  scenario 'user can join and leave chatroom' do
    click_on 'Join'
    expect(page).to have_content('You joined to charoom.')
    visit root_path
    click_on 'Leave'
    expect(page).to have_content('You leaved the chatroom.')
  end

  scenario 'user can create valid message in joined chatroom', js: true do
    click_on 'Join'
    expect(page).to have_content('You joined to charoom.')
    element = page.find("#text_field")
    element.set("message")  
    element.send_keys(:Enter)
    expect(find('#text_field').value).to eq('')
    expect(page).to have_content('message')
  end

  scenario "user can't create invalid message", js: true do
    click_on 'Join'
    expect(page).to have_content('You joined to charoom.')
    element = page.find("#text_field")
    text = "0"*301
    element.set(text)  
    element.send_keys(:Enter)
    expect(page).to_not have_content(text)   
  end

  scenario "user can't create message in not joined chatroom" do
    click_on 'Show'
    expect(page).to have_no_css("#text_field")
  end

  scenario 'user can see another user message in chatroom' do
    click_on 'Show'
    expect(page).to have_content('another_message')
  end

  scenario 'user can see count of messages' do
     expect(page).to have_content('(2 messages)')
  end
end