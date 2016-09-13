require 'rails_helper'
require 'launchy'

describe 'View users path' do
  it "will allow admin to view a list of users" do
    admin = FactoryGirl.create(:user, :email => 'Admin', :admin => true)
    visit root_path
    click_link 'Log in'
    fill_in 'Email', :with => 'Admin'
    fill_in 'Password', :with => '1234'
    click_on 'Log in'
    click_on 'Manage Users'
    expect(page).to have_content('Admin | true')
  end

  it "will not allow a non-admin to view the list of users" do
    user = FactoryGirl.create(:user, :email => "test_user")
    visit root_path
    click_link 'Log in'
    fill_in 'Email', :with => 'test_user'
    fill_in 'Password', :with => '1234'
    click_on 'Log in'
    visit users_path
    expect(page).to have_content('You are not authorized')
  end

  it "requires users to login to view admin pages" do
    visit users_path
    expect(page).to have_content('You are not logged in')
  end

  it "will allow admin to update a user's admin status" do
    admin = FactoryGirl.create(:user, :email => "Admin", :admin => true)
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Log in'
    fill_in 'Email', :with => 'User'
    fill_in 'Password', :with => '1234'
    click_on 'Log in'
    click_on 'Manage Users'
    click_on 'Make Admin'
    expect(page).to have_content('User | true')
  end
end
