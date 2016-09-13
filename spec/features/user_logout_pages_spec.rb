require 'rails_helper'

describe 'user logout path' do
  it 'will allow a user to logout' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Log in'
    fill_in 'Email', :with => 'User'
    fill_in 'Password', :with => '1234'
    click_on 'Log in'
    click_on 'Log out'
    expect(page).to have_content("You've been logged out successfully")
  end
end
