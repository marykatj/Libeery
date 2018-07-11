class BeersController < ApplicationController

  def index
    if params[:q]
      @beers = Beer.find_by_name(params[:q])
    else
      @beers = Beer.all
    end
    @all_beers = Beer.all
  end

  def new
    @beer = Beer.new
    @beer.posts.build
    @user = get_logged_in_user

  end

  def create
    @user = get_logged_in_user
    Beer.create(beer_params)
    redirect_to user_path(@user)
  end

  def show
    @beer = Beer.find(params[:id])
    @categories = @beer.fetch_categories
  end

  private

  def beer_params
    params.require(:beer).permit(:q, :name, :abv, :style, :brewery, posts_attributes: [:user_id, :description, :image_file])
  end

end
