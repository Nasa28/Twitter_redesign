require 'rails_helper'
RSpec.feature 'Tweets', type: :feature do
  let(:my_user) { User.create(username: 'Chinasa', password: '123456') }
  context ' Successful tweet' do
    scenario 'Tweet create successfully' do
      visit new_user_session_path
      fill_in 'username', with: my_user.username
      fill_in 'password', with: my_user.password
      click_on 'Log In'
      click_on 'TWEETS'
      fill_in 'text', with: 'My wonderful tweet'
      click_on 'Post a tweet'
      expect(page).to have_content('Tweet was successfully created')
    end
  end

  context 'Edit user profile' do
    scenario 'Edit profile' do
      visit new_user_session_path
      fill_in 'username', with: my_user.username
      fill_in 'password', with: my_user.password
      click_on 'Log In'
      click_on 'Profile'
      fill_in 'current password', with: my_user.password
      click_on 'Update Changes'
      expect(page).to have_content('Your account has been updated successfully')
    end
  end
end
