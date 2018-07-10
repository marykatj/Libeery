class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: user_params[:name])
    if @user && @user.authenticate(user_params[:password])
      log_in_user(@user.id)
      user_path(logged_in_user_id)
    else
      flash[:notice] = "Invalid login"
      redirect_to login_path
    end
  end

  def destroy

  end

  private
  def user_params
    params.require(:session).permit(:name, :password)
  end
end
