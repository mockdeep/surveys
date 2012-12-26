require 'spec_helper'

describe SessionsController do

  describe '#new' do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe '#create' do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe '#destroy' do
    it "returns http success" do
      get 'destroy'
      response.should be_success
    end
  end

end
