class SurveyResponsesController < ApplicationController
  def new
    @survey = Survey.find(params[:survey_id])
  end

  def create
    @survey = Survey.find(params[:survey_id])
    blanks = @survey.blanks
    names = blanks.collect(&:name)
    if names.any? { |name| params[name].blank? }
      flash.now[:error] = "all blanks must be filled out"
      render :new
      return
    end

    blanks.each do |blank|
      Response.create!({
        :blank => blank,
        :text => params[blank.name],
      })
    end
    redirect_to root_path
  end
end
