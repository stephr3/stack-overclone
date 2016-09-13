require 'rails_helper'

describe "Add user path" do
  it "will allow a new user to sign up" do
    visit root_path
    click_link 'Create Account'
    fill_in "Email", :with => "User"
    fill_in "Password", :with => "1234"
    fill_in "Password confirmation", :with => "1234"
    click_on "Sign Up"
    expect(page).to have_content("Welcome to the site!")
  end

  it "will produce error when user is not saved" do
    visit root_path
    click_link 'Create Account'
    fill_in "Email", :with => ""
    fill_in "Password", :with => "1234"
    fill_in "Password confirmation", :with => "1234"
    click_on "Sign Up"
    expect(page).to have_content("There was a problem creating your account. Please try again.")
  end
end
