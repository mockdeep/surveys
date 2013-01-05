require 'spec_helper'

describe 'User Signup' do
  context 'No user account' do
    it 'when I first come to the website' do
      visit '/'
      page.should have_content('Viewing as a guest')
      page.should have_link('Sign In', :href => '/signin')
      page.should have_link('Sign Up', :href => '/signup')
      page.should have_content('Log in')
      page.should have_field('Email')
      page.should have_field('Password')
      page.should have_button('log in')
    end

    it "when I create a new account with invalid parameters" do
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

    it "when I create a new account with valid parameters" do
      visit '/'
      click_link "Sign Up"
      fill_in "Email", :with => 'SamRuby@gmail.com'
      fill_in "Password", :with => 123456
      fill_in "Password confirmation", :with => 123456

      click_button "Create User"
      page.should have_content("Log in")
    end
  end
end
