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

    scenario 'Fail to create Tweet successfully' do
      visit new_user_session_path
      fill_in 'username', with: my_user.username
      fill_in 'password', with: my_user.password
      click_on 'Log In'
      click_on 'TWEETS'
      fill_in 'text',
              with: 'My wonderful tweet says I dont agree with the concept of moving validation to the controller okayn'
      click_on 'Post a tweet'
      expect(page).to have_content('New Tweet')
    end
  end
end

RSpec.feature 'Tweets', type: :feature do
  let(:my_user) { User.create(username: 'Chinasa', password: '123456') }

  context 'Edit user account' do
    scenario 'Edit account successfully' do
      visit new_user_session_path
      fill_in 'username', with: my_user.username
      fill_in 'password', with: my_user.password
      click_on 'Log In'
      click_on 'EDIT ACCOUNT'
      fill_in 'current password', with: my_user.password
      click_on 'Update Changes'
      expect(page).to have_content('Your account has been updated successfully')
    end

    scenario 'Fail to Edit account successfully' do
      visit new_user_session_path
      fill_in 'username', with: my_user.username
      fill_in 'password', with: my_user.password
      click_on 'Log In'
      click_on 'EDIT ACCOUNT'
      fill_in 'current password', with: ''
      click_on 'Update Changes'
      expect(page).to have_content("Current password can't be blank")
    end
  end
end
