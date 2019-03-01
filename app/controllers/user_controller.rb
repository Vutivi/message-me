class UserController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:positive] = "Welcome to Message me. Start sending messages!"
      redirect_to root_path
    else
      flash[:negative] = "Error registering user!"
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :password)
    end
end
