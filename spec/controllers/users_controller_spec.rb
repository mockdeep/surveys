require 'spec_helper'

describe UsersController do

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

end
