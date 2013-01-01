require 'spec_helper'

describe SessionsController do

  before :each do
    @request.env['HTTPS'] = 'on'
  end

  describe '#new' do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe '#create' do
    it "returns http success" do
      post 'create'
      response.should be_success
    end
  end

  describe '#destroy' do
    it "returns http success" do
      delete 'destroy'
      response.should be_redirect
    end
  end

end
