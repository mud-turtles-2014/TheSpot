class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new(user_id: session[:user_id], spot_id: params[:spot_id])
      if @favorite.save
        redirect_to spots_path
      else
        redirect_to spot_path(Spot.find(params[:spot_id]))
      end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to spots_path
  end

end