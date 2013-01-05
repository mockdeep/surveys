require 'spec_helper'

describe 'User Login' do
  context 'User has already created an account' do
    subject {page}
    let(:user) { FactoryGirl.create(:user) }

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

    it "when I log in with invalid parameters" do
      visit '/'
      click_button "log in"

      page.should have_content('Viewing as a guest')
      page.should have_link('Sign In', :href => '/signin')
      page.should have_link('Sign Up', :href => '/signup')
      page.should_not have_content('Signed in as:')
    end

    it "when I log in with valid parameters" do
      visit '/'
      fill_in "Email", :with => user.email
      fill_in "Password", :with => user.password
      click_button "log in"

      page.should_not have_content('Viewing as a guest')
      page.should_not have_link('Sign In', :href => '/signin')
      page.should_not have_link('Sign Up', :href => '/signup')
      page.should have_content("Signed in as: #{user.email}")
      page.should have_link('Sign out', :href => '/signout')
    end
  end
end
