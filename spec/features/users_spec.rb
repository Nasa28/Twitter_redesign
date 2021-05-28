require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  let(:user) do
    User.new(username: 'China', full_name: 'Kalu chinasa', email: 'chinasa24@gmail.com', password: '123456')
  end
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
      expect(page).to_not have_content('Welcome! You have signed up successfully')
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
      expect(page).to have_content('Welcome! You have signed up successfully')
    end
  end
end

RSpec.feature 'Users', type: :feature do
  let(:user) do
    User.new(username: 'China', full_name: 'Kalu chinasa', email: 'chinasa24@gmail.com', password: '123456')
  end
  let(:my_user) { User.create(username: 'Chinasa', password: '123456') }

  context 'loging in:' do
    scenario 'succesfully log in' do
      visit new_user_session_path
      fill_in 'username', with: my_user.username
      fill_in 'password', with: my_user.password
      click_on 'Log In'
      expect(page).to have_content('Signed in successfully')
    end
    scenario 'unsuccesfully Log In' do
      visit new_user_session_path
      fill_in 'password', with: my_user.password
      click_on 'Log In'
      expect(page).to have_content('Invalid Username or password')
    end
  end

  context ' Log out' do
    scenario 'log out successfully' do
      visit new_user_session_path
      fill_in 'username', with: my_user.username
      fill_in 'password', with: my_user.password
      click_on 'Log In'
      click_on 'SIGN OUT'
      visit root_path
      expect(page).to have_content('sign in')
    end
  end
end
