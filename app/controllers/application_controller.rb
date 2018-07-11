class ApplicationController < ActionController::Base

  before_action :authorized?
  helper_method :get_logged_in_user


  private
  def log_in_user(user_id)
    session[:user_id] = user_id
  end

  def logged_in_user_id
    session[:user_id]
  end

  def get_logged_in_user
    @logged_in_user = User.find(logged_in_user_id) if logged_in_user_id
  end

  def authorized?
    redirect_to login_path unless !!get_logged_in_user
  end

end
