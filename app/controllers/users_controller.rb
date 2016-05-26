class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:new, :create]

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])  
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:notice] = "#{@user.name.capitalize} has been created!"
      redirect_to users_path
    else
      flash.now[:warning] = "No user has been created!"
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash.now[:notice] = "#{user.name} was removed."
  end

  def new
    @user = User.new
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
