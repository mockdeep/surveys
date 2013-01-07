require 'spec_helper'

describe 'User Logout' do
  context 'when User has already created an account' do
    subject {page}
    let(:user) { FactoryGirl.create(:user) }

    context "when a users clicks the logout button" do
      it "the user is logged out" do
        visit '/signin'
        fill_in "Email", :with => user.email
        fill_in "Password", :with => user.password
        click_button "log in"
        page.should have_content("Signed in as: #{user.email}")
        page.should have_link('Sign out', :href => '/signout')
        page.should_not have_content('Viewing as a guest')
        click_link 'Sign out'

        page.should_not have_content("Signed in as: #{user.email}")
        page.should_not have_link('Sign out', :href => '/signout')
        page.should have_content('Viewing as a guest')
      end
    end
  end
end
