class SpotsController < ApplicationController
  before_filter :load_spot, only: [:show]
  def index
  	@spots = Spot.all
  end

  def show
  end

  def new
  	@spot = Spot.new
  end

  private
  
  def spot_params
  	params.require(:user).permit([:name, :address, :phone, :website, :price, :photo])

  end

  def load_spot
  	@spot = Spot.find(params[:id])
  end
end
