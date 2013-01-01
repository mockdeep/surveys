class ApplicationController < ActionController::Base
  protect_from_forgery
  force_ssl

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authenticate_user!
    redirect_to signin_path unless current_user
  end

  def rediect_if_logged_in
    redirect_to root_path if current_user
  end
end
