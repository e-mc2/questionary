require 'rails_helper'

feature 'User sign in', %q{
  In order to be able to ask questions
  As an user
  I want to be sign in
} do

  given(:user) { create(:confirmed_user) }

  scenario 'User has login and password is trying to sign in' do
    login_as(user)
    expect(page).to have_content 'Signed in successfully'
    expect(current_path).to eq root_path
  end

  scenario 'Unregistered user is trying to sign in' do
    visit new_user_session_path
    fill_in 'Email', with: 'testwrong@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'

    expect(page).to have_content 'Invalid Email or password'
    expect(current_path).to eq new_user_session_path
  end

  scenario 'User loging out from his session' do
    login_as(user)
    visit new_user_session_path
    click_on 'Log out'

    expect(page).to have_content 'Signed out successfully'
    expect(current_path).to eq root_path
  end

  scenario 'User signing up in applicatioan' do
    visit new_user_registration_path
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_on 'Sign up'

    expect(page).to have_content 'A message with a confirmation link'
    expect(current_path).to eq root_path
  end

end
