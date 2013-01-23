require 'spec_helper'

describe 'survey creation' do
  context "when a user first visists the website" do
    it 'they see all the surveys' do
      visit '/'
      within("body") do
        page.should have_content('Surveys')
      end
      click_link "Create Survey"

      name = Faker::Lorem.sentence
      content1 = Faker::Lorem.sentence
      content2 = Faker::Lorem.sentence
      fill_in "Name", :with => name
      fill_in "Body", :with => "#{content1} _place_ #{content2} _date_"
      click_button "Submit"
      page.should have_content(name)

      click_link name
      page.should have_content(content1)
      page.should have_content(content2)
      fill_in "place", :with => "San Francisco"
      fill_in "date", :with => 'Jan 1st'
      click_button "Submit"

      page.should have_content('Surveys')
    end
  end
end
