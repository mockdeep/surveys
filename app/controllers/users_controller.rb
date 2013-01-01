class UsersController < ApplicationController
  before_filter :rediect_if_logged_in, :only => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Congrats, you didn't screw up filling out the form"
    else
      render "new"
    end
  end
end
