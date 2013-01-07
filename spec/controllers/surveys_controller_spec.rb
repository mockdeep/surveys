require 'spec_helper'

describe SurveysController do
  describe '#index' do
    it 'gets' do
      get :index
    end
  end
end
