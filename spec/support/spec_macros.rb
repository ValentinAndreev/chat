module SpecMacros
  def log_in_user
    @user = create(:user)
    visit new_user_session_path
    fill_in 'Username', with: @user.username
    fill_in 'Password', with: @user.password
    click_on 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end
end