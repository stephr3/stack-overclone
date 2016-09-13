require 'rails_helper'

describe 'log in a user path' do
  it 'will allow a user to login' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Log in'
    fill_in 'Email', :with => 'User'
    fill_in 'Password', :with => '1234'
    click_on 'Log in'
    expect(page).to have_content('You are logged in as User')
  end

  it 'will produce error when user is not authenticated' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Log in'
    fill_in 'Email', :with => 'User'
    fill_in 'Password', :with => 'badpassword'
    click_on 'Log in'
    expect(page).to have_content('There was a problem with your login!')
  end

end
