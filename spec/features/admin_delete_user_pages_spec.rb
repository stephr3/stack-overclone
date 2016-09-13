require 'rails_helper'

describe "the delete user path" do
  it "will allow admin to delete a user" do
    user = FactoryGirl.create(:user)
    admin = FactoryGirl.create(:user, :email => "Admin", :admin => true)
    visit root_path
    click_link 'Log in'
    fill_in 'Email', :with => 'Admin'
    fill_in 'Password', :with => '1234'
    click_on 'Log in'
    click_on 'Manage Users'
    click_on 'Delete User'
    expect(page).to have_no_content('User | false')
  end
end
