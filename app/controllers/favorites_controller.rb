class FavoritesController < ApplicationController

  def create
    @user = get_logged_in_user
    @favorite = Favorite.new(params.require(:favorite).permit(:beer_id))
    @user.favorites << @favorite
    flash[:notice] = "You favorited #{@favorite.beer.name}"
    redirect_to beers_path
  end

  def destroy
    @favorites = Favorite.where("user_id = ?", logged_in_user_id)
    @favorite = @favorites.find(params.require(:favorite).permit(:beer_id))
    @beer = @favorite.beer.name
    @favorite.destroy
    flash[:notice] = "Unfavorited #{@beer}"
    redirect_to beer_path
  end
end
