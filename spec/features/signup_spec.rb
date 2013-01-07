require 'spec_helper'

describe "User Signup" do
  context "when a user first visists the website" do
    it "they see the login page" do
      visit "/"
      page.should have_content('Viewing as a guest')
      page.should have_link('Sign In', :href => '/signin')
      page.should have_link('Sign Up', :href => '/signup')
      page.should have_content('Yay! Index!')
    end
  end

  context  "when a user creates a new account with invalid parameters" do
    it "they get error messages" do
      visit '/'
      click_link "Sign Up"
      page.should have_content('Viewing as a guest')
      page.should have_link('Sign In', :href => '/signin')
      page.should have_link('Sign Up', :href => '/signup')

      click_button "Create User"
      page.should have_content("Email can't be blank")
      page.should have_content("Password can't be blank")
      page.should have_content("Password confirmation can't be blank")
    end
  end

  context "when a user creates a new account with valid parameters" do
    it  "they get redirected to the home page" do
      visit '/'
      click_link "Sign Up"
      fill_in "Email", :with => 'SamRuby@gmail.com'
      fill_in "Password", :with => 123456
      fill_in "Password confirmation", :with => 123456

      click_button "Create User"
      page.should have_content("Yay! Index!")
    end
  end
end
