class SessionsController < ApplicationController

  skip_before_action :authorized?, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: user_params[:name])
    if @user && @user.authenticate(user_params[:password])
      log_in_user(@user.id)
      redirect_to user_path(get_logged_in_user)
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
