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

  def create
  	@spot = Spot.new(spot_params)
  	if @spot.save
  		redirect_to spot_path(@spot)
  	  else
  	    redirect_to new_spot_path
  	end
  end

  private
  
  def spot_params
  	params.require(:spot).permit([:name, :address, :phone, :website, :price, :photo])

  end

  def load_spot
  	@spot = Spot.find(params[:id])
  end
end
