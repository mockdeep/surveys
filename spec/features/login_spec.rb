require 'spec_helper'

describe 'User login' do
  context 'when not logged in' do
    it 'when I first come to the website' do
      visit '/'
      page.should have_content('welcome')
    end
  end
end
