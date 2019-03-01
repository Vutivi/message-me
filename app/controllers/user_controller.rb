class UserController < ApplicationController
  def new
    if logged_in?
      flash[:positive] = "Already signed in!"
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if params[:user][:password] != params[:user][:confirm_password]
      flash[:negative] = "Passwords are not the same."
      render :new
    else
      if user.save
        session[:user_id] = user.id
        flash[:positive] = "Welcome to Message me. Start sending messages!"
        redirect_to root_path
      else
        flash[:negative] = "Error registering user!"
        render :new
      end
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :password)
    end
end
