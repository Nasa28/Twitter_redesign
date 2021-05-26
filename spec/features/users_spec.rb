require 'rails_helper'

RSpec.feature "Users", type: :feature do
  let(:user) { User.new(username: 'Chinasa', full_name: 'Kalu chinasa', email: 'chinasa@gmail.com', password: '123456', ) }
  let(:my_user) { User.create(username: 'Chinasa', password: '123456') }
  context 'Create a new user' do

    scenario 'should not be successful' do
      visit new_user_registration_path
      within('form') do
        fill_in 'username', with: user.username
        fill_in 'full_name', with: user.full_name
        
        fill_in 'email', with: ''
        fill_in 'password', with: user.password
        fill_in 'password_confirmation', with: user.password
      end
        click_button 'Sign Up'
      expect(page).to_not have_content('Sign Out')
    end

    scenario 'should be successful' do
      visit new_user_registration_path
      within('form') do
        fill_in 'username', with: user.username
        fill_in 'full_name', with: user.full_name
        
        fill_in 'email', with: user.email
        fill_in 'password', with: user.password
        fill_in 'password_confirmation', with: user.password
      end
        click_button 'Sign Up'
      expect(page).to have_content('Sign Out')
    end
  end

  context ' Log in user' do
    scenario 'should not be successful' do
      visit new_user_session_path
      within('form') do
        fill_in 'username', with: my_user.username
        fill_in 'password', with: my_user.password
      end
        click_button 'Log In'
      expect(page).to_not have_content('Sign Out')
    end
  end
end
