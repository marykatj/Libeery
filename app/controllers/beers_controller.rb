class BeersController < ApplicationController

  skip_before_action :authorized?, only: %i[index]

  def index
    @favorite = Favorite.new
    if params[:q]
      @featured_beers = Beer.find_by_name_or_brewery(params[:q])
    else
      # @beers = Beer.all
      @featured_beers = Beer.featured_beers
    end
    @all_beers = Beer.all
    @beer_count = @all_beers.count
  end

  def new
    @breweries = Beer.fetch_breweries
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

    @user = get_logged_in_user
    @post = Post.new
  end

  # def favorites
  #   type = params[:type]
  #   if type == "favorite"
  #     @user = get_logged_in_user
  #     @user.favorites << @beer
  #     redirect_to :back, notice: "You favorited #{@beer.name}"
  #
  #   elsif type == "unfavorite"
  #     get_logged_in_user.favorites.delete(@beer)
  #     redirect_to :back, notice: "Unfavorited #{@beer.name}"
  #
  #   else
  #     redirect_to :back, notice: "Nothing happened."
  #   end
  # end

  private

  def beer_params
    params.require(:beer).permit(:q, :name, :abv, :style, :brewery, posts_attributes: [:user_id, :description, :image_file, category_ids:[]])
  end

end
