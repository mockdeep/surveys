require 'spec_helper'

describe SurveysController do

  describe '#index' do
    it 'gets' do
      get :index
    end
  end

  describe "#new" do
    it 'instantiates a survey' do
      get :new
      assigns(:survey).should_not be_persisted
    end
  end

end
