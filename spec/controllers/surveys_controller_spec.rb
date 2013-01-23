require 'spec_helper'

describe SurveysController do

  describe '#index' do
    it 'initializes a group of surveys' do
      survey = FactoryGirl.create(:survey)
      get :index
      assigns(:surveys).should eq [survey]
    end
  end

  describe "#new" do
    it 'instantiates a survey' do
      get :new
      assigns(:survey).should_not be_persisted
    end
  end

  describe "#create" do
    context 'when the survey is valid' do
      it 'redirects to root path' do
        post(:create, :survey => FactoryGirl.attributes_for(:survey))
        response.should redirect_to root_path
      end
    end

    context 'when the survey is invalid' do
      before :each do
        Survey.any_instance.stub(:save).and_return(false)
        post(:create)
      end

      it 'renders the "new" view' do
        response.should render_template 'new'
      end
    end
  end
end
