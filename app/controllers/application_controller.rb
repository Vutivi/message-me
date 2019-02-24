class ApplicationController < ActionController::Base
  helper_methods :logged_in?, :current_user

  def current_user
    @current_user ||= User.find_by(username: session[:user_id]) if session[:user_id]
  end

  def logged_in
    !!current_user
  end

  def require_user
    if !logged_in
      flash[:error] = "Not Authorized"
      redirect_to sign_in_path
    end
  end
end
