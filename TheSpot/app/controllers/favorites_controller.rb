class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.create(user_id: session[:id], spot_id: params[:id])
    redirect_to spots_path
  end

end