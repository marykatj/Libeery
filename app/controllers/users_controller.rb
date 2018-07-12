class UsersController < ApplicationController

  skip_before_action :authorized?, only: %i[new create]
  before_action :fetch_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(:name, :location, :password, :password_confirmation))
    if @user.save
      log_in_user(@user.id)
      # get_logged_in_user
      redirect_to @user #change to account creation path
    else
      redirect_to login_path
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params(:location))
      redirect_to @user #change to account creation path
    else
      render :edit
    end
  end

  def destroy
    # session.delete(:user_id)
    # @user.destroy # crashes for some reason
    # redirect_to root #static view page for deletion
  end

  private

  def user_params(*args)
    params.require(:user).permit(args)
  end

  def fetch_user
    @user = User.find(params[:id])
  end


end
