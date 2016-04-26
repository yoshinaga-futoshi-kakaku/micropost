class UsersController < ApplicationController
  before_action :set_users, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "welcome to the sample app"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to user_path, notice: "ok"
    else
      @users = User.all
      flash.now[:alert] = "faild"
      render "edit"
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,:age,:favorite)
  end
  
  def set_users
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to root_path
    end
  end
end
