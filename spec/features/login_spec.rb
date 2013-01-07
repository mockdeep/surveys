require 'spec_helper'

describe 'User Login' do
  context 'when User has already created an account' do
    subject {page}
    let(:user) { FactoryGirl.create(:user) }

    context "when a user first visists the website" do
      it 'they see the login page' do
        visit '/signin'
        page.should have_content('Viewing as a guest')
        page.should have_link('Sign In', :href => '/signin')
        page.should have_link('Sign Up', :href => '/signup')
        page.should have_content('Log in')
        page.should have_field('Email')
        page.should have_field('Password')
        page.should have_button('log in')
      end
    end

    context "when a user logs in with invalid parameters" do
      it "they should not be logged in" do
        visit '/signin'
        click_button "log in"

        page.should have_content('Viewing as a guest')
        page.should have_link('Sign In', :href => '/signin')
        page.should have_link('Sign Up', :href => '/signup')
        page.should_not have_content('Signed in as:')
      end
    end

    context "when a user logs in with invalid parameters" do
      it "they should not be logged in" do
        visit '/signin'
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
end
