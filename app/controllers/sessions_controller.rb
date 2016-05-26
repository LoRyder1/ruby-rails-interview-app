class SessionsController < ApplicationController
  # skip_before_filter :require_login
  
  def new
    if logged_in?
      redirect_to root_path
    else
      @session = nil
    end   
  end

  def create
    user = User.authenticate(params[:user_email], params[:user_password])
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:error] = "Invalid email or password"
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
