class SessionController < ApplicationController
  def new
    if logged_in?
      flash[:success] = "Already signed in!"
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    user = User.find_by(username: params[:session][:username])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success]   = "You have been succesfully logged in!"
      redirect_to root_path
    else
      flash.now[:danger] = "Wrong username/password!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success]   = "succesfully signed out!"
    redirect_to root_path
  end
end
