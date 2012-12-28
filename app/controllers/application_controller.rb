class ApplicationController < ActionController::Base
  protect_from_forgery
  force_ssl

  before_filter :authenticate_user!

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authenticate_user!
    redirect_to signin_path unless current_user
  end
end
