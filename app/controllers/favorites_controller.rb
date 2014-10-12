class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.create(user_id: session[:id], spot_id: params[:spot_id])
    redirect_to spots_path
  end

end