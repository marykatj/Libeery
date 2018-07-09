class UsersController < ApplicationController

  before_action :fetch_user, only: [:show, :edit, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(:name, :location))
    if @user.save
      redirect_to root #change to account creation path
    else
      render :new
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
    @user.destroy
    redirect_to root #static view page for deletion
  end

  private

  def user_params(*args)
    params.require(:user).permit(args)
  end

  def fetch_user
    @user = User.find(params[:id])
  end


end
