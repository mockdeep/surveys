class SurveysController < ApplicationController
  def index
  end

  def new
    @survey = Survey.new
    p @survey
  end
end
