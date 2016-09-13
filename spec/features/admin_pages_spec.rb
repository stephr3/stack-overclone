require 'rails_helper'

describe 'View users path' do
  it "will allow admin to view a list of users" do
    admin = FactoryGirl.create(:user, :admin => true)
    visit root_path
    click_link 'Log in'
    fill_in 'Email', :with => 'User'
    fill_in 'Password', :with => '1234'
    click_on 'Log in'
    click_on 'Manage Users'
    expect(page).to have_content('User | true')
  end
end
