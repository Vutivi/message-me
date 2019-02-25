class SessionController < ApplicationController
  def new
    if logged_in?
      flash[:positive] = "Already signed in!"
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    user = User.find_by(username: params[:session][:username])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:positive]   = "You have been succesfully signed in!"
      redirect_to root_path
    else
      flash.now[:negative] = "Wrong username/password!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:positive]   = "succesfully signed out!"
    redirect_to sign_in_path
  end
end
